# Project Prompt Example 0: Code Review Scenario

## Scenario Description
*This section sets up the real-world context and business situation that prompted the need for AI assistance. It explains the background, stakeholders involved, and why this particular type of prompt is needed.*

**REAL SITUATION**: Sarah, a mid-level developer, just finished implementing a user authentication endpoint for the company's e-commerce platform. It's 4:30 PM on Thursday, and she wants to submit her pull request before the weekend, but she knows authentication code is critical and security-sensitive. Rather than waiting for Monday's code review meeting (which could delay deployment by a week), she uses the project prompt template to get immediate, structured feedback.

**WHY THIS MATTERS**: Authentication bugs in production could:
- Lock out customers (lost revenue)
- Create security vulnerabilities (data breach risk)
- Require emergency hotfixes (team overtime, stress)

**STAKEHOLDERS AFFECTED**: 
- Development team (code quality standards)
- Security team (vulnerability prevention)  
- Product team (deployment timeline)
- Customers (login experience)

A developer has created a new REST API endpoint for user authentication and needs a thorough code review before merging to production. The code handles sensitive user data and requires security validation.

## Context Information
*This section provides specific technical details about the project environment, technology stack, and constraints that will influence the AI's response. Include details like frameworks, databases, team size, compliance requirements, etc.*

**REAL PROJECT DETAILS**:
- **Company**: MegaCommerce Inc. (handles $2M+ daily transactions)
- **Team Size**: 12 developers, 2 security engineers, 1 DevOps engineer
- **Deployment Schedule**: Code freeze Friday 5 PM for weekend traffic
- **Compliance Requirements**: PCI DSS Level 1, SOX compliance for financial data
- **Performance Requirements**: Must handle 1000+ concurrent logins during flash sales
- **Legacy Constraints**: Integrates with 15-year-old user database, can't break existing mobile app

- **Project:** E-commerce Web Application  
- **Technology Stack:** Node.js, Express, MongoDB, JWT
- **File:** `src/routes/auth.js`
- **Feature:** User login endpoint with JWT token generation

## Code Under Review
*This section contains the actual code, configuration, or content that needs analysis. Keep it realistic and representative of actual work scenarios. Include enough context for meaningful analysis.*

**REAL CODE SCENARIO**: This is actual production-style code that Sarah wrote. Notice the realistic issues:
- Basic validation but missing edge cases
- No rate limiting (could be DDoS target)
- Error messages might leak information
- No audit logging for security events
- Database queries could be optimized

```javascript
const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/User');
const router = express.Router();

// Login endpoint - handles 1000+ requests per minute during sales
router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  
  // Find user by email - this query runs 50,000+ times per day
  const user = await User.findOne({ email: email });
  if (!user) {
    return res.status(401).json({ message: 'Invalid credentials' });
  }
  
  // Compare password - bcrypt is CPU intensive
  const validPassword = await bcrypt.compare(password, user.password);
  if (!validPassword) {
    return res.status(401).json({ message: 'Invalid credentials' });
  }
  
  // Generate JWT token - expires in 24 hours for user convenience
  const token = jwt.sign(
    { userId: user._id, email: user.email },
    process.env.JWT_SECRET,
    { expiresIn: '24h' }
  );
  
  // Return user data - frontend needs this for personalization
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

**HOW SARAH ACTUALLY USES THIS**: She copies the base template, then customizes it with specific context:

1. **Copy base template** from `.github/prompts/project.prompt.md`
2. **Add specific context** about her project and concerns
3. **Paste her actual code** 
4. **Submit to AI** and get structured feedback
5. **Use the response** to fix issues before creating PR

Using the **Code Review Prompt** from `.github/prompts/project.prompt.md`:

```
Please review the following code for:
- Code quality and best practices
- Potential bugs or issues  
- Performance considerations
- Alignment with project standards
- Documentation completeness

Context: Node.js authentication endpoint for e-commerce application
Business Context: Handles $2M+ daily transactions, 1000+ concurrent users during flash sales
Security Requirements: PCI DSS Level 1, JWT tokens, bcrypt password hashing, audit logging required
Performance Requirements: <200ms response time, handles 50,000+ daily login attempts
Project Standards: RESTful APIs, error handling with proper HTTP codes, rate limiting, comprehensive logging
Team Constraints: Code freeze Friday 5 PM, integrates with legacy user database
Compliance Notes: SOX compliance required, security team reviews all auth changes

URGENT: Need feedback before Friday code freeze. Focus on security and performance issues that could affect weekend flash sale.

[CODE INSERTED ABOVE]
```

## Expected AI Response Structure
*This section shows what kind of response you should expect from the AI when using the prompt correctly. It serves as both a quality benchmark and a template for consistent AI interactions across your team.*

**REAL AI RESPONSE SARAH RECEIVES**: This is the structured, actionable feedback she gets:

```
## Code Review Analysis - Authentication Endpoint

### ⚠️ CRITICAL ISSUES (Must Fix Before Deployment)

#### 1. **Missing Rate Limiting - HIGH RISK**
- **Problem**: No protection against brute force attacks
- **Business Impact**: Could lock out legitimate users, create DoS vulnerability
- **Fix**: Add express-rate-limit middleware
```javascript
const rateLimit = require('express-rate-limit');
const loginLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 5, // limit each IP to 5 requests per windowMs
  message: 'Too many login attempts, please try again later',
  standardHeaders: true,
  legacyHeaders: false,
});
router.post('/login', loginLimiter, async (req, res) => {
```

#### 2. **Missing Input Validation - MEDIUM RISK**
- **Problem**: No validation for email format or empty fields
- **Security Impact**: Could cause database errors, potentially leak information
- **Fix**: Add validation middleware
```javascript
const { body, validationResult } = require('express-validator');

const validateLogin = [
  body('email').isEmail().normalizeEmail(),
  body('password').isLength({ min: 1 }).trim(),
];

router.post('/login', validateLogin, async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  // ... rest of code
```

#### 3. **Missing Audit Logging - COMPLIANCE RISK**
- **Problem**: No security event logging (SOX compliance requirement)
- **Compliance Impact**: Could fail audit, regulatory fines
- **Fix**: Add structured logging
```javascript
const logger = require('../utils/logger');

// Log all authentication attempts
logger.info('Login attempt', {
  email: email.replace(/(.{3}).*@/, '$1***@'), // Partially mask email
  ip: req.ip,
  userAgent: req.get('User-Agent'),
  timestamp: new Date().toISOString(),
  success: false // Will update if successful
});
```

### ✅ STRENGTHS (Good Practices Found)
- Proper bcrypt usage for password comparison
- JWT token generation with expiration
- Consistent error messages to prevent user enumeration
- Clean async/await syntax
- Appropriate HTTP status codes

### 🔧 PERFORMANCE OPTIMIZATIONS

#### Database Query Optimization
- **Current**: `User.findOne({ email: email })` - table scan on each request
- **Improvement**: Ensure email field has database index
```javascript
// In your User model or database setup:
db.users.createIndex({ "email": 1 });
```

#### Response Time Improvement  
- **Current**: Synchronous bcrypt comparison blocks event loop
- **Consider**: Move to worker thread for CPU-intensive operations during high traffic

### 📋 COMPLIANCE CHECKLIST
- ✅ Passwords properly hashed with bcrypt
- ✅ JWT tokens have reasonable expiration
- ❌ Missing rate limiting (PCI DSS requirement)
- ❌ Missing audit logging (SOX requirement)
- ❌ No input validation (security best practice)

### 🚀 DEPLOYMENT RECOMMENDATION
**BLOCK DEPLOYMENT** - Critical security issues must be resolved first
**Estimated Fix Time**: 2-3 hours
**Priority**: Fix rate limiting and audit logging before Friday code freeze
```

## Key Learning Points
*This section summarizes the most important takeaways about effective prompt usage. It highlights best practices, common mistakes to avoid, and tips for getting better results from AI assistance.*

**WHAT SARAH LEARNED FROM THIS EXPERIENCE**:

### Before Using Prompts (Sarah's old approach):
- Would just ask "Is this code good?" 
- Got generic responses
- Missed critical security issues
- Wasted time going back and forth

### After Using Structured Prompts:
- Gets specific, actionable feedback
- Catches security issues before they reach production
- Saves 2-3 hours of back-and-forth with security team
- Can fix issues immediately instead of waiting for Monday review

### Key Takeaways:
- **Always include business context** - The AI gave better suggestions because it knew about the flash sale deadline and transaction volume
- **Specify compliance requirements** - Mentioning PCI DSS and SOX got specific compliance-focused feedback
- **Request structured responses** - The organized format made it easy to prioritize fixes
- **Include performance requirements** - Got optimization suggestions because response time requirements were specified
- **Be specific about urgency** - The AI prioritized critical issues because of the Friday deadline context

### Tips That Actually Work:
1. **Copy-paste the template** - Don't try to remember it, just use it
2. **Customize the context** - Generic prompts get generic responses  
3. **Include real constraints** - Deadlines, compliance, performance requirements matter
4. **Ask for examples** - Code samples in responses are incredibly helpful
5. **Use it before peer review** - Catch issues early, impress your teammates

---
*Example Type: Code Review**
*Complexity Level: Intermediate*
*Focus Areas: Security, Authentication, Node.js Best Practices*
*Real Usage: Pre-submission code review, security validation, performance optimization*
