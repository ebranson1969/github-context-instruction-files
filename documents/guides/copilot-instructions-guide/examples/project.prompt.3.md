# Project Prompt Example 3: Feature Implementation Scenario

## Scenario Description
*This section sets up the real-world context and business situation that prompted the need for AI assistance. It explains the background, stakeholders involved, and why this particular type of prompt is needed.*

**REAL BUSINESS SCENARIO**: Lisa, the technical lead, walks into Monday's sprint planning meeting. The product manager drops a bombshell: "Our biggest client, SocialCorp, is threatening to leave unless we add scheduled posting by end of month. They're paying us $500K annually. Legal says we need this feature for contract renewal."

The room goes quiet. Everyone knows this is complex - social media APIs, background jobs, timezone handling, failure retries. The junior developers look terrified. The product manager asks: "How long will this take?"

Instead of giving a wild guess that could ruin the sprint (or her career), Lisa uses the feature implementation prompt template to systematically break down this complex request into realistic tasks with accurate estimates.

**BUSINESS STAKES**:
- **Revenue Risk**: $500K annual contract at stake
- **Timeline Pressure**: 4-week deadline (1 sprint)
- **Team Confidence**: Junior developers need clear guidance
- **Scope Creep Risk**: Feature could spiral out of control without proper planning
- **Technical Debt**: Wrong approach could create long-term maintenance nightmare

**WHY SYSTEMATIC PLANNING MATTERS**: Complex features without proper breakdown lead to:
- Massive scope creep and missed deadlines
- Poor architectural decisions made under pressure  
- Junior developers getting stuck and blocking progress
- Integration failures discovered too late
- Client disappointment and lost contracts

## Context Information
*This section provides specific technical details about the project environment, technology stack, and constraints that will influence the AI's response. Include details like frameworks, databases, team size, compliance requirements, etc.*

**REAL TEAM AND PROJECT CONSTRAINTS**:
- **Team Composition**: 3 backend developers (1 senior, 2 junior), 2 frontend developers (1 senior, 1 mid-level)
- **Current Workload**: Already committed to 70% capacity for other features
- **Architecture**: Monolithic Rails app (can't do major refactoring now)
- **External Dependencies**: Twitter API, LinkedIn API, Facebook Graph API
- **Infrastructure**: Heroku hosting, Sidekiq for background jobs, Redis, PostgreSQL
- **Client Requirements**: Must support 1000+ scheduled posts per day, 99.9% reliability
- **Compliance**: Client deals with financial services - need audit trail

- **Project:** Social Media Management Platform
- **Technology Stack:** Ruby on Rails, PostgreSQL, Sidekiq, Redis, React
- **Timeline:** 4-week sprint (20 working days)
- **Team Size:** 3 backend developers, 2 frontend developers
- **Current System:** Basic posting to social platforms in real-time

## Feature Requirements
*This section contains the actual code, configuration, or content that needs analysis. Keep it realistic and representative of actual work scenarios. Include enough context for meaningful analysis.*

**REAL CLIENT REQUIREMENTS** (from actual client meeting notes):

```
CLIENT EMAIL FROM SOCIALCORP:
Subject: URGENT: Scheduled Posting Feature Required for Contract Renewal

Hi Lisa,

Our social media team manages 50+ client accounts and needs to schedule posts 
in advance. Here's what we need by October 31st:

MUST HAVE (Deal breakers):
- Schedule posts for specific date/time
- Support Twitter, LinkedIn, Facebook  
- Posts can include text, images, links
- Edit/cancel scheduled posts before they publish
- Dashboard showing all scheduled posts
- Automatic retry if post fails
- Handle different timezones (we have global clients)
- Audit trail for compliance (we're SOX regulated)

NICE TO HAVE (If time permits):
- Recurring posts (daily/weekly)
- Bulk upload from CSV
- Custom approval workflow
- Analytics on scheduled posts

TECHNICAL CONSTRAINTS:
- Must handle 1000+ posts per day
- 99.9% delivery reliability required  
- Posts must publish within 5 minutes of scheduled time
- Integration with our existing user management system
- No downtime during deployment

BUSINESS CONTEXT:
This is for our contract renewal. Without this feature, we'll need to 
evaluate other platforms. Current contract value: $500K annually.

Please provide realistic timeline and any risks.

Best regards,
David Chen, CTO - SocialCorp
```

## Applied Prompt Template
*This section shows how to properly use the project prompt template from .github/prompts/project.prompt.md. It demonstrates the correct format, context inclusion, and specific requirements to get the best AI response.*

**HOW LISA USES THIS IN THE MEETING**:

1. **Buys time**: "Let me systematically analyze this before giving estimates"
2. **Gathers context**: Gets all requirements, constraints, team capacity info
3. **Uses template**: Applies feature implementation prompt with all context
4. **Gets breakdown**: Receives detailed task list with time estimates
5. **Makes decision**: Can now give realistic timeline and identify risks
6. **Protects team**: Prevents over-commitment and sets proper expectations

Using the **Feature Implementation Prompt** from `.github/prompts/project.prompt.md`:

```
Help implement the following feature:
- Break down into smaller tasks
- Identify dependencies
- Suggest implementation approach  
- Consider edge cases
- Provide testing strategy

Context: Ruby on Rails social media management platform, $500K client contract at stake
Team: 5 developers (3 backend: 1 senior + 2 junior, 2 frontend: 1 senior + 1 mid), 4-week sprint
Current Architecture: Monolithic Rails app, Sidekiq background jobs, PostgreSQL, Redis, Heroku
External APIs: Twitter, LinkedIn, Facebook (rate limits and auth complexity)
Scale Requirements: 1000+ posts/day, 99.9% reliability, <5min publish accuracy  
Business Constraints: SOX compliance audit trail, no downtime deployment, contract renewal deadline
Team Constraints: 70% capacity already committed, junior developers need guidance

CRITICAL: Contract renewal depends on this. Need realistic breakdown to commit to timeline.

Feature Request: [CLIENT EMAIL REQUIREMENTS ABOVE]
```

## Expected AI Response Structure
*This section shows what kind of response you should expect from the AI when using the prompt correctly. It serves as both a quality benchmark and a template for consistent AI interactions across your team.*

**REAL AI RESPONSE LISA GETS** (This saves the contract!):

```
## 🎯 FEATURE IMPLEMENTATION PLAN: Social Media Post Scheduling

### ⚠️ RISK ASSESSMENT - HONEST EVALUATION
**Contract Risk**: HIGH - This is technically challenging for 4-week timeline
**Team Risk**: MEDIUM - Junior developers will need significant guidance  
**Technical Risk**: HIGH - External API dependencies, timezone complexity
**Recommendation**: Negotiate scope reduction or timeline extension if possible

### 📋 TASK BREAKDOWN WITH REALISTIC TIME ESTIMATES

#### PHASE 1: Foundation & Database (Week 1) - 8 days
**Backend Tasks (Senior Developer):**
1. **Database Schema Design** (2 days)
   ```ruby
   # scheduled_posts table design
   create_table :scheduled_posts do |t|
     t.references :user, null: false, foreign_key: true
     t.text :content, null: false
     t.json :media_attachments # images, links
     t.json :platform_configs # platform-specific settings
     t.datetime :scheduled_at, null: false
     t.string :timezone, null: false
     t.integer :status, default: 0 # enum: pending, published, failed, cancelled
     t.json :platform_responses # API responses for audit trail
     t.integer :retry_count, default: 0
     t.timestamps
   end
   
   add_index :scheduled_posts, [:scheduled_at, :status]
   add_index :scheduled_posts, [:user_id, :scheduled_at]
   ```

2. **Core Models & Validations** (2 days)
   - ScheduledPost model with state machine
   - Platform-specific validation (character limits, media types)
   - Timezone conversion utilities
   - **Junior Developer Task**: Basic CRUD operations

3. **Background Job Infrastructure** (2 days)  
   ```ruby
   class PostPublishingJob < ApplicationJob
     queue_as :critical
     
     retry_on StandardError, wait: :exponentially_longer, attempts: 3
     
     def perform(scheduled_post_id)
       post = ScheduledPost.find(scheduled_post_id)
       # Platform publishing logic
     end
   end
   ```

4. **SOX Compliance Audit Trail** (2 days)
   - Audit log model for compliance
   - User action tracking
   - **CRITICAL**: Must be tamper-proof for SOX

#### PHASE 2: Social Platform Integration (Week 2) - 8 days  
**Backend Tasks (Senior + 1 Junior):**

5. **Social Platform Adapters** (5 days - COMPLEX!)
   ```ruby
   # This is the hardest part - each API is different
   class TwitterAdapter
     def publish(post_content, media = nil)
       # Handle Twitter's specific requirements
       # Character limits, media upload, threading
     end
   end
   
   class LinkedInAdapter
     def publish(post_content, media = nil)  
       # Different auth flow, different media handling
     end
   end
   ```
   - **Risk**: Twitter API changes frequently, LinkedIn has complex auth
   - **Mitigation**: Build adapter pattern for easy API updates

6. **Scheduling Engine** (3 days)
   ```ruby
   # Cron job to process scheduled posts
   class PostSchedulerJob < ApplicationJob
     def perform
       posts_to_publish = ScheduledPost.pending
         .where('scheduled_at <= ?', 5.minutes.from_now)
       
       posts_to_publish.each do |post|
         PostPublishingJob.perform_later(post.id)
       end
     end
   end
   ```

#### PHASE 3: Frontend Interface (Week 2-3) - 10 days
**Frontend Tasks (Senior + Mid-level):**

7. **Post Scheduling Interface** (5 days)
   - Multi-platform selector with preview
   - DateTime picker with timezone support  
   - Media upload with drag-and-drop
   - Character count for each platform
   - **Junior-Friendly**: Can work independently on UI components

8. **Scheduled Posts Dashboard** (3 days)
   - List view with filtering (pending, published, failed)
   - Edit/cancel functionality
   - Status indicators and error messages
   - Bulk operations (nice-to-have)

9. **Error Handling & User Feedback** (2 days)
   - Failed post notifications
   - Retry mechanisms
   - User-friendly error messages

#### PHASE 4: Testing & Polish (Week 3-4) - 8 days

10. **Integration Testing** (3 days)
    ```ruby
    # Critical test scenarios
    RSpec.describe PostSchedulingService do
      it 'handles timezone conversions correctly'
      it 'retries failed posts with exponential backoff'
      it 'respects platform rate limits'
      it 'maintains audit trail for SOX compliance'
    end
    ```

11. **Load Testing** (2 days)
    - Simulate 1000 posts/day load
    - Test concurrent posting scenarios
    - Validate 99.9% reliability requirement

12. **User Acceptance Testing** (2 days)
    - Client demo and feedback
    - Bug fixes and polish

13. **Production Deployment** (1 day)
    - Zero-downtime deployment strategy
    - Feature flags for gradual rollout

### 🚨 MAJOR DEPENDENCIES & RISKS

#### External API Dependencies (HIGH RISK):
- **Twitter API**: Rate limits (300 posts/15min), frequent policy changes
- **LinkedIn API**: Complex OAuth, business account requirements  
- **Facebook Graph API**: App review process, content policy restrictions
- **Mitigation**: Build robust error handling, have fallback strategies

#### Timeline Risks:
- **Week 2 API Integration**: Could extend to 10+ days if APIs are problematic
- **Junior Developer Velocity**: May need more senior oversight than planned
- **Client Feedback**: UAT changes could add 3-5 days

#### Technical Dependencies:
- **Timezone Handling**: Ruby's timezone support can be tricky
- **Background Job Reliability**: Sidekiq failures could break scheduling
- **Database Performance**: 1000+ posts/day needs proper indexing

### 🎯 SUCCESS METRICS & ACCEPTANCE CRITERIA

#### Performance Requirements:
- **Reliability**: 99.9% successful post delivery (allow 1 failure per 1000)
- **Timing Accuracy**: Posts published within 5 minutes of scheduled time
- **Scale**: Handle 1000+ daily posts without performance degradation
- **Response Time**: Dashboard loads in <3 seconds

#### Business Requirements:
- **SOX Compliance**: Complete audit trail of all user actions
- **User Experience**: Intuitive interface that requires minimal training
- **Integration**: Seamless with existing user management system

### ⏰ REALISTIC TIMELINE ASSESSMENT

#### Optimistic Scenario (Everything goes well): 3.5 weeks
#### Realistic Scenario (Normal development issues): 4.5 weeks  
#### Pessimistic Scenario (API problems, scope creep): 6+ weeks

### 💡 SCOPE REDUCTION RECOMMENDATIONS (If timeline is critical):

#### Remove from MVP:
- Recurring posts (add in v2)
- Bulk CSV upload (add later)
- Advanced analytics (use basic success/failure tracking)
- Custom approval workflows

#### Phase 2 Features:
- Multi-account management improvements
- Advanced scheduling (optimal posting times)
- Content templates and libraries

### 🚀 DEPLOYMENT STRATEGY
1. **Feature Flag Rollout**: Enable for test accounts first
2. **Gradual Scale**: Start with 10 posts/day, increase gradually
3. **Monitoring**: Track success rates, performance metrics
4. **Client Communication**: Weekly progress demos, early feedback
```

## Key Learning Points
*This section summarizes the most important takeaways about effective prompt usage. It highlights best practices, common mistakes to avoid, and tips for getting better results from AI assistance.*

**WHAT LISA LEARNED FROM THIS PLANNING SESSION**:

### Before Using Feature Implementation Prompts:
- Would give rough estimates based on gut feeling
- Often missed critical dependencies and risks  
- Junior developers would get stuck without proper task breakdown
- Scope creep would happen because requirements weren't properly analyzed
- Timeline commitments were often unrealistic

### After Using Structured Feature Planning:
- Can give realistic estimates with confidence
- Identifies risks early so they can be mitigated
- Junior developers get clear, manageable tasks
- Client expectations are properly set with honest risk assessment
- Team delivers on commitments because planning was thorough

### Contract Negotiation Impact:
Lisa was able to go back to SocialCorp with:
- **Honest Assessment**: "This is complex, here's why"
- **Realistic Timeline**: "4.5 weeks is realistic, 4 weeks is risky"
- **Scope Options**: "We can deliver core features in 4 weeks if we postpone these nice-to-haves"
- **Risk Mitigation**: "Here are the external dependencies that could cause delays"

**Result**: Client appreciated the honesty and professionalism. They agreed to a 5-week timeline and signed a 2-year contract extension worth $1.2M.

### Feature Planning Best Practices:
1. **Include business context** - AI understood the contract stakes and gave realistic assessments
2. **Specify team composition** - Got tasks appropriate for junior vs senior developers  
3. **List technical constraints** - Recommendations fit within existing architecture
4. **Ask for risk assessment** - Identified potential problems before they became crises
5. **Request multiple scenarios** - Got optimistic/realistic/pessimistic timelines for planning

### Long-term Team Benefits:
- **Junior Developer Growth**: Clear task breakdown helped them contribute meaningfully
- **Client Relationships**: Honest planning built trust and led to contract extension
- **Team Confidence**: Systematic approach reduced stress and uncertainty
- **Technical Quality**: Proper planning prevented rushed architecture decisions

---
*Example Type: Feature Implementation*  
*Complexity Level: Advanced*
*Focus Areas: System Design, API Integration, Background Processing, Team Planning*
*Real Usage: Sprint planning, client negotiations, risk assessment, team coordination*
