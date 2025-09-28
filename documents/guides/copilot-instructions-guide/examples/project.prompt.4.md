# Project Prompt Example 4: Code Refactoring Scenario

## Scenario Description
An existing user management module has grown complex and difficult to maintain. The code handles user registration, authentication, profile updates, and password management in a single large class. Performance issues have emerged, and adding new features requires extensive changes.

## Context Information
- **Project:** Customer Relationship Management (CRM) System
- **Technology Stack:** Java, Spring Boot, MySQL, Redis
- **Current Issues:** Long methods, tight coupling, difficult testing, performance bottlenecks
- **Goals:** Improve maintainability, testability, and performance

## Legacy Code to Refactor
```java
@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private EmailService emailService;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    
    // 150+ line method handling user registration
    public User registerUser(UserRegistrationRequest request) {
        // Validate email format
        if (!request.getEmail().matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            throw new ValidationException("Invalid email format");
        }
        
        // Check if user already exists
        User existingUser = userRepository.findByEmail(request.getEmail());
        if (existingUser != null) {
            throw new UserAlreadyExistsException("User already exists");
        }
        
        // Validate password strength
        String password = request.getPassword();
        if (password.length() < 8 || 
            !password.matches(".*[A-Z].*") || 
            !password.matches(".*[a-z].*") || 
            !password.matches(".*[0-9].*")) {
            throw new ValidationException("Password too weak");
        }
        
        // Create user entity
        User user = new User();
        user.setEmail(request.getEmail());
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setPassword(passwordEncoder.encode(password));
        user.setCreatedAt(LocalDateTime.now());
        user.setActive(false);
        
        // Generate verification token
        String token = UUID.randomUUID().toString();
        user.setVerificationToken(token);
        
        // Save to database
        User savedUser = userRepository.save(user);
        
        // Send verification email
        try {
            String emailBody = generateVerificationEmail(user.getFirstName(), token);
            emailService.sendEmail(user.getEmail(), "Verify Your Account", emailBody);
        } catch (Exception e) {
            // If email fails, delete the user and throw exception
            userRepository.delete(savedUser);
            throw new EmailDeliveryException("Failed to send verification email");
        }
        
        // Cache user data
        redisTemplate.opsForValue().set("user:" + savedUser.getId(), savedUser, 3600, TimeUnit.SECONDS);
        
        // Log registration event
        System.out.println("User registered: " + savedUser.getEmail());
        
        return savedUser;
    }
    
    // Similar large methods for login, updateProfile, resetPassword, etc.
    // Total class: 800+ lines
}
```

## Applied Prompt Template
Using the **Code Refactoring Prompt** from `.github/prompts/project.prompt.md`:

```
Suggest refactoring improvements for:
- Code maintainability
- Performance optimization
- Readability enhancement
- Pattern implementation
- Modularity improvements

Context: Java Spring Boot CRM system, user management module
Current Issues: 800+ line service class, tight coupling, difficult testing
Architecture: Layered architecture with repositories, services, controllers
Team: 4 developers, emphasis on clean code and testability

[CODE TO REFACTOR INSERTED ABOVE]
```

## Expected AI Response Structure
```
## Code Refactoring Analysis & Recommendations

### Current Issues Identified

#### Maintainability Problems
1. **God Class Anti-pattern**: Single class handles too many responsibilities
2. **Long Methods**: 150+ line methods violate single responsibility principle
3. **Tight Coupling**: Direct dependencies on multiple services reduce flexibility
4. **Poor Error Recovery**: Inconsistent exception handling and rollback logic

#### Performance Issues
1. **Synchronous Email Sending**: Blocks user registration process
2. **Inefficient Caching**: Manual cache management without consistency
3. **Database Transaction Scope**: No proper transaction boundaries

#### Testing Challenges
1. **Hard to Mock**: Multiple dependencies make unit testing difficult
2. **Integration Dependencies**: Tests require full Spring context
3. **No Separation of Concerns**: Business logic mixed with infrastructure

### Refactoring Strategy

#### 1. Apply Single Responsibility Principle
Break down the monolithic service into focused components:

```java
// Separate validation logic
@Component
public class UserValidator {
    public void validateRegistrationRequest(UserRegistrationRequest request) {
        validateEmail(request.getEmail());
        validatePassword(request.getPassword());
        validateRequiredFields(request);
    }
    
    private void validateEmail(String email) {
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            throw new ValidationException("Invalid email format");
        }
    }
    
    private void validatePassword(String password) {
        if (password.length() < 8 || 
            !containsUpperCase(password) || 
            !containsLowerCase(password) || 
            !containsDigit(password)) {
            throw new ValidationException("Password requirements not met");
        }
    }
}

// Extract user creation logic
@Service
public class UserFactory {
    private final PasswordEncoder passwordEncoder;
    
    public User createUser(UserRegistrationRequest request) {
        User user = new User();
        user.setEmail(request.getEmail());
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setCreatedAt(LocalDateTime.now());
        user.setActive(false);
        user.setVerificationToken(generateVerificationToken());
        return user;
    }
    
    private String generateVerificationToken() {
        return UUID.randomUUID().toString();
    }
}

// Async notification service
@Service
public class UserNotificationService {
    private final EmailService emailService;
    
    @Async
    @Retryable(value = {EmailDeliveryException.class}, maxAttempts = 3)
    public CompletableFuture<Void> sendVerificationEmail(User user) {
        String emailBody = generateVerificationEmail(user.getFirstName(), 
                                                   user.getVerificationToken());
        emailService.sendEmail(user.getEmail(), "Verify Your Account", emailBody);
        return CompletableFuture.completedFuture(null);
    }
}
```

#### 2. Implement Proper Transaction Management
```java
@Service
@Transactional
public class UserRegistrationService {
    private final UserValidator validator;
    private final UserFactory userFactory;
    private final UserRepository userRepository;
    private final UserNotificationService notificationService;
    private final UserCacheService cacheService;
    
    public User registerUser(UserRegistrationRequest request) {
        // Validation (fail fast)
        validator.validateRegistrationRequest(request);
        
        // Check uniqueness
        if (userRepository.existsByEmail(request.getEmail())) {
            throw new UserAlreadyExistsException("User already exists");
        }
        
        // Create and save user (transactional)
        User user = userFactory.createUser(request);
        User savedUser = userRepository.save(user);
        
        // Async operations (outside transaction)
        notificationService.sendVerificationEmail(savedUser);
        cacheService.cacheUser(savedUser);
        
        return savedUser;
    }
}
```

#### 3. Extract Caching Concerns
```java
@Service
public class UserCacheService {
    private final RedisTemplate<String, Object> redisTemplate;
    private static final String USER_CACHE_PREFIX = "user:";
    private static final int CACHE_TTL = 3600;
    
    @Cacheable(value = "users", key = "#userId")
    public User getCachedUser(Long userId) {
        return (User) redisTemplate.opsForValue().get(USER_CACHE_PREFIX + userId);
    }
    
    @CachePut(value = "users", key = "#user.id")
    public User cacheUser(User user) {
        redisTemplate.opsForValue().set(
            USER_CACHE_PREFIX + user.getId(), 
            user, 
            CACHE_TTL, 
            TimeUnit.SECONDS
        );
        return user;
    }
    
    @CacheEvict(value = "users", key = "#userId")
    public void evictUser(Long userId) {
        redisTemplate.delete(USER_CACHE_PREFIX + userId);
    }
}
```

#### 4. Improve Error Handling
```java
@Service
public class UserRegistrationService {
    
    @Transactional(rollbackFor = Exception.class)
    public User registerUser(UserRegistrationRequest request) {
        try {
            return processRegistration(request);
        } catch (ValidationException | UserAlreadyExistsException e) {
            // Business logic exceptions - don't retry
            throw e;
        } catch (DataAccessException e) {
            // Database exceptions - log and convert
            log.error("Database error during user registration", e);
            throw new UserRegistrationException("Unable to complete registration");
        }
    }
}
```

### Performance Improvements

#### 1. Asynchronous Processing
- Move email sending to background queue
- Use `@Async` for non-critical operations
- Implement proper error handling for async operations

#### 2. Caching Strategy
- Use Spring Cache annotations for declarative caching
- Implement cache warming strategies
- Add cache monitoring and metrics

#### 3. Database Optimization
- Add proper indexes on frequently queried fields
- Use batch operations where applicable
- Implement connection pooling optimization

### Testing Strategy

#### Unit Tests (Now Possible)
```java
@ExtendWith(MockitoExtension.class)
class UserValidatorTest {
    
    @InjectMocks
    private UserValidator userValidator;
    
    @Test
    void shouldValidateValidEmail() {
        UserRegistrationRequest request = createValidRequest();
        assertDoesNotThrow(() -> userValidator.validateRegistrationRequest(request));
    }
    
    @Test
    void shouldRejectInvalidEmail() {
        UserRegistrationRequest request = createRequestWithInvalidEmail();
        assertThrows(ValidationException.class, 
                    () -> userValidator.validateRegistrationRequest(request));
    }
}
```

#### Integration Tests
```java
@SpringBootTest
@Transactional
class UserRegistrationServiceIntegrationTest {
    
    @Autowired
    private UserRegistrationService registrationService;
    
    @MockBean
    private UserNotificationService notificationService;
    
    @Test
    void shouldRegisterUserSuccessfully() {
        UserRegistrationRequest request = createValidRequest();
        User result = registrationService.registerUser(request);
        
        assertThat(result.getId()).isNotNull();
        assertThat(result.getEmail()).isEqualTo(request.getEmail());
        verify(notificationService).sendVerificationEmail(result);
    }
}
```

### Migration Plan

#### Phase 1: Extract Validators (1 week)
- Create UserValidator class
- Update tests
- Deploy with feature flag

#### Phase 2: Separate Services (2 weeks)
- Extract UserFactory
- Create UserNotificationService
- Implement async processing

#### Phase 3: Caching Refactor (1 week)
- Implement UserCacheService
- Add Spring Cache annotations
- Performance testing

#### Phase 4: Final Integration (1 week)
- Complete UserRegistrationService refactor
- Remove old code
- Documentation updates

### Success Metrics
- **Code Coverage**: Increase from 45% to 85%+
- **Method Complexity**: Reduce average cyclomatic complexity to <10
- **Performance**: Reduce registration response time by 40%
- **Maintainability**: Enable feature additions without modifying core classes
```

## Key Learning Points
- Identify specific anti-patterns and architectural issues
- Provide concrete refactoring solutions with actual code examples
- Include a realistic migration strategy that can be implemented incrementally
- Consider both immediate improvements and long-term architectural benefits
- Always include testing strategy to validate refactoring success
- Define measurable success criteria

---
*Example Type: Code Refactoring*
*Complexity Level: Advanced*
*Focus Areas: Clean Architecture, SOLID Principles, Spring Boot Best Practices*
