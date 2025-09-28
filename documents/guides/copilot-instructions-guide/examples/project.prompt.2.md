# Project Prompt Example 2: Bug Analysis Scenario

## Scenario Description
*This section sets up the real-world context and business situation that prompted the need for AI assistance. It explains the background, stakeholders involved, and why this particular type of prompt is needed.*

Production users are reporting intermittent 500 errors when trying to checkout their shopping carts. The error occurs sporadically, affecting roughly 15% of checkout attempts during peak hours.

## Context Information
*This section provides specific technical details about the project environment, technology stack, and constraints that will influence the AI's response. Include details like frameworks, databases, team size, compliance requirements, etc.*

- **Project:** E-commerce Platform
- **Technology Stack:** React frontend, Node.js/Express backend, PostgreSQL, Redis cache
- **Environment:** Production
- **Impact:** Revenue loss, customer complaints
- **Frequency:** ~15% of checkout attempts during peak traffic

## Bug Report Details
*This section contains the actual code, configuration, or content that needs analysis. Keep it realistic and representative of actual work scenarios. Include enough context for meaningful analysis.*

```
Error Message: "Internal Server Error - Unable to process checkout"
Status Code: 500
Affected Endpoint: POST /api/checkout
Time Pattern: Primarily during peak hours (6-9 PM EST)
User Agent: Various browsers and devices
Database Logs: Connection timeouts to PostgreSQL
Cache Logs: Redis connection spikes during error periods
```

## Relevant Code Snippet
```javascript
// checkout.js - Problematic checkout handler
router.post('/checkout', async (req, res) => {
  try {
    const { cartId, paymentInfo } = req.body;
    
    // Get cart items
    const cartItems = await db.query(
      'SELECT * FROM cart_items WHERE cart_id = $1', 
      [cartId]
    );
    
    // Calculate total
    let total = 0;
    for (const item of cartItems.rows) {
      const product = await db.query(
        'SELECT price FROM products WHERE id = $1', 
        [item.product_id]
      );
      total += product.rows[0].price * item.quantity;
    }
    
    // Process payment
    const paymentResult = await processPayment(paymentInfo, total);
    
    // Update inventory
    for (const item of cartItems.rows) {
      await db.query(
        'UPDATE products SET stock = stock - $1 WHERE id = $2',
        [item.quantity, item.product_id]
      );
    }
    
    // Create order
    const order = await db.query(
      'INSERT INTO orders (cart_id, total, payment_id) VALUES ($1, $2, $3) RETURNING id',
      [cartId, total, paymentResult.id]
    );
    
    res.json({ orderId: order.rows[0].id });
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});
```

## Applied Prompt Template
*This section shows how to properly use the project prompt template from .github/prompts/project.prompt.md. It demonstrates the correct format, context inclusion, and specific requirements to get the best AI response.*

Using the **Bug Analysis Prompt** from `.github/prompts/project.prompt.md`:

```
Analyze the following bug report and provide:
- Root cause analysis
- Potential solutions
- Steps to reproduce (if missing)
- Prevention strategies
- Priority assessment

Context: E-commerce checkout system experiencing 15% failure rate during peak hours
Technology: Node.js, PostgreSQL, Redis, high-traffic production environment
Business Impact: Revenue loss, customer dissatisfaction

Bug Report: [BUG DETAILS INSERTED ABOVE]
Code Context: [CODE SNIPPET INSERTED ABOVE]
```

## Expected AI Response Structure
*This section shows what kind of response you should expect from the AI when using the prompt correctly. It serves as both a quality benchmark and a template for consistent AI interactions across your team.*

```
## Bug Analysis Report

### Root Cause Analysis

#### Primary Causes
1. **Database Connection Pool Exhaustion**
   - Multiple sequential database queries in checkout process
   - No connection pooling optimization for peak traffic
   - N+1 query problem: One query per cart item for product prices

2. **Lack of Database Transactions**
   - Inventory updates and order creation not wrapped in transactions
   - Partial failures leave system in inconsistent state

3. **Missing Error Handling**
   - Generic error responses provide no debugging information
   - No differentiation between different failure types

#### Contributing Factors
- No rate limiting on checkout endpoint
- Inadequate monitoring and alerting
- Missing database query optimization
- No graceful degradation mechanisms

### Potential Solutions

#### Immediate Fixes (Deploy within 24 hours)
1. **Optimize Database Queries**
```javascript
// Replace N+1 queries with single JOIN query
const cartData = await db.query(`
  SELECT ci.*, p.price 
  FROM cart_items ci 
  JOIN products p ON ci.product_id = p.id 
  WHERE ci.cart_id = $1
`, [cartId]);
```

2. **Add Database Transactions**
```javascript
const client = await db.getClient();
try {
  await client.query('BEGIN');
  // ... all database operations
  await client.query('COMMIT');
} catch (error) {
  await client.query('ROLLBACK');
  throw error;
} finally {
  client.release();
}
```

#### Short-term Improvements (1-2 weeks)
1. **Implement Connection Pool Monitoring**
2. **Add detailed error logging with request IDs**
3. **Implement checkout queue system for peak traffic**
4. **Add inventory lock mechanism**

#### Long-term Prevention (1-2 months)
1. **Implement circuit breaker pattern**
2. **Add comprehensive monitoring dashboard**
3. **Implement automated load testing**
4. **Consider microservices architecture for checkout**

### Steps to Reproduce
1. Simulate high concurrent checkout requests (>100 simultaneous)
2. Use load testing tool (Artillery, JMeter) during peak hours
3. Monitor database connection pool usage
4. Observe 500 errors when pool is exhausted

### Prevention Strategies
- **Database Monitoring**: Real-time connection pool metrics
- **Load Testing**: Regular peak traffic simulation
- **Code Reviews**: Mandatory review for database query patterns
- **Performance Testing**: Automated testing in CI/CD pipeline

### Priority Assessment
**CRITICAL (P0)** - Immediate action required
- Revenue impact: ~15% of potential sales lost
- Customer experience severely affected
- Data integrity at risk due to missing transactions
- Recommended timeline: 24-48 hours for core fixes
```

## Key Learning Points
*This section summarizes the most important takeaways about effective prompt usage. It highlights best practices, common mistakes to avoid, and tips for getting better results from AI assistance.*

- Provide comprehensive context including business impact and technical environment
- Include relevant code snippets and error logs when available
- Request structured analysis covering immediate and long-term solutions
- Ask for specific reproduction steps to validate fixes
- Include prevention strategies to avoid similar issues

---
*Example Type: Bug Analysis*
*Complexity Level: Advanced*
*Focus Areas: Production Issues, Database Performance, High-Traffic Systems*
