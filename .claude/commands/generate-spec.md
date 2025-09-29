# Generate Feature Specification

## Feature description: $ARGUMENTS

Create a comprehensive, actionable feature specification with automated codebase analysis.

## Phase 1: Automated Discovery

### Codebase Pattern Analysis
```bash
# Find similar features
rg -l "similar_feature_keywords" --type ts --type tsx
# Identify existing patterns
find . -name "*.spec.ts" -path "*/features/*" | head -5
# Check authentication patterns
rg "useAuth|requireAuth|withAuth" --type ts -A 2
# Database schema patterns
find . -name "*.prisma" -o -name "*.sql" -o -name "*migration*"
```

### Dependency Mapping
- Search for related imports: `rg "import.*{feature_related}" --type ts`
- Check existing API endpoints: `rg "router\.(get|post|put|delete)" --type ts`
- Find UI components: `find ./src/components -name "*.tsx" | grep -i feature_area`

## Phase 2: Requirements Analysis

### User Story Mining
**Format**: As a [user_type], I want [capability] so that [business_value]

**Required Classifications**:
- Critical path (blocks other features)
- Core functionality (MVP)
- Enhancement (can ship without)
- Future consideration (v2)

### Technical Complexity Scoring
Calculate automatically:
- Files to modify: `git ls-files | xargs grep -l "pattern" | wc -l`
- New dependencies: Check against package.json
- Database changes: Schema modifications needed
- API surface: New endpoints required

**Complexity Score**: 
- 1-3: Simple (< 5 files, no deps, no DB)
- 4-6: Medium (5-15 files, deps OR DB)
- 7-10: Complex (> 15 files, deps AND DB)

## Phase 3: Specification Generation

### 1. Executive Summary
- **Feature Name**: [Descriptive, searchable name]
- **Business Value**: [Specific metric improvement expected]
- **Complexity Score**: [Auto-calculated from above]
- **Estimated Effort**: [Based on complexity and similar features]

### 2. Technical Architecture

#### Database Schema
```sql
-- Required changes
ALTER TABLE existing_table ADD COLUMN new_field TYPE;
CREATE TABLE IF NOT EXISTS new_table (...);
```

#### API Design
```typescript
// New endpoints
POST /api/feature
GET /api/feature/:id
PUT /api/feature/:id
DELETE /api/feature/:id

// Request/Response types
interface FeatureRequest { ... }
interface FeatureResponse { ... }
```

#### Frontend Components
```typescript
// Component hierarchy
<FeatureContainer>
  <FeatureList />
  <FeatureDetail />
  <FeatureForm />
</FeatureContainer>
```

### 3. Implementation Checklist

#### Pre-Implementation
- [ ] Review existing patterns in: [list similar files]
- [ ] Confirm database migrations approach
- [ ] Validate API design with team
- [ ] Check accessibility requirements

#### Core Implementation
- [ ] Database schema and migrations
- [ ] API endpoints with validation
- [ ] Frontend components with tests
- [ ] Integration with existing auth/permissions
- [ ] Error handling and logging

#### Validation
- [ ] Unit tests (minimum 80% coverage)
- [ ] Integration tests for API
- [ ] E2E tests for critical paths
- [ ] Performance benchmarks met
- [ ] Security review completed
- [ ] CodeRabbit CLI review passes with no critical issues
- [ ] Any CodeRabbit disagreements resolved via "ghostrider" protocol

#### Blue Project Tracking
- [ ] Major tasks created in Blue "Scoped and Ready" list
- [ ] Tasks moved to "Development" when implementation starts
- [ ] Tasks moved to "Testing" when CodeRabbit review begins
- [ ] Tasks moved to "Done" when validation complete

### 4. Risk Analysis

#### Technical Risks
- **Breaking Changes**: [List any backward compatibility issues]
- **Performance Impact**: [Database queries, API load]
- **Security Concerns**: [Data exposure, permission gaps]

#### Mitigation Strategies
- Feature flags for gradual rollout
- Database indexes for performance
- Rate limiting for API endpoints
- Audit logging for sensitive operations

### 5. Dependencies and Integration

#### External Dependencies
```json
{
  "new-package": "^1.0.0",
  "existing-upgrade": "^2.0.0 -> ^3.0.0"
}
```

#### Internal Dependencies
- Services: [List services that need updates]
- Shared components: [List reusable components]
- Configuration: [Environment variables needed]

### 6. Testing Strategy

#### Unit Tests
```typescript
describe('Feature', () => {
  test('core functionality', () => { ... });
  test('edge cases', () => { ... });
  test('error handling', () => { ... });
});
```

#### Integration Tests
- API endpoint testing with supertest
- Database transaction testing
- Authentication/authorization flows

#### Manual Testing Checklist
- [ ] Happy path user flow
- [ ] Error state handling
- [ ] Mobile responsiveness
- [ ] Accessibility (keyboard nav, screen readers)
- [ ] Performance under load

#### CodeRabbit Integration Testing
- [ ] Run `coderabbit review --plain` on all implementation code
- [ ] Address all security, performance, and type safety issues
- [ ] Document any "ghostrider" disagreements with reasoning
- [ ] Re-run CodeRabbit after fixes to confirm resolution
- [ ] Include CodeRabbit final report in implementation documentation

### 7. Blue Project Management

#### Automated Task Creation
During spec generation, major implementation tasks will be automatically created in Blue project management system:

**Blue CLI Location**: `/Users/tylerboyd/Development/restoration_apparel_company/blue/demo-builder-master/`
**Engineering Project ID**: `cm8dawh1r29yqra2llk6ql5pm`

#### Task Lifecycle
1. **Scoped and Ready** (`cm98t5isa0tbsrx1yr2amtnwh`): Well-defined tasks ready for implementation
2. **Development** (`cm8dcodkf2eq1ra2l7oplkggy`): Tasks currently being coded
3. **Testing** (`cm8dcp3dw2erjra2l3jyy3vjx`): Tasks undergoing CodeRabbit review and validation
4. **Done** (`cm8dcqfim2ev3ra2lu1c9umbj`): Completed and verified tasks

#### Automated Task Management
Claude will automatically:
- Create Blue records for major tasks during spec implementation
- Move tasks between lists as development progresses
- Update task status without explicit user requests
- Mark tasks complete after successful CodeRabbit review

#### Task Creation Commands
**CRITICAL**: Blue CLI is NOT installed globally - all commands MUST be run from the Blue directory.

```bash
# STEP 1: Check for existing tasks before creating (prevent duplicates)
cd /Users/tylerboyd/Development/restoration_apparel_company/blue/demo-builder-master/ && go run . read-records -project cm8dawh1r29yqra2llk6ql5pm -simple | grep -i "TASK_KEYWORDS"

# STEP 2: Create task in Scoped and Ready (only if not already exists)
cd /Users/tylerboyd/Development/restoration_apparel_company/blue/demo-builder-master/ && go run . create-record -project cm8dawh1r29yqra2llk6ql5pm -list cm98t5isa0tbsrx1yr2amtnwh -title "TASK_TITLE" -description "DETAILED_DESCRIPTION" -simple

# STEP 3: Move task through workflow
cd /Users/tylerboyd/Development/restoration_apparel_company/blue/demo-builder-master/ && go run . update-record -record RECORD_ID -move-to-list cm8dcodkf2eq1ra2l7oplkggy  # Development
cd /Users/tylerboyd/Development/restoration_apparel_company/blue/demo-builder-master/ && go run . update-record -record RECORD_ID -move-to-list cm8dcp3dw2erjra2l3jyy3vjx  # Testing
cd /Users/tylerboyd/Development/restoration_apparel_company/blue/demo-builder-master/ && go run . update-record -record RECORD_ID -move-to-list cm8dcqfim2ev3ra2lu1c9umbj  # Done
```

#### Major Tasks for Blue Tracking
Based on feature complexity, major tasks typically include:
- Database schema implementation
- API endpoint development
- Frontend component creation
- Integration testing
- CodeRabbit review and fixes

### 8. Rollout Plan

#### Phase 1: Internal Testing
- Deploy behind feature flag
- Limited access to internal users
- Monitor error rates and performance

#### Phase 2: Beta Release
- Enable for % of users
- Gather feedback and metrics
- Fix critical issues

#### Phase 3: General Availability
- Full rollout
- Documentation updates
- Support team training

### 8. Success Metrics

#### Quantitative
- Feature adoption rate: [target %]
- Performance metrics: [response time targets]
- Error rate: [< threshold]

#### Qualitative
- User satisfaction score
- Support ticket reduction
- Developer experience feedback

## Phase 4: PRP Preparation

### Research Links
Collect during analysis:
- API documentation: [urls]
- Library docs: [urls]
- Design patterns: [urls]
- Security best practices: [urls]

### Code References
- Similar implementations: `path/to/file.ts:line`
- Pattern examples: `path/to/example.ts:line`
- Test examples: `path/to/test.spec.ts:line`

### Outstanding Questions
- [ ] Technical decisions needed
- [ ] Architecture review required
- [ ] Performance optimization approach

### CodeRabbit Validation Requirements
- All implementation code must pass CodeRabbit review
- Critical issues (security, performance, types) are non-negotiable fixes
- Document any disagreements using "ghostrider" protocol
- Include final CodeRabbit report in feature documentation

## Output

### Primary Spec (Mandatory, create directory if not there)
Save to: `docs/specs/{feature-name}-spec.md`

### Supporting Artifacts (Mandatory if applicable)
- `docs/specs/{feature-name}-api.yaml` - OpenAPI spec
- `docs/specs/{feature-name}-db.sql` - Database changes
- `docs/specs/{feature-name}-tests.md` - Test plan

### Validation
Run after generation:
```bash
# Validate spec completeness
grep -c "TODO\|TBD\|FIXME" docs/specs/{feature-name}-spec.md
# Check for broken references
grep -o "path/to/.*\.ts:[0-9]*" docs/specs/{feature-name}-spec.md | while read ref; do
  file=$(echo $ref | cut -d: -f1)
  [ -f "$file" ] || echo "Missing: $file"
done
```

## Usage Notes

This command now:
1. Automatically analyzes your codebase for patterns
2. Calculates complexity scores
3. Generates actionable, specific specifications
4. Prepares for PRP generation
5. Includes validation and rollout planning
6. Provides testable success criteria

The spec is no longer just documentation - it's a blueprint for implementation.
