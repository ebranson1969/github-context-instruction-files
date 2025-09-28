# Project Prompt Example 0: Code Review Scenario

## Scenario Description
*This section sets up the real-world context and business situation that prompted the need for AI assistance. It explains the background, stakeholders involved, and why this particular type of prompt is needed.*

A developer has created a new REST API endpoint for user authentication and needs a thorough code review before merging to production. The code handles sensitive user data and requires security validation.

## Context Information
*This section provides specific technical details about the project environment, technology stack, and constraints that will influence the AI's response. Include details like frameworks, databases, team size, compliance requirements, etc.*

- **Project:** E-commerce Web Application
- **Technology Stack:** Node.js, Express, MongoDB, JWT
- **File:** `src/routes/auth.js`
- **Feature:** User login endpoint with JWT token generation

## Code Under Review
*This section contains the actual code, configuration, or content that needs analysis. Keep it realistic and representative of actual work scenarios. Include enough context for meaningful analysis.*

```javascript
const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/User');
const router = express.Router();

router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  
  const user = await User.findOne({ email: email });
  if (!user) {
    return res.status(401).json({ message: 'Invalid credentials' });
  }
  
  const validPassword = await bcrypt.compare(password, user.password);
  if (!validPassword) {
    return res.status(401).json({ message: 'Invalid credentials' });
  }
  
  const token = jwt.sign(
    { userId: user._id, email: user.email },
    process.env.JWT_SECRET,
    { expiresIn: '24h' }
  );
  
  res.json({ 
    token: token,
    user: {
      id: user._id,
      email: user.email,
      name: user.name
    }
  });
});

module.exports = router;
```

## Applied Prompt Template
*This section shows how to properly use the project prompt template from .github/prompts/project.prompt.md. It demonstrates the correct format, context inclusion, and specific requirements to get the best AI response.*

Using the **Code Review Prompt** from `.github/prompts/project.prompt.md`:

```
Please review the following code for:
- Code quality and best practices
- Potential bugs or issues
- Performance considerations
- Alignment with project standards
- Documentation completeness

Context: Node.js authentication endpoint for e-commerce application
Security Requirements: JWT tokens, bcrypt password hashing, input validation
Project Standards: RESTful APIs, error handling, logging, rate limiting

[CODE INSERTED ABOVE]
```

## Expected AI Response Structure
*This section shows what kind of response you should expect from the AI when using the prompt correctly. It serves as both a quality benchmark and a template for consistent AI interactions across your team.*

```
## Code Review Analysis

### ✅ Strengths
- Proper bcrypt usage for password comparison
- JWT token generation with expiration
- Consistent error messages to prevent user enumeration
- Clean async/await syntax

### ⚠️ Issues Found

#### Security Concerns
1. **Missing Input Validation**: No validation for email format or password requirements
2. **No Rate Limiting**: Endpoint vulnerable to brute force attacks
3. **Missing CORS Configuration**: Potential cross-origin issues

#### Code Quality
1. **Error Handling**: Should use try-catch for database operations
2. **Logging**: No audit logging for authentication attempts
3. **Environment Variables**: JWT_SECRET should be validated on startup

#### Performance
1. **Database Query**: Consider adding email index for faster lookups
2. **Response Size**: Minimize user data in response

### 🔧 Recommendations
1. Add input validation middleware
2. Implement rate limiting (express-rate-limit)
3. Add comprehensive error handling
4. Include audit logging for security events
5. Add API documentation
```

## Key Learning Points
*This section summarizes the most important takeaways about effective prompt usage. It highlights best practices, common mistakes to avoid, and tips for getting better results from AI assistance.*

- Always include relevant project context when requesting code reviews
- Specify security requirements for sensitive endpoints
- Request structured responses for easier action item tracking
- Include both positive feedback and improvement areas
