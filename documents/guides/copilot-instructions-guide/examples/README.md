# Project Prompt Examples - Real-World Usage Scenarios

## Description
This directory contains comprehensive examples demonstrating how to use the project prompt templates in actual development situations. Each example shows a realistic business scenario with real stakes, practical usage, and the outcomes teams achieve.

## Directory Structure
```
examples/
├── README.md (this file)
├── bug-analysis-black-friday-crisis.md
├── code-review-authentication-security.md
├── documentation-go-microservice-multi-audience.md
├── documentation-python-file-upload.md
├── feature-implementation-social-media-scheduling.md
├── performance-bug-dashboard-optimization.md
├── refactoring-java-user-management.md
└── security-code-review-payment-processing.md
```

## Parent Directory
- **[↑ Copilot Instructions Guide](../README.md)** - Parent directory with all copilot instruction guides

## Child READMEs
*No child README files in this directory*

## Document Descriptions

### 🚨 **[Bug Analysis - Black Friday Crisis](bug-analysis-black-friday-crisis.md)**
**Real Crisis Scenario**: Mike faces 15% checkout failures during Black Friday peak traffic with $50,000 per minute revenue loss
- **Business Impact**: CEO escalation, 3 developers on-call, need fix within 30 minutes
- **Technical Problem**: Database connection pool exhaustion, N+1 query problem causing system overload
- **Usage**: During production emergencies with high business impact, systematic troubleshooting instead of panic fixes
- **Outcome**: Systematic analysis identifies root cause, saves $5M+ in potential losses
- **Learning**: How structured bug analysis prevents panic-driven mistakes during crises

### 📋 **[Code Review - Authentication Security](code-review-authentication-security.md)**
**Real Workplace Scenario**: Sarah needs to review Node.js authentication code before Friday deployment
- **Business Stakes**: E-commerce platform handling $2M+ daily transactions, PCI DSS compliance required
- **Code Issues**: Missing rate limiting, no audit logging, potential security vulnerabilities
- **Usage**: Before submitting authentication/security-related pull requests, teaching secure coding practices
- **Outcome**: Catches critical security issues before production deployment
- **Learning**: How structured prompts help identify security issues that generic reviews miss

### 📖 **[Documentation - Go Microservice Multi-Audience](documentation-go-microservice-multi-audience.md)**
**Complex Documentation Challenge**: Documenting notification service for multiple audience types
- **Audiences**: External API consumers, internal developers, DevOps teams requiring different detail levels
- **Technical Stack**: Go, gRPC, Protocol Buffers, Kubernetes deployment
- **Usage**: When documenting microservices with multiple consumers, creating service documentation including deployment
- **Outcome**: Comprehensive documentation covering API reference, deployment guides, monitoring
- **Learning**: How to create documentation that serves different technical audiences effectively

### 📚 **[Documentation - Python File Upload](documentation-python-file-upload.md)**
**Practical Documentation Need**: Developer needs comprehensive documentation for file upload utility
- **Team Context**: Content Management System with multiple integration teams
- **Technical Focus**: Python Flask utility with security considerations and error handling
- **Usage**: After completing utility functions or shared libraries, generating API documentation for other teams
- **Outcome**: Complete API documentation with examples, security notes, error handling guidance
- **Learning**: How to generate documentation that actually gets used by other teams

### 🎯 **[Feature Implementation - Social Media Scheduling](feature-implementation-social-media-scheduling.md)**
**High-Stakes Contract Negotiation**: Lisa faces $500K contract at stake with 4-week deadline
- **Client Pressure**: Major client threatening to leave without scheduled posting feature
- **Team Constraints**: 5 developers (mix of senior/junior), 70% capacity already committed
- **Technical Challenge**: Multiple social platform APIs, background job processing, timezone handling
- **Usage**: During sprint planning for complex features, when facing tight client deadlines
- **Outcome**: Professional planning leads to 2-year $1.2M contract extension
- **Learning**: How systematic feature breakdown prevents over-commitment and manages client expectations

### ⚡ **[Performance Bug - Dashboard Optimization](performance-bug-dashboard-optimization.md)**
**Performance Crisis**: Business Intelligence dashboard taking 45+ seconds to load
- **User Impact**: 200+ daily active users affected, productivity severely impacted
- **Technical Issues**: N+1 queries, memory loading, inefficient database patterns causing system slowdown
- **Usage**: When facing database query performance issues, during performance optimization sprints
- **Outcome**: Systematic optimization reduces load times from 45s to <5s
- **Learning**: How to identify and fix performance anti-patterns systematically

### 🔧 **[Refactoring - Java User Management](refactoring-java-user-management.md)**
**Technical Debt Crisis**: 800+ line user service class becoming unmaintainable
- **Code Problems**: God class anti-pattern, tight coupling, difficult testing blocking development
- **Team Impact**: New features require extensive changes, junior developers struggle with complexity
- **Usage**: When facing large, complex classes that are hard to maintain, during technical debt reduction
- **Outcome**: Clean architecture approach with testable, maintainable components
- **Learning**: How systematic refactoring prevents technical debt accumulation

### 🔒 **[Security Code Review - Payment Processing](security-code-review-payment-processing.md)**
**Compliance Critical Review**: Payment module requiring PCI DSS Level 1 compliance review
- **Compliance Stakes**: Regulatory fines, potential data breach liability
- **Technical Focus**: .NET payment processing with credit card data requiring strict security measures
- **Usage**: When reviewing payment processing code, during PCI DSS compliance reviews
- **Outcome**: Identifies critical compliance violations before production deployment
- **Learning**: How security-focused prompts catch compliance issues that general reviews miss

---

*Last updated: September 28, 2025**
*Part of: GitHub Context Instruction Files Project - Example Documentation*
