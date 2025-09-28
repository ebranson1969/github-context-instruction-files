# Project Prompt Example 2: Bug Analysis Scenario

## Scenario Description
*This section sets up the real-world context and business situation that prompted the need for AI assistance. It explains the background, stakeholders involved, and why this particular type of prompt is needed.*

**REAL CRISIS SITUATION**: It's Black Friday, 2:15 PM EST. Mike, the senior backend developer, gets an urgent Slack message: "CUSTOMERS CAN'T CHECKOUT! 500 ERRORS!" The monitoring dashboard shows 15% of checkout attempts are failing. The CEO is in the war room. Customer support is overwhelmed. Every minute means $50,000 in lost revenue.

Mike needs to diagnose and fix this FAST, but panic won't help. Instead of randomly trying fixes, he uses the bug analysis prompt template to systematically analyze the problem and find the root cause.

**BUSINESS IMPACT**:
- **Revenue Loss**: $50,000 per minute during peak traffic
- **Customer Experience**: Abandoned carts, frustrated shoppers
- **Brand Reputation**: Social media complaints starting to appear  
- **Team Stress**: All hands on deck, weekend plans cancelled
- **Market Competition**: Competitors getting our customers

**WHY STRUCTURED ANALYSIS MATTERS**: Under pressure, developers make mistakes. The prompt template forces systematic thinking instead of panic-driven random fixes that could make things worse.

## Context Information
*This section provides specific technical details about the project environment, technology stack, and constraints that will influence the AI's response. Include details like frameworks, databases, team size, compliance requirements, etc.*

**REAL PRODUCTION ENVIRONMENT**:
- **Peak Traffic**: Black Friday - 10x normal load (100,000+ concurrent users)
- **Revenue Impact**: $3M+ hourly during peak hours
- **System Architecture**: Microservices on AWS, auto-scaling enabled
- **Team Status**: 3 developers on-call, 1 DevOps engineer available
- **Monitoring**: DataDog alerts firing, PagerDuty escalation in progress
- **Customer Impact**: 50+ support tickets in last 15 minutes

- **Project:** E-commerce Platform
- **Technology Stack:** React frontend, Node.js/Express backend, PostgreSQL, Redis cache
- **Environment:** Production
- **Impact:** Revenue loss, customer complaints
- **Frequency:** ~15% of checkout attempts during peak traffic

## Bug Report Details
*This section contains the actual code, configuration, or content that needs analysis. Keep it realistic and representative of actual work scenarios. Include enough context for meaningful analysis.*

**REAL ERROR DATA FROM PRODUCTION**:

```
DATADOG ALERTS:
- Error Rate: 15% (normal: 0.2%)
- Response Time: P95 at 45 seconds (normal: 2 seconds)
- Database Connection Pool: 95% utilization (normal: 30%)

APPLICATION LOGS:
[2025-11-24 14:15:32] ERROR: Query timeout after 60 seconds
  Query: SELECT * FROM cart_items WHERE cart_id = $1
  Duration: 60,001ms
  Connection Pool: exhausted

[2025-11-24 14:16:15] ERROR: Connection pool exhausted, rejecting request
  Active Connections: 100/100
  Queue Length: 245
  Wait Time: 30 seconds

[2025-11-24 14:16:42] ERROR: Redis connection timeout
  Operation: GET cart:session:abc123
  Timeout: 5000ms
  Connection Pool: stressed

ERROR PATTERN:
- 90% of errors occur in checkout flow
- Peak errors during 2-4 PM EST (lunch break shoppers)
- Geographic pattern: East Coast users most affected
- User Agent: Mix of mobile and desktop (not device-specific)
```

**PROBLEMATIC CODE** (the actual checkout handler causing issues):

```javascript
// checkout.js - This code worked fine with normal traffic but breaks under load
router.post('/checkout', async (req, res) => {
  try {
    const { cartId, paymentInfo } = req.body;
    
    // PROBLEM 1: This loads ALL cart items without pagination
    // Under normal traffic: 2-5 items per cart
    // Black Friday: Users adding 50+ items to cart
    const cartItems = await db.query(
      'SELECT * FROM cart_items WHERE cart_id = $1', 
      [cartId]
    );
    
    // PROBLEM 2: N+1 Query Problem - This kills the database
    // Normal traffic: 3 items = 3 queries
    // Black Friday: 50 items = 50 queries PER CHECKOUT
    let total = 0;
    for (const item of cartItems.rows) {
      // Each iteration hits the database - disaster under load!
      const product = await db.query(
        'SELECT price FROM products WHERE id = $1', 
        [item.product_id]
      );
      total += product.rows[0].price * item.quantity;
    }
    
    // PROBLEM 3: External API call in critical path
    // Payment processor sometimes takes 10+ seconds during high load
    const paymentResult = await processPayment(paymentInfo, total);
    
    // PROBLEM 4: No database transaction
    // If anything fails after this point, inventory is corrupted
    for (const item of cartItems.rows) {
      await db.query(
        'UPDATE products SET stock = stock - $1 WHERE id = $2',
        [item.quantity, item.product_id]
      );
    }
    
    // PROBLEM 5: More database queries
    const order = await db.query(
      'INSERT INTO orders (cart_id, total, payment_id) VALUES ($1, $2, $3) RETURNING id',
      [cartId, total, paymentResult.id]
    );
    
    res.json({ orderId: order.rows[0].id });
  } catch (error) {
    // PROBLEM 6: No detailed error logging during crisis
    console.log(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});
```

## Applied Prompt Template
*This section shows how to properly use the project prompt template from .github/prompts/project.prompt.md. It demonstrates the correct format, context inclusion, and specific requirements to get the best AI response.*

**HOW MIKE USES THIS DURING THE CRISIS**:

1. **Stays calm** - Takes 30 seconds to grab the right template instead of panic-coding
2. **Gathers data** - Copies error logs, performance metrics, and the problematic code
3. **Adds context** - Includes Black Friday load, business impact, team constraints
4. **Gets systematic analysis** - AI gives structured diagnosis instead of guessing
5. **Implements fixes** - Follows prioritized action plan instead of random attempts

Using the **Bug Analysis Prompt** from `.github/prompts/project.prompt.md`:

```
Analyze the following bug report and provide:
- Root cause analysis
- Potential solutions
- Steps to reproduce (if missing)
- Prevention strategies
- Priority assessment

Context: E-commerce checkout system experiencing 15% failure rate during Black Friday peak traffic
Business Impact: $50,000/minute revenue loss, 100,000+ concurrent users, CEO escalation
Technology: Node.js, PostgreSQL, Redis, AWS auto-scaling production environment
Team Constraints: 3 developers on-call, need fix within 30 minutes, can't take site down
Performance Requirements: Must handle 10x normal load, <3 second response times
Current State: Database connection pool at 95%, query timeouts, Redis stress

CRITICAL: Black Friday peak traffic, every minute costs $50K. Need immediate action plan.

Bug Report: [ERROR DATA AND LOGS ABOVE]
Code Context: [CHECKOUT HANDLER CODE ABOVE]
```

## Expected AI Response Structure
*This section shows what kind of response you should expect from the AI when using the prompt correctly. It serves as both a quality benchmark and a template for consistent AI interactions across your team.*

**REAL AI RESPONSE MIKE GETS** (This saves the day!):

```
## 🚨 BLACK FRIDAY CRISIS ANALYSIS - IMMEDIATE ACTION REQUIRED

### ROOT CAUSE ANALYSIS - SYSTEM OVERLOAD CASCADE

#### PRIMARY CAUSE: Database Connection Pool Exhaustion
**The Domino Effect:**
1. N+1 query pattern creates 50+ database hits per checkout
2. Each checkout holds connections for 30-60 seconds  
3. 1000+ concurrent checkouts = instant connection pool exhaustion
4. New requests queue up, causing timeouts and 500 errors

#### CONTRIBUTING FACTORS:
- **Query Performance**: No joins, individual queries for each cart item
- **Transaction Scope**: No connection management, connections held too long
- **Cache Misses**: Product price lookups not cached, hitting DB every time
- **Synchronous Processing**: Payment API calls block request threads

### ⚡ IMMEDIATE FIXES (Deploy in 15 minutes)

#### 1. HOTFIX: Connection Pool Emergency Expansion
```javascript
// TEMPORARY - increase connection limit to handle crisis
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  max: 200, // Emergency increase from 100
  idleTimeoutMillis: 1000, // Faster connection recycling
  connectionTimeoutMillis: 5000 // Fail fast instead of queuing
});
```

#### 2. CRITICAL: Fix N+1 Query Problem  
```javascript
// Replace multiple queries with single JOIN
const cartData = await db.query(`
  SELECT ci.*, p.price 
  FROM cart_items ci 
  JOIN products p ON ci.product_id = p.id 
  WHERE ci.cart_id = $1
`, [cartId]);

// Calculate total in JavaScript (no more DB queries)
const total = cartData.rows.reduce((sum, item) => 
  sum + (item.price * item.quantity), 0
);
```

#### 3. URGENT: Add Database Transaction
```javascript
const client = await db.getClient();
try {
  await client.query('BEGIN');
  
  // All database operations here
  const orderResult = await client.query(
    'INSERT INTO orders (cart_id, total) VALUES ($1, $2) RETURNING id',
    [cartId, total]
  );
  
  // Bulk inventory update (single query instead of N queries)
  const inventoryUpdates = cartData.rows.map(item => 
    `UPDATE products SET stock = stock - ${item.quantity} WHERE id = ${item.product_id}`
  ).join('; ');
  
  await client.query(inventoryUpdates);
  await client.query('COMMIT');
  
} catch (error) {
  await client.query('ROLLBACK');
  throw error;
} finally {
  client.release(); // CRITICAL: Release connection immediately
}
```

### 📈 MONITORING DURING FIX DEPLOYMENT
Watch these metrics in real-time:
1. **Database connections**: Should drop from 95% to <50%
2. **Error rate**: Should decrease from 15% to <2%
3. **Response time**: Should improve from 45s to <5s
4. **Queue length**: Should clear within 5 minutes

### 🚀 DEPLOYMENT STRATEGY (ZERO DOWNTIME)
1. **Blue-green deployment**: Deploy fix to staging instances
2. **Load balancer shift**: Gradually move traffic to fixed instances
3. **Rollback ready**: Keep old version ready for instant rollback
4. **Monitor metrics**: Watch error rates and response times

### 🔄 LOAD TESTING VALIDATION
Before declaring victory:
```bash
# Simulate Black Friday load
artillery quick --count 500 --num 20 https://checkout-api/checkout
```

### 📊 BUSINESS IMPACT PROJECTION
- **Current Loss**: $50,000/minute
- **Fix Deploy Time**: 15 minutes = $750,000 total loss
- **Without Fix**: Potential $5M+ loss if problem continues through day
- **Customer Impact**: 15,000+ failed checkouts recovered

### 🛡️ PREVENTION (Implement Next Week)
1. **Load Testing**: Regular Black Friday simulation testing
2. **Circuit Breakers**: Auto-fallback when database is stressed  
3. **Query Optimization**: Review all N+1 patterns in codebase
4. **Caching Strategy**: Cache product prices, user sessions
5. **Database Scaling**: Read replicas for high-traffic queries

### ⏰ TIMELINE
- **0-15 min**: Deploy hotfix (connection pool + query optimization)
- **15-30 min**: Monitor recovery, validate metrics
- **30-60 min**: Full system health check, customer communication
- **Next week**: Implement prevention measures

**STATUS**: CRITICAL - Deploy immediately to stop revenue bleeding
```

## Key Learning Points
*This section summarizes the most important takeaways about effective prompt usage. It highlights best practices, common mistakes to avoid, and tips for getting better results from AI assistance.*

**WHAT MIKE LEARNED FROM THIS CRISIS**:

### Crisis Management with AI Prompts:

#### What Mike Did RIGHT:
- **Stayed systematic** instead of panic-coding random fixes
- **Included business context** - AI understood the urgency and revenue impact
- **Provided real data** - Error logs and metrics led to accurate diagnosis  
- **Asked for prioritized solutions** - Got immediate fixes vs. long-term improvements
- **Specified constraints** - AI knew about team size and deployment limitations

#### What Would Have Gone WRONG Without Prompts:
- Random guessing at fixes (could make it worse)
- Missing the root cause (N+1 queries)
- Deploying risky changes under pressure
- No systematic monitoring of the fix effectiveness
- Missing prevention strategies for next time

#### Crisis-Specific Prompt Tips:
1. **Lead with urgency and impact** - "CRITICAL: $50K/minute loss"
2. **Include current metrics** - Error rates, response times, resource utilization
3. **Specify constraints** - Team size, deployment windows, rollback requirements
4. **Ask for monitoring guidance** - How to validate the fix is working
5. **Request prevention strategies** - So this never happens again

#### Long-term Impact:
- **Team Confidence**: Structured approach under pressure
- **Prevention Mindset**: Regular load testing now standard practice
- **Documentation**: Crisis playbook developed from this experience
- **Business Trust**: Demonstrated systematic problem-solving to executives

### The $5 Million Lesson:
This bug analysis template literally saved millions in revenue and the team's reputation. The structured approach prevented panic-driven mistakes and led to a systematic fix that resolved the issue quickly and safely.

---
*Example Type: Bug Analysis*
*Complexity Level: Advanced*
*Focus Areas: Production Issues, Database Performance, High-Traffic Systems*
*Real Usage: Crisis management, systematic debugging, business-critical issue resolution*
