# Project Prompt Examples - Real-World Usage Scenarios

This directory contains comprehensive examples demonstrating how to use the project prompt templates in actual development situations. Each example shows a realistic business scenario with real stakes, practical usage, and the outcomes teams achieve.

## 📖 How to Use These Examples

Each example file follows this structure:
- **Scenario Description**: Real workplace situation requiring AI assistance
- **Context Information**: Actual project constraints, team size, business requirements
- **Code/Content**: Production-style code or requirements with realistic issues
- **Applied Prompt Template**: Step-by-step process showing how to use the prompt
- **Expected AI Response**: Structured feedback that teams actually receive
- **Key Learning Points**: What developers learn from using systematic prompts

## 🎯 Available Example Files

### Code Review Examples

#### 📋 [Code Review - Authentication Security](code-review-authentication-security.md)
**Real Situation**: Sarah needs to review Node.js authentication code before Friday deployment
- **Business Stakes**: E-commerce platform handling $2M+ daily transactions
- **Team Context**: 12 developers, security compliance required (PCI DSS, SOX)
- **Code Issues**: Missing rate limiting, no audit logging, potential security vulnerabilities
- **Outcome**: Catches critical security issues before production deployment
- **Learning**: How structured prompts help identify security issues that generic reviews miss

**When to Use This Example:**
- Before submitting authentication/security-related pull requests
- When reviewing API endpoints that handle sensitive data
- During security audits or compliance reviews
- Teaching junior developers about secure coding practices

---

### Bug Analysis Examples

#### 🚨 [Bug Analysis - Black Friday Crisis](bug-analysis-black-friday-crisis.md)
**Real Crisis**: Mike faces 15% checkout failures during Black Friday peak traffic
- **Business Impact**: $50,000 per minute revenue loss, CEO escalation
- **Technical Problem**: Database connection pool exhaustion, N+1 query problem
- **Team Pressure**: 3 developers on-call, need fix within 30 minutes
- **Outcome**: Systematic analysis identifies root cause, saves $5M+ in potential losses
- **Learning**: How structured bug analysis prevents panic-driven mistakes during crises

**When to Use This Example:**
- During production emergencies with high business impact
- When experiencing database performance issues under load
- For systematic troubleshooting instead of random fix attempts
- Training teams on crisis management and structured problem-solving

---

### Feature Implementation Examples

#### 🎯 [Feature Implementation - Social Media Scheduling](feature-implementation-social-media-scheduling.md)
**Real Negotiation**: Lisa faces $500K contract at stake with 4-week deadline
- **Client Pressure**: Major client threatening to leave without scheduled posting feature
- **Team Constraints**: 5 developers (mix of senior/junior), 70% capacity already committed
- **Technical Challenge**: Multiple social platform APIs, background job processing, timezone handling
- **Outcome**: Professional planning leads to 2-year $1.2M contract extension
- **Learning**: How systematic feature breakdown prevents over-commitment and manages client expectations

**When to Use This Example:**
- During sprint planning for complex features
- When facing tight client deadlines and need realistic estimates
- For breaking down features with external API dependencies
- Teaching teams how to manage scope and set proper expectations

---

### Documentation Examples

#### 📚 [Documentation - Python File Upload](documentation-python-file-upload.md)
**Real Need**: Developer needs comprehensive documentation for file upload utility
- **Team Context**: Content Management System with multiple integration teams
- **Technical Focus**: Python Flask utility with security considerations
- **Audience**: Backend developers, integration teams, new team members
- **Outcome**: Complete API documentation with examples, security notes, error handling
- **Learning**: How to generate documentation that actually gets used by other teams

**When to Use This Example:**
- After completing utility functions or shared libraries
- When creating API documentation for other teams
- For generating comprehensive function documentation with examples
- Teaching proper documentation structure and completeness

#### 📖 [Documentation - Go Microservice Multi-Audience](documentation-go-microservice-multi-audience.md)
**Real Challenge**: Documenting notification service for multiple audience types
- **Audiences**: External API consumers, internal developers, DevOps teams
- **Technical Stack**: Go, gRPC, Protocol Buffers, Kubernetes deployment
- **Business Context**: Microservices architecture with complex integration requirements
- **Outcome**: Comprehensive documentation covering API reference, deployment, monitoring
- **Learning**: How to create documentation that serves different technical audiences effectively

**When to Use This Example:**
- When documenting microservices with multiple consumers
- For creating comprehensive service documentation including deployment
- When different teams need different levels of technical detail
- Teaching how to structure documentation for complex systems

---

### Performance & Security Examples

#### ⚡ [Performance Bug - Dashboard Optimization](performance-bug-dashboard-optimization.md)
**Real Problem**: Business Intelligence dashboard taking 45+ seconds to load
- **User Impact**: 200+ daily active users affected, productivity severely impacted
- **Technical Issues**: N+1 queries, memory loading, inefficient database patterns
- **Business Risk**: Potential customer churn, productivity loss
- **Outcome**: Systematic optimization reduces load times from 45s to <5s
- **Learning**: How to identify and fix performance anti-patterns systematically

**When to Use This Example:**
- When facing database query performance issues
- For systematic performance optimization instead of random improvements
- During performance reviews or optimization sprints
- Teaching teams about common performance anti-patterns

#### 🔒 [Security Code Review - Payment Processing](security-code-review-payment-processing.md)
**Real Compliance**: Payment module requiring PCI DSS Level 1 compliance review
- **Compliance Stakes**: Regulatory fines, potential data breach liability
- **Technical Focus**: .NET payment processing with credit card data
- **Security Requirements**: PCI DSS compliance, encryption, audit logging
- **Outcome**: Identifies critical compliance violations before production deployment
- **Learning**: How security-focused prompts catch compliance issues that general reviews miss

**When to Use This Example:**
- When reviewing payment processing or financial transaction code
- During PCI DSS or other regulatory compliance reviews
- For security-critical code that handles sensitive data
- Teaching teams about secure coding for financial applications

---

### Refactoring Examples

#### 🔧 [Refactoring - Java User Management](refactoring-java-user-management.md)
**Real Technical Debt**: 800+ line user service class becoming unmaintainable
- **Code Problems**: God class anti-pattern, tight coupling, difficult testing
- **Team Impact**: New features require extensive changes, junior developers struggle
- **Business Context**: CRM system needing improved maintainability and performance
- **Outcome**: Clean architecture approach with testable, maintainable components
- **Learning**: How systematic refactoring prevents technical debt accumulation

**When to Use This Example:**
- When facing large, complex classes that are hard to maintain
- During technical debt reduction initiatives
- For teaching clean architecture and SOLID principles
- When code has become difficult to test or extend

---

## 🚀 Quick Reference Guide

### **By Development Phase:**
- **Planning:** Use `feature-implementation-social-media-scheduling.md`
- **Coding:** Use `code-review-authentication-security.md`
- **Testing:** Use `bug-analysis-black-friday-crisis.md`
- **Documentation:** Use `documentation-python-file-upload.md` or `documentation-go-microservice-multi-audience.md`
- **Maintenance:** Use `refactoring-java-user-management.md`

### **By Technology Stack:**
- **Node.js:** `code-review-authentication-security.md`
- **Python:** `documentation-python-file-upload.md`, `performance-bug-dashboard-optimization.md`
- **Java:** `refactoring-java-user-management.md`
- **Go:** `documentation-go-microservice-multi-audience.md`
- **.NET:** `security-code-review-payment-processing.md`

### **By Business Urgency:**
- **Crisis/Emergency:** `bug-analysis-black-friday-crisis.md`
- **Client/Contract Risk:** `feature-implementation-social-media-scheduling.md`
- **Compliance/Security:** `security-code-review-payment-processing.md`
- **Performance Issues:** `performance-bug-dashboard-optimization.md`

### **By Team Experience:**
- **Junior Developers:** Start with `code-review-authentication-security.md`
- **Senior Developers:** Use `feature-implementation-social-media-scheduling.md`
- **Security Teams:** Focus on `security-code-review-payment-processing.md`
- **DevOps Teams:** Reference `documentation-go-microservice-multi-audience.md`

## 💡 Tips for Using These Examples

### **Before Using an Example:**
1. Read the "Scenario Description" to understand if it matches your situation
2. Check the "Context Information" to see if the constraints are similar
3. Review the "Key Learning Points" to understand what you'll gain

### **While Following an Example:**
1. Adapt the context to match your specific project details
2. Modify the business stakes and constraints to reflect your situation
3. Use your actual code or requirements instead of the example code
4. Customize the expected response format for your needs

### **After Using an Example:**
1. Compare your AI response to the "Expected AI Response Structure"
2. Note what worked well and what could be improved
3. Share learnings with your team
4. Consider creating project-specific variations

## 📚 Related Documentation

- **[Project Prompts Guide](../project-prompts-guide.md)** - Overview and basic usage
- **[Project Prompts Detailed Guide](../project-prompts-detailed-guide.md)** - Advanced implementation
- **[Main Guides README](../../README.md)** - All available guides
- **[Project README](../../../../README.md)** - Project overview

## 🎯 Success Stories

These examples are based on real scenarios where structured prompts made a significant difference:

- **Sarah's Security Review**: Caught 3 critical security issues that could have caused data breaches
- **Mike's Crisis Management**: Saved $5M+ in revenue during Black Friday through systematic debugging
- **Lisa's Contract Win**: Professional feature planning led to $1.2M contract extension
- **Performance Team**: Reduced dashboard load times by 90% through systematic optimization

The key is that **structured prompts lead to better outcomes** than generic AI questions. Each example demonstrates how the systematic approach helps teams deliver better results while reducing stress and uncertainty.

---

*Last updated: September 28, 2025*
*Part of: GitHub Context Instruction Files Project - Example Documentation*
