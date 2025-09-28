# Project Prompt Example 5: Performance Bug Analysis Scenario

## Scenario Description
A data analytics dashboard is experiencing severe performance degradation. Users report that loading complex reports takes 45+ seconds, and the application becomes unresponsive during peak usage. Memory usage has increased dramatically over the past month.

## Context Information
- **Project:** Business Intelligence Dashboard
- **Technology Stack:** React frontend, Python Django REST API, PostgreSQL, Elasticsearch
- **Issue Timeline:** Performance degraded over 4 weeks
- **User Impact:** 200+ daily active users affected
- **Current State:** Some reports timeout after 60 seconds

## Performance Metrics & Logs
```
Database Metrics:
- Average query time: 15-20 seconds (was 2-3 seconds)
- Connection pool exhaustion: 5-10 times per hour
- Lock wait timeouts: 15% of complex queries

Application Metrics:
- Memory usage: 2.3GB per worker (was 800MB)
- Response times: P95 at 45 seconds (was 5 seconds)
- CPU usage: Consistently above 80%

Error Logs Sample:
[2025-09-28 14:30:15] ERROR: Query timeout after 60 seconds
[2025-09-28 14:31:42] WARNING: Memory usage exceeded 2GB
[2025-09-28 14:35:18] ERROR: Connection pool exhausted, rejecting request
```

## Problematic Code
```python
# reports/views.py - Problematic report generation
class ReportView(APIView):
    def get(self, request):
        report_type = request.GET.get('type')
        date_range = request.GET.get('date_range', '30d')
        
        # Load all data without pagination or filtering
        all_transactions = Transaction.objects.all()
        all_users = User.objects.all()
        all_products = Product.objects.all()
        
        # Process data in memory - no database aggregation
        report_data = []
        for transaction in all_transactions:
            # N+1 query problem
            user = User.objects.get(id=transaction.user_id)
            product = Product.objects.get(id=transaction.product_id)
            
            # Complex calculations done in Python instead of database
            if self.matches_date_range(transaction.created_at, date_range):
                monthly_revenue = self.calculate_monthly_revenue(user.id)
                product_stats = self.calculate_product_stats(product.id)
                
                report_data.append({
                    'transaction': transaction,
                    'user': user,
                    'product': product,
                    'monthly_revenue': monthly_revenue,
                    'product_stats': product_stats
                })
        
        # Sort and filter in memory
        filtered_data = self.filter_by_report_type(report_data, report_type)
        sorted_data = sorted(filtered_data, key=lambda x: x['transaction'].amount, reverse=True)
        
        return Response(sorted_data)
    
    def calculate_monthly_revenue(self, user_id):
        # Another N+1 query for each user
        user_transactions = Transaction.objects.filter(user_id=user_id)
        return sum(t.amount for t in user_transactions)
```

## Applied Prompt Template
Using the **Bug Analysis Prompt** with performance focus:

```
Analyze the following bug report and provide:
- Root cause analysis
- Potential solutions
- Steps to reproduce (if missing)
- Prevention strategies
- Priority assessment

Context: Business Intelligence dashboard with 200+ DAU, performance critical
Technology: Django REST API, PostgreSQL, React frontend, high-data-volume environment
Business Impact: User productivity severely impacted, potential customer churn
Performance Requirements: Reports should load within 5 seconds, handle concurrent users

Bug Report: [PERFORMANCE METRICS AND ERROR LOGS ABOVE]
Code Context: [PROBLEMATIC CODE ABOVE]
```

## Expected AI Response Structure
```
## Performance Bug Analysis Report

### Root Cause Analysis

#### Primary Performance Issues
1. **Massive Data Loading Anti-pattern**
   - Loading entire datasets (all transactions, users, products) into memory
   - No pagination, filtering, or database-level aggregation
   - Memory consumption scales linearly with data growth

2. **N+1 Query Problem (Critical)**
   - Individual database queries for each transaction's user and product
   - For 10,000 transactions: 20,000+ additional queries
   - Database connection pool exhaustion inevitable

3. **Application-Level Processing**
   - Complex calculations performed in Python instead of database
   - CPU-intensive operations blocking request threads
   - No caching of expensive computations

#### Contributing Performance Factors
- Missing database indexes on frequently queried columns
- Lack of query optimization and database-level aggregations
- No caching layer for expensive calculations
- Synchronous processing blocking other requests

### Performance Impact Breakdown
```
Current Performance Issues:
┌─────────────────────┬─────────────┬──────────────┐
│ Issue               │ Impact      │ Frequency    │
├─────────────────────┼─────────────┼──────────────┤
│ N+1 Queries         │ +40 seconds │ Every report │
│ Memory Loading      │ +15 seconds │ Every report │
│ CPU Calculations    │ +10 seconds │ Every report │
│ Connection Pool     │ Timeouts    │ Peak hours   │
└─────────────────────┴─────────────┴──────────────┘
```

### Optimized Solutions

#### Immediate Fixes (Deploy within 48 hours)

**1. Database Query Optimization**
```python
# Replace N+1 queries with efficient JOINs
def get_optimized(self, request):
    report_type = request.GET.get('type')
    date_range = self.parse_date_range(request.GET.get('date_range', '30d'))
    
    # Single query with JOINs and database aggregation
    report_data = Transaction.objects.select_related(
        'user', 'product'
    ).filter(
        created_at__gte=date_range['start'],
        created_at__lte=date_range['end']
    ).values(
        'id', 'amount', 'created_at',
        'user__name', 'user__email',
        'product__name', 'product__category'
    ).annotate(
        monthly_revenue=Sum('user__transactions__amount'),
        product_total_sales=Count('product__transactions')
    ).order_by('-amount')[:1000]  # Limit results
    
    return Response(report_data)
```

**2. Add Critical Database Indexes**
```sql
-- Add missing indexes for performance
CREATE INDEX CONCURRENTLY idx_transactions_created_at 
ON transactions(created_at);

CREATE INDEX CONCURRENTLY idx_transactions_user_id_created_at 
ON transactions(user_id, created_at);

CREATE INDEX CONCURRENTLY idx_transactions_product_amount 
ON transactions(product_id, amount);
```

#### Short-term Improvements (1-2 weeks)

**3. Implement Caching Strategy**
```python
from django.core.cache import cache
from django.views.decorators.cache import cache_page

class OptimizedReportView(APIView):
    @cache_page(300)  # 5-minute cache
    def get(self, request):
        cache_key = f"report_{report_type}_{date_range}_{hash(request.GET)}"
        cached_result = cache.get(cache_key)
        
        if cached_result:
            return Response(cached_result)
        
        # Generate report (optimized version)
        report_data = self.generate_optimized_report(request)
        cache.set(cache_key, report_data, 300)
        
        return Response(report_data)
```

**4. Implement Pagination and Streaming**
```python
from rest_framework.pagination import PageNumberPagination

class ReportPagination(PageNumberPagination):
    page_size = 100
    max_page_size = 500

class ReportView(APIView):
    pagination_class = ReportPagination
    
    def get(self, request):
        # Implement cursor-based pagination for large datasets
        queryset = self.get_optimized_queryset(request)
        page = self.paginate_queryset(queryset)
        return self.get_paginated_response(page)
```

#### Long-term Architecture Improvements (1 month)

**5. Background Report Processing**
```python
# Implement async report generation
from celery import shared_task

@shared_task
def generate_large_report(report_params):
    # Process report in background
    report_data = process_complex_report(report_params)
    # Store result and notify user
    return report_data

class AsyncReportView(APIView):
    def post(self, request):
        # Queue report for background processing
        task = generate_large_report.delay(request.data)
        return Response({
            'task_id': task.id,
            'status': 'processing',
            'estimated_time': '2-5 minutes'
        })
```

### Steps to Reproduce Performance Issues
1. **Load Testing Setup**
   ```bash
   # Use Artillery or similar tool
   artillery quick --count 50 --num 10 http://api/reports?type=complex
   ```

2. **Monitor Resource Usage**
   - Database connection count during test
   - Memory usage progression
   - Query execution times

3. **Simulate Peak Load**
   - 20+ concurrent users requesting reports
   - Monitor for timeouts and errors

### Prevention Strategies

#### Development Practices
1. **Query Analysis Requirements**
   - Mandatory database query review for new features
   - Use Django Debug Toolbar in development
   - Set up query performance alerts

2. **Performance Testing Integration**
   ```python
   # Add to CI/CD pipeline
   def test_report_performance(self):
       start_time = time.time()
       response = self.client.get('/api/reports?type=sales')
       duration = time.time() - start_time
       
       self.assertLess(duration, 5.0, "Report took too long")
       self.assertEqual(response.status_code, 200)
   ```

#### Monitoring & Alerting
1. **Database Performance Monitoring**
   - Query execution time alerts (>5 seconds)
   - Connection pool usage monitoring
   - Slow query logging

2. **Application Performance Monitoring**
   - Memory usage alerts (>1GB per worker)
   - Response time monitoring (P95, P99)
   - Error rate tracking

### Priority Assessment
**CRITICAL (P0)** - Production performance crisis
- **User Impact**: Severe productivity loss for 200+ users
- **Business Risk**: Potential customer churn and revenue loss
- **Technical Debt**: Architecture issues will worsen with data growth
- **Recommended Timeline**: 48 hours for immediate fixes, 2 weeks for full resolution

### Success Metrics
- **Response Time**: Reduce P95 from 45s to <5s
- **Memory Usage**: Reduce from 2.3GB to <800MB per worker
- **Database Performance**: Average query time <2 seconds
- **User Experience**: Zero timeouts during normal operation
- **Scalability**: Handle 2x current data volume without degradation
```

## Key Learning Points
- Performance bugs require detailed metrics and profiling data
- Identify specific anti-patterns causing performance issues (N+1 queries, memory loading)
- Provide both immediate fixes and long-term architectural solutions
- Include monitoring and prevention strategies to avoid regression
- Set measurable performance targets for validation
- Consider scalability implications of proposed solutions

---
*Example Type: Performance Bug Analysis*
*Complexity Level: Advanced*
*Focus Areas: Database Optimization, Memory Management, System Architecture*
