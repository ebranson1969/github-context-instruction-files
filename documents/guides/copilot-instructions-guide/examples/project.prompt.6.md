# Project Prompt Example 6: Security-Focused Code Review Scenario

## Scenario Description
A payment processing module has been developed for an e-commerce platform. Given the sensitive nature of financial data and PCI compliance requirements, this code requires thorough security review before deployment to production.

## Context Information
- **Project:** E-commerce Payment Gateway
- **Technology Stack:** .NET Core, Entity Framework, SQL Server, Redis
- **Compliance:** PCI DSS Level 1 required
- **Environment:** High-traffic production (10k+ transactions/day)
- **Security Requirements:** Encryption, audit logging, input validation

## Code Under Security Review
```csharp
[Route("api/[controller]")]
[ApiController]
public class PaymentController : ControllerBase
{
    private readonly IPaymentService _paymentService;
    private readonly ILogger<PaymentController> _logger;
    
    public PaymentController(IPaymentService paymentService, ILogger<PaymentController> logger)
    {
        _paymentService = paymentService;
        _logger = logger;
    }
    
    [HttpPost("process")]
    public async Task<IActionResult> ProcessPayment([FromBody] PaymentRequest request)
    {
        // Log payment attempt with sensitive data
        _logger.LogInformation($"Processing payment for card: {request.CardNumber}, amount: {request.Amount}");
        
        // Basic validation
        if (string.IsNullOrEmpty(request.CardNumber) || request.Amount <= 0)
        {
            return BadRequest("Invalid payment data");
        }
        
        try
        {
            // Store payment details in database
            var payment = new Payment
            {
                CardNumber = request.CardNumber, // Storing full card number
                ExpiryMonth = request.ExpiryMonth,
                ExpiryYear = request.ExpiryYear,
                CVV = request.CVV, // Storing CVV
                Amount = request.Amount,
                MerchantId = request.MerchantId,
                ProcessedAt = DateTime.Now
            };
            
            // Process payment through external gateway
            var result = await _paymentService.ProcessPaymentAsync(payment);
            
            if (result.Success)
            {
                // Return sensitive data in response
                return Ok(new 
                {
                    TransactionId = result.TransactionId,
                    Status = "Success",
                    CardNumber = payment.CardNumber,
                    Amount = payment.Amount,
                    ProcessingFee = result.ProcessingFee
                });
            }
            else
            {
                // Log error with sensitive data
                _logger.LogError($"Payment failed for card {payment.CardNumber}: {result.ErrorMessage}");
                return StatusCode(500, result.ErrorMessage);
            }
        }
        catch (Exception ex)
        {
            // Generic error handling exposes stack traces
            _logger.LogError($"Payment processing error: {ex}");
            return StatusCode(500, ex.Message);
        }
    }
    
    [HttpGet("history/{merchantId}")]
    public async Task<IActionResult> GetPaymentHistory(int merchantId)
    {
        // No authorization check
        var payments = await _paymentService.GetPaymentHistoryAsync(merchantId);
        return Ok(payments); // Returns all payment data including card numbers
    }
}
```

## Applied Prompt Template
Using **Code Review Prompt** with security emphasis:

```
Please review the following code for:
- Code quality and best practices
- Potential bugs or issues
- Performance considerations
- Alignment with project standards
- Documentation completeness

SECURITY FOCUS: PCI DSS compliance, sensitive financial data handling
Context: Payment processing module for e-commerce platform (10k+ daily transactions)
Compliance Requirements: PCI DSS Level 1, data encryption, audit logging
Security Standards: OWASP guidelines, secure coding practices, input validation

[CODE INSERTED ABOVE]
```

## Expected AI Response Structure
```
## Security Code Review Analysis

### 🚨 CRITICAL Security Vulnerabilities

#### 1. **PCI DSS Violations - CRITICAL**
**Issues:**
- Storing full credit card numbers in database (PCI DSS 3.4 violation)
- Storing CVV codes (PCI DSS 3.2 violation)
- Logging sensitive payment data in plain text
- Returning card numbers in API responses

**Impact:** Major PCI compliance failure, potential data breach, regulatory fines
**Risk Level:** CRITICAL - Immediate remediation required

#### 2. **Sensitive Data Exposure - HIGH**
**Issues:**
- Payment card data logged in application logs
- Stack traces and error details exposed to clients
- Full payment history accessible without authorization

**Impact:** Data breach potential, regulatory violations
**Risk Level:** HIGH

#### 3. **Missing Authorization - HIGH** 
**Issues:**
- Payment history endpoint lacks authentication
- No merchant ownership validation
- Potential access to other merchants' data

**Impact:** Unauthorized data access, privacy violations
**Risk Level:** HIGH

### 🔧 Required Security Fixes

#### Immediate Actions (Deploy within 24 hours)

**1. Remove PCI Sensitive Data Storage**
```csharp
public class Payment
{
    public string TransactionId { get; set; }
    public string CardLastFour { get; set; } // Only last 4 digits
    public string CardToken { get; set; }    // Tokenized reference
    // Remove: CardNumber, CVV, ExpiryMonth, ExpiryYear
    public decimal Amount { get; set; }
    public int MerchantId { get; set; }
    public DateTime ProcessedAt { get; set; }
    public string PaymentGatewayReference { get; set; }
}
```

**2. Implement Secure Logging**
```csharp
[HttpPost("process")]
public async Task<IActionResult> ProcessPayment([FromBody] PaymentRequest request)
{
    // Secure logging without sensitive data
    var transactionId = Guid.NewGuid().ToString();
    _logger.LogInformation("Processing payment transaction {TransactionId} for merchant {MerchantId}", 
                          transactionId, request.MerchantId);
    
    // Input validation with security checks
    var validationResult = await ValidatePaymentRequest(request);
    if (!validationResult.IsValid)
    {
        _logger.LogWarning("Payment validation failed for transaction {TransactionId}: {Errors}", 
                          transactionId, string.Join(", ", validationResult.Errors));
        return BadRequest("Invalid payment request");
    }
    
    try
    {
        // Tokenize sensitive data before processing
        var tokenizedPayment = await _tokenizationService.TokenizePaymentDataAsync(request);
        var result = await _paymentService.ProcessPaymentAsync(tokenizedPayment);
        
        if (result.Success)
        {
            // Secure response without sensitive data
            return Ok(new PaymentResponse
            {
                TransactionId = result.TransactionId,
                Status = "Success",
                LastFourDigits = result.CardLastFour,
                Amount = request.Amount,
                // No card numbers or sensitive data
            });
        }
        else
        {
            _logger.LogError("Payment processing failed for transaction {TransactionId}", transactionId);
            return StatusCode(422, "Payment processing failed");
        }
    }
    catch (Exception ex)
    {
        // Secure error handling
        _logger.LogError(ex, "Payment processing error for transaction {TransactionId}", transactionId);
        return StatusCode(500, "An error occurred processing your payment");
    }
}
```

**3. Add Authorization and Input Validation**
```csharp
[HttpGet("history/{merchantId}")]
[Authorize] // Add authentication requirement
public async Task<IActionResult> GetPaymentHistory(int merchantId)
{
    // Verify merchant access rights
    var currentUser = User.Identity.Name;
    if (!await _authorizationService.CanAccessMerchantData(currentUser, merchantId))
    {
        _logger.LogWarning("Unauthorized access attempt to merchant {MerchantId} by user {User}", 
                          merchantId, currentUser);
        return Forbid();
    }
    
    // Return sanitized payment history
    var payments = await _paymentService.GetPaymentHistoryAsync(merchantId);
    var sanitizedHistory = payments.Select(p => new PaymentHistoryResponse
    {
        TransactionId = p.TransactionId,
        LastFourDigits = p.CardLastFour,
        Amount = p.Amount,
        ProcessedAt = p.ProcessedAt,
        Status = p.Status
        // No sensitive data included
    });
    
    return Ok(sanitizedHistory);
}
```

#### Additional Security Enhancements

**4. Input Validation Service**
```csharp
public class PaymentValidator
{
    public async Task<ValidationResult> ValidatePaymentRequest(PaymentRequest request)
    {
        var errors = new List<string>();
        
        // Validate card number format (without storing it)
        if (!IsValidCardNumber(request.CardNumber))
            errors.Add("Invalid card number format");
            
        // Validate amount ranges
        if (request.Amount <= 0 || request.Amount > 10000)
            errors.Add("Invalid payment amount");
            
        // Rate limiting check
        if (await IsRateLimited(request.MerchantId))
            errors.Add("Rate limit exceeded");
            
        // Fraud detection
        if (await IsSuspiciousTransaction(request))
            errors.Add("Transaction flagged for review");
            
        return new ValidationResult { IsValid = !errors.Any(), Errors = errors };
    }
}
```

**5. Audit Logging Service**
```csharp
public class PaymentAuditLogger
{
    public async Task LogPaymentAttempt(string transactionId, int merchantId, decimal amount, string result)
    {
        var auditEntry = new PaymentAuditLog
        {
            TransactionId = transactionId,
            MerchantId = merchantId,
            Amount = amount,
            Action = "ProcessPayment",
            Result = result,
            Timestamp = DateTime.UtcNow,
            UserAgent = GetUserAgent(),
            IpAddress = GetClientIpAddress()
        };
        
        await _auditRepository.SaveAsync(auditEntry);
    }
}
```

### 📋 Security Compliance Checklist

#### PCI DSS Requirements Status
- ✅ **Requirement 3.2:** Never store CVV (after fix)
- ✅ **Requirement 3.4:** Mask card numbers (after tokenization)
- ✅ **Requirement 8.1:** Implement authentication (after authorization fix)
- ✅ **Requirement 10.1:** Implement audit logging (after audit service)
- ❌ **Requirement 6.5.1:** Injection flaws (needs SQL injection review)
- ❌ **Requirement 6.5.10:** Cryptographic failures (needs encryption at rest)

#### Additional Security Measures Needed
1. **Encryption at Rest:** Encrypt sensitive data in database
2. **TLS Configuration:** Ensure TLS 1.2+ for all communications
3. **Input Sanitization:** Implement comprehensive input validation
4. **Rate Limiting:** Add API rate limiting to prevent abuse
5. **Security Headers:** Implement OWASP security headers

### 🧪 Security Testing Requirements

#### Before Deployment
1. **Penetration Testing**
   - SQL injection vulnerability scanning
   - Authentication bypass attempts
   - Data exposure testing

2. **Compliance Validation**
   - PCI DSS assessment scan
   - Data flow analysis
   - Encryption validation

3. **Code Security Scan**
   - Static analysis security testing (SAST)
   - Dynamic application security testing (DAST)
   - Dependency vulnerability scanning

### ⚡ Implementation Priority
1. **IMMEDIATE (24 hours):** Remove PCI sensitive data storage
2. **HIGH (48 hours):** Add authorization and secure logging
3. **MEDIUM (1 week):** Implement tokenization service
4. **LOW (2 weeks):** Complete audit logging and monitoring

### 📊 Risk Assessment Summary
**Overall Risk Level:** CRITICAL
**Deployment Recommendation:** BLOCK until critical issues resolved
**Business Impact:** Potential regulatory fines, data breach liability
**Timeline for Resolution:** 1-2 weeks for full compliance
```

## Key Learning Points
- Security reviews require explicit focus on compliance requirements and threat models
- Identify specific regulatory violations (PCI DSS in this case)
- Provide concrete, implementable security fixes with code examples
- Include comprehensive security testing recommendations
- Prioritize fixes based on risk level and business impact
- Consider both immediate fixes and long-term security architecture

---
*Example Type: Security Code Review*
*Complexity Level: Advanced*
*Focus Areas: PCI Compliance, Financial Data Security, Authorization*
