# Project Prompt Example 7: Multi-Platform Documentation Generation

## Scenario Description
*This section sets up the real-world context and business situation that prompted the need for AI assistance. It explains the background, stakeholders involved, and why this particular type of prompt is needed.*

A new microservice for user notification preferences has been completed and needs comprehensive documentation for multiple audiences: API consumers, internal developers, and system administrators. The service handles email, SMS, and push notification settings across different user tiers.

## Context Information
*This section provides specific technical details about the project environment, technology stack, and constraints that will influence the AI's response. Include details like frameworks, databases, team size, compliance requirements, etc.*

- **Project:** Customer Notification Management Service
- **Technology Stack:** Go, gRPC, Protocol Buffers, PostgreSQL, Redis
- **Audiences:** External API consumers, internal developers, DevOps team
- **Integration:** Part of larger microservices architecture
- **Deployment:** Kubernetes, multiple environments

## Service Code to Document
*This section contains the actual code, configuration, or content that needs analysis. Keep it realistic and representative of actual work scenarios. Include enough context for meaningful analysis.*

```go
// notification_service.go - Main service implementation
package notification

import (
    "context"
    "fmt"
    "github.com/company/notifications/pb"
    "github.com/company/notifications/models"
)

type NotificationService struct {
    repo       Repository
    validator  Validator
    publisher  EventPublisher
}

// UpdatePreferences updates user notification preferences with validation
func (s *NotificationService) UpdatePreferences(ctx context.Context, req *pb.UpdatePreferencesRequest) (*pb.UpdatePreferencesResponse, error) {
    // Validate user tier limitations
    userTier, err := s.repo.GetUserTier(ctx, req.UserId)
    if err != nil {
        return nil, fmt.Errorf("failed to get user tier: %w", err)
    }
    
    // Apply tier-based restrictions
    preferences := req.Preferences
    if userTier == models.TierFree {
        // Free tier limited to email only
        preferences.SmsEnabled = false
        preferences.PushEnabled = false
        preferences.MaxDailyEmails = min(preferences.MaxDailyEmails, 5)
    } else if userTier == models.TierPremium {
        preferences.MaxDailyEmails = min(preferences.MaxDailyEmails, 50)
        preferences.MaxDailySms = min(preferences.MaxDailySms, 20)
    }
    // Enterprise tier has no limits
    
    // Validate preference settings
    if err := s.validator.ValidatePreferences(preferences); err != nil {
        return nil, fmt.Errorf("invalid preferences: %w", err)
    }
    
    // Update preferences in database
    updatedPrefs, err := s.repo.UpdatePreferences(ctx, req.UserId, preferences)
    if err != nil {
        return nil, fmt.Errorf("failed to update preferences: %w", err)
    }
    
    // Publish preference change event
    event := &pb.PreferenceChangedEvent{
        UserId:      req.UserId,
        Preferences: updatedPrefs,
        Timestamp:   time.Now().Unix(),
    }
    
    if err := s.publisher.PublishEvent(ctx, "preferences.changed", event); err != nil {
        // Log error but don't fail the request
        log.Errorf("failed to publish preference change event: %v", err)
    }
    
    return &pb.UpdatePreferencesResponse{
        Preferences: updatedPrefs,
        Success:     true,
    }, nil
}

// GetPreferences retrieves current user notification preferences
func (s *NotificationService) GetPreferences(ctx context.Context, req *pb.GetPreferencesRequest) (*pb.GetPreferencesResponse, error) {
    preferences, err := s.repo.GetPreferences(ctx, req.UserId)
    if err != nil {
        if err == models.ErrNotFound {
            return s.createDefaultPreferences(ctx, req.UserId)
        }
        return nil, fmt.Errorf("failed to get preferences: %w", err)
    }
    
    return &pb.GetPreferencesResponse{
        Preferences: preferences,
    }, nil
}
```

## Applied Prompt Template
*This section shows how to properly use the project prompt template from .github/prompts/project.prompt.md. It demonstrates the correct format, context inclusion, and specific requirements to get the best AI response.*

Using **Documentation Generation Prompt** with multi-audience focus:

```
Generate comprehensive documentation for the following code/feature:
- Purpose and functionality
- Usage examples
- Parameter descriptions
- Return value details
- Any important notes or warnings

Context: Go microservice for notification preferences in microservices architecture
Audiences: API consumers (external), internal developers, DevOps/SRE teams
Deployment: Kubernetes, gRPC service, multi-environment
Integration: Part of larger notification system, publishes events to message queue

[CODE INSERTED ABOVE]
```

## Expected AI Response Structure
*This section shows what kind of response you should expect from the AI when using the prompt correctly. It serves as both a quality benchmark and a template for consistent AI interactions across your team.*

```
# Notification Preferences Service Documentation

## Overview
The Notification Preferences Service manages user notification settings across email, SMS, and push notification channels. It enforces tier-based limitations and maintains consistency across the notification ecosystem through event publishing.

## Service Architecture
- **Protocol:** gRPC with Protocol Buffers
- **Language:** Go 1.19+
- **Database:** PostgreSQL for preference storage
- **Cache:** Redis for performance optimization
- **Events:** Publishes preference changes to message queue
- **Deployment:** Kubernetes with horizontal pod autoscaling

## API Reference

### UpdatePreferences
Updates user notification preferences with tier-based validation and limitations.

#### Request Parameters
```protobuf
message UpdatePreferencesRequest {
  string user_id = 1;           // Required: User identifier (UUID format)
  Preferences preferences = 2;   // Required: New preference settings
}

message Preferences {
  bool email_enabled = 1;        // Enable/disable email notifications
  bool sms_enabled = 2;          // Enable/disable SMS notifications  
  bool push_enabled = 3;         // Enable/disable push notifications
  int32 max_daily_emails = 4;    // Daily email limit (0-unlimited based on tier)
  int32 max_daily_sms = 5;       // Daily SMS limit (premium+ tiers only)
  repeated string categories = 6; // Notification categories to enable
}
```

#### Response
```protobuf
message UpdatePreferencesResponse {
  Preferences preferences = 1;    // Applied preferences (may differ from request due to tier limits)
  bool success = 2;              // Operation success indicator
}
```

#### Tier Limitations
| Tier       | Email Limit | SMS Enabled | Push Enabled | Notes                    |
|------------|-------------|-------------|--------------|--------------------------|
| Free       | 5/day       | ❌          | ❌           | Email only               |
| Premium    | 50/day      | ✅ (20/day) | ✅           | Full feature access      |
| Enterprise | Unlimited   | Unlimited   | ✅           | No restrictions          |

### GetPreferences
Retrieves current user notification preferences, creating defaults if none exist.

#### Request Parameters
```protobuf
message GetPreferencesRequest {
  string user_id = 1;  // Required: User identifier (UUID format)
}
```

#### Response
```protobuf
message GetPreferencesResponse {
  Preferences preferences = 1;  // Current user preferences
}
```

## Usage Examples

### Go Client Example
```go
package main

import (
    "context"
    "google.golang.org/grpc"
    pb "github.com/company/notifications/pb"
)

func main() {
    // Connect to service
    conn, err := grpc.Dial("notification-service:8080", grpc.WithInsecure())
    if err != nil {
        panic(err)
    }
    defer conn.Close()
    
    client := pb.NewNotificationServiceClient(conn)
    
    // Update user preferences
    req := &pb.UpdatePreferencesRequest{
        UserId: "user-123-uuid",
        Preferences: &pb.Preferences{
            EmailEnabled:    true,
            SmsEnabled:      true,
            PushEnabled:     false,
            MaxDailyEmails:  25,
            MaxDailySms:     10,
            Categories:      []string{"marketing", "security", "updates"},
        },
    }
    
    resp, err := client.UpdatePreferences(context.Background(), req)
    if err != nil {
        panic(err)
    }
    
    fmt.Printf("Updated preferences: %+v\n", resp.Preferences)
}
```

### cURL Example (via gRPC-Web Gateway)
```bash
# Update preferences
curl -X POST https://api.company.com/v1/notifications/preferences \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${JWT_TOKEN}" \
  -d '{
    "user_id": "user-123-uuid",
    "preferences": {
      "email_enabled": true,
      "sms_enabled": true,
      "push_enabled": false,
      "max_daily_emails": 25,
      "categories": ["marketing", "security"]
    }
  }'

# Get preferences
curl -X GET https://api.company.com/v1/notifications/preferences/user-123-uuid \
  -H "Authorization: Bearer ${JWT_TOKEN}"
```

### Node.js Client Example
```javascript
const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');

// Load proto definitions
const packageDefinition = protoLoader.loadSync('notification_service.proto');
const notificationProto = grpc.loadPackageDefinition(packageDefinition).notification;

// Create client
const client = new notificationProto.NotificationService(
  'notification-service:8080',
  grpc.credentials.createInsecure()
);

// Update preferences
const request = {
  user_id: 'user-123-uuid',
  preferences: {
    email_enabled: true,
    sms_enabled: false,
    push_enabled: true,
    max_daily_emails: 10,
    categories: ['security', 'updates']
  }
};

client.updatePreferences(request, (error, response) => {
  if (error) {
    console.error('Error:', error);
    return;
  }
  console.log('Response:', response);
});
```

## Event Publishing
The service publishes events when preferences are updated:

### Event Schema
```json
{
  "event_type": "preferences.changed",
  "user_id": "user-123-uuid",
  "preferences": {
    "email_enabled": true,
    "sms_enabled": false,
    "push_enabled": true,
    "max_daily_emails": 5,
    "categories": ["security"]
  },
  "timestamp": 1640995200
}
```

## Error Handling

### Common Error Codes
| gRPC Code          | HTTP Status | Description                              |
|--------------------|-------------|------------------------------------------|
| INVALID_ARGUMENT   | 400         | Invalid user ID or preference values     |
| NOT_FOUND          | 404         | User not found (creates defaults)       |
| PERMISSION_DENIED  | 403         | User tier restrictions applied           |
| INTERNAL           | 500         | Database or internal service error       |

### Error Response Format
```json
{
  "error": {
    "code": "INVALID_ARGUMENT",
    "message": "Invalid preferences: max_daily_emails exceeds tier limit",
    "details": {
      "user_tier": "free",
      "max_allowed": 5,
      "requested": 25
    }
  }
}
```

## Deployment Guide

### Kubernetes Configuration
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: notification-service
spec:
  replicas: 3
  selector:
    matchLabels:
      app: notification-service
  template:
    spec:
      containers:
      - name: notification-service
        image: company/notification-service:v1.2.0
        ports:
        - containerPort: 8080
        env:
        - name: DATABASE_URL
          valueFrom:
            secretKeyRef:
              name: notification-secrets
              key: database-url
        - name: REDIS_URL
          value: "redis://redis-service:6379"
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
```

### Environment Variables
| Variable       | Required | Description                    | Example                              |
|----------------|----------|--------------------------------|--------------------------------------|
| DATABASE_URL   | Yes      | PostgreSQL connection string   | postgres://user:pass@host:5432/db   |
| REDIS_URL      | Yes      | Redis connection string        | redis://host:6379                   |
| LOG_LEVEL      | No       | Logging level                  | info (default: info)                |
| GRPC_PORT      | No       | gRPC server port               | 8080 (default: 8080)                |

## Monitoring & Observability

### Metrics Exposed
- `notification_preferences_updates_total`: Total preference updates
- `notification_preferences_errors_total`: Total errors by type
- `notification_service_duration_seconds`: Request duration histogram

### Health Checks
- **Readiness:** `GET /health/ready` - Service ready to accept requests
- **Liveness:** `GET /health/live` - Service is alive and healthy

### Logging Format
```json
{
  "timestamp": "2025-09-28T14:30:15Z",
  "level": "INFO",
  "service": "notification-service",
  "trace_id": "abc123",
  "user_id": "user-123-uuid",
  "action": "update_preferences",
  "duration_ms": 45,
  "tier_applied": "premium"
}
```

## Integration Notes

### Database Schema
The service expects the following database tables:
- `user_preferences`: Stores preference settings
- `user_tiers`: User tier information
- `preference_audit`: Audit log for changes

### Message Queue Integration
Events are published to the configured message queue (Kafka/RabbitMQ) and consumed by:
- Email service (for email preference changes)  
- SMS service (for SMS preference changes)
- Analytics service (for usage tracking)
- Audit service (for compliance logging)

### Dependencies
- PostgreSQL 13+ for data persistence
- Redis 6+ for caching and session management
- Message queue (Kafka recommended) for event publishing

## Key Learning Points
*This section summarizes the most important takeaways about effective prompt usage. It highlights best practices, common mistakes to avoid, and tips for getting better results from AI assistance.*

- Multi-audience documentation requires different levels of detail for each user type
- Include comprehensive examples in multiple programming languages
- Provide both API reference documentation and practical integration guides
- Cover deployment, monitoring, and operational aspects for DevOps teams
- Include error handling examples and troubleshooting information
- Show how the service fits into the larger system architecture

---
*Example Type: Multi-Audience Documentation*
*Complexity Level: Advanced*
*Focus Areas: Microservices, gRPC APIs, Multi-Platform Integration*
