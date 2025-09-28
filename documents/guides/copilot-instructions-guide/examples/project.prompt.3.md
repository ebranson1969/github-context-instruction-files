# Project Prompt Example 3: Feature Implementation Scenario

## Scenario Description
*This section sets up the real-world context and business situation that prompted the need for AI assistance. It explains the background, stakeholders involved, and why this particular type of prompt is needed.*

The product team has requested a new feature allowing users to schedule social media posts in advance with support for multiple platforms (Twitter, LinkedIn, Facebook). This is a complex feature requiring database design, background job processing, and third-party API integration.

## Context Information
*This section provides specific technical details about the project environment, technology stack, and constraints that will influence the AI's response. Include details like frameworks, databases, team size, compliance requirements, etc.*

- **Project:** Social Media Management Platform
- **Technology Stack:** Ruby on Rails, PostgreSQL, Sidekiq, Redis, React
- **Timeline:** 4-week sprint
- **Team Size:** 3 backend developers, 2 frontend developers
- **Current System:** Basic posting to social platforms in real-time

## Feature Requirements
*This section contains the actual code, configuration, or content that needs analysis. Keep it realistic and representative of actual work scenarios. Include enough context for meaningful analysis.*

```
User Story: As a social media manager, I want to schedule posts in advance 
so that I can maintain consistent content publishing without manual intervention.

Acceptance Criteria:
- Users can schedule posts for specific date/time
- Support for Twitter, LinkedIn, Facebook platforms
- Posts can include text, images, and links
- Users can edit/cancel scheduled posts
- Dashboard shows all scheduled posts
- Automatic retry for failed posts
- Timezone support for global users

Business Requirements:
- Must handle 1000+ scheduled posts per day
- 99.9% delivery reliability required
- Posts must publish within 5 minutes of scheduled time
- Support for recurring/repeated posts (future enhancement)
```

## Applied Prompt Template
*This section shows how to properly use the project prompt template from .github/prompts/project.prompt.md. It demonstrates the correct format, context inclusion, and specific requirements to get the best AI response.*

Using the **Feature Implementation Prompt** from `.github/prompts/project.prompt.md`:

```
Help implement the following feature:
- Break down into smaller tasks
- Identify dependencies
- Suggest implementation approach
- Consider edge cases
- Provide testing strategy

Context: Ruby on Rails social media management platform
Team: 5 developers (3 backend, 2 frontend), 4-week sprint
Current Architecture: Monolithic Rails app with background jobs via Sidekiq
Scale Requirements: 1000+ posts/day, 99.9% reliability

Feature Request: [FEATURE REQUIREMENTS INSERTED ABOVE]
```

## Expected AI Response Structure
*This section shows what kind of response you should expect from the AI when using the prompt correctly. It serves as both a quality benchmark and a template for consistent AI interactions across your team.*

```
## Feature Implementation Plan: Scheduled Social Media Posts

### Task Breakdown

#### Phase 1: Database & Backend Foundation (Week 1)
**Backend Tasks:**
1. **Database Schema Design** (2 days)
   - Create `scheduled_posts` table
   - Add platform-specific configuration fields
   - Design attachment/media storage strategy

2. **Core Models & Validations** (2 days)
   - ScheduledPost model with state machine
   - Platform-specific validation rules
   - Timezone handling implementation

3. **Background Job Infrastructure** (1 day)
   - PostPublishingJob for Sidekiq
   - Retry logic with exponential backoff
   - Dead job handling and notifications

#### Phase 2: API Integration & Publishing (Week 2)
**Backend Tasks:**
4. **Social Platform Adapters** (3 days)
   - Twitter API v2 integration
   - LinkedIn API integration  
   - Facebook Graph API integration
   - Unified publishing interface

5. **Scheduling Engine** (2 days)
   - Cron job for post processing
   - Batch processing optimization
   - Timezone conversion logic

#### Phase 3: User Interface (Week 3)
**Frontend Tasks:**
6. **Post Scheduling Form** (3 days)
   - Multi-platform selector
   - Date/time picker with timezone
   - Media upload interface
   - Preview functionality

7. **Scheduled Posts Dashboard** (2 days)
   - List view with filtering
   - Edit/cancel functionality
   - Status tracking display

#### Phase 4: Testing & Polish (Week 4)
8. **Comprehensive Testing** (3 days)
9. **Performance Optimization** (1 day)
10. **Documentation & Deployment** (1 day)

### Dependencies & Prerequisites

#### Technical Dependencies
- **External APIs**: Twitter, LinkedIn, Facebook developer accounts
- **Infrastructure**: Redis for job queuing, cron job scheduler
- **Storage**: S3 or equivalent for media files

#### Team Dependencies
- **Design**: UI mockups for scheduling interface (needed by Week 2)
- **DevOps**: Production deployment pipeline updates
- **QA**: Test accounts for each social platform

### Implementation Approach

#### Database Schema
```ruby
class CreateScheduledPosts < ActiveRecord::Migration
  def change
    create_table :scheduled_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.json :platform_settings # Platform-specific configs
      t.datetime :scheduled_at
      t.string :timezone
      t.string :status # pending, published, failed, cancelled
      t.json :publish_results # Store API responses
      t.integer :retry_count, default: 0
      t.timestamps
    end
    
    add_index :scheduled_posts, [:scheduled_at, :status]
  end
end
```

#### Core Service Class
```ruby
class PostScheduler
  def schedule_post(user:, content:, platforms:, scheduled_at:, timezone:)
    post = ScheduledPost.create!(
      user: user,
      content: content,
      platform_settings: platforms,
      scheduled_at: scheduled_at.in_time_zone(timezone),
      timezone: timezone,
      status: 'pending'
    )
    
    PostPublishingJob.perform_at(post.scheduled_at, post.id)
    post
  end
end
```

### Edge Cases & Considerations

#### Scheduling Edge Cases
1. **Past Dates**: Prevent scheduling posts in the past
2. **Platform Limits**: Handle character limits per platform
3. **API Rate Limits**: Respect platform-specific rate limiting
4. **Timezone Changes**: Handle DST transitions correctly

#### Failure Scenarios
1. **API Downtime**: Queue for retry when platforms are unavailable
2. **Invalid Tokens**: Handle expired OAuth tokens gracefully
3. **Content Violations**: Handle platform-specific content rejections
4. **User Account Issues**: Handle suspended social accounts

#### Scale Considerations
1. **Job Queue Management**: Prevent job queue overflow during peak times
2. **Database Performance**: Optimize queries for large post volumes
3. **Memory Usage**: Handle large media files efficiently

### Testing Strategy

#### Unit Tests
- Model validations and associations
- Service class business logic
- Platform adapter functionality
- Timezone conversion accuracy

#### Integration Tests
- End-to-end post scheduling flow
- API integration with mocked responses
- Background job processing
- Error handling and retry logic

#### System Tests
- User interface workflows
- Multi-platform posting scenarios
- Timezone handling across different users

#### Performance Tests
- Database query performance with large datasets
- Background job processing under load
- API response time monitoring

### Success Metrics
- **Reliability**: 99.9% successful post delivery
- **Performance**: Posts published within 5 minutes of scheduled time
- **User Experience**: Scheduling interface usable within 3 clicks
- **Scale**: Handle 1000+ daily scheduled posts without degradation
```

## Key Learning Points
*This section summarizes the most important takeaways about effective prompt usage. It highlights best practices, common mistakes to avoid, and tips for getting better results from AI assistance.*

- Break complex features into manageable phases with clear deliverables
- Identify all dependencies early, including external API limitations
- Consider edge cases and failure scenarios from the beginning
- Provide specific implementation examples with code snippets
- Include comprehensive testing strategy covering all aspects
- Define success metrics to validate the implementation

---
*Example Type: Feature Implementation*
*Complexity Level: Advanced*
*Focus Areas: System Design, API Integration, Background Processing*
