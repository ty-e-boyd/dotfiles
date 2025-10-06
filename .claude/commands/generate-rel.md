# Generate Release

## Version and Repository: $ARGUMENTS

Generate a comprehensive GitHub release and update the resto-website releases.js file. Expected format: `generate-rel v1.0.0 express-creator` or `generate-rel v2.1.0 resto-api`

## Process Overview

1. **Parse Arguments**
   - Extract version number (e.g., v1.0.0)
   - Extract repository name (express-creator, resto-api, resto-website)
   - Validate inputs and ensure we're in the correct directory

2. **Git History Analysis**
   - Source ~/.zshrc for proper environment setup
   - Navigate to the specified repository directory
   - Analyze git log since last release tag (or from beginning if first release)
   - Gather commit messages, feature additions, and significant changes
   - Use gh CLI to check existing releases and PRs

3. **Release Notes Generation**
   - Create comprehensive release notes with:
     - TLDR summary (3-5 key bullet points)
     - Detailed sections covering features, improvements, fixes, technical changes
     - Timeline-based organization of development
   - Follow the existing release note format from releases.js

4. **GitHub Release Creation**
   - Use gh CLI to create the GitHub release with proper tagging
   - Include comprehensive release notes in GitHub release
   - Ensure release is properly tagged and published

5. **Update resto-website releases.js**
   - Navigate to /Users/tylerboyd/Development/restoration_apparel_company/resto-website/src/lib/data/releases.js
   - Add new release to appropriate section:
     - `websiteReleases` for resto-website
     - `apiReleases` for resto-api
     - `expressCreatorReleases` for express-creator
     - `restoBaseReleases` for kb-chat-ui (displayed as "The Resto Base")
   - Follow existing structure with title, subtitle, tldr, and sections
   - Ensure helper functions are updated if needed

## Repository Mapping

- **express-creator**: /Users/tylerboyd/Development/restoration_apparel_company/express-creator
- **resto-api**: /Users/tylerboyd/Development/restoration_apparel_company/resto-api
- **resto-website**: /Users/tylerboyd/Development/restoration_apparel_company/resto-website
- **kb-chat-ui**: /Users/tylerboyd/Development/restoration_apparel_company/kb-chatbot-ui

## Validation Steps

```bash
# Ensure git repo is clean and ready
git status

# Verify gh CLI access
gh auth status

# Test releases.js syntax and build
cd /Users/tylerboyd/Development/restoration_apparel_company/resto-website
npm run build

# CRITICAL: Check if semantic version sorting works correctly
node -e "
const { getAllWebsiteReleaseSlugs } = require('./src/lib/data/releases.js');
const releases = getAllWebsiteReleaseSlugs();
console.log('First release (should be newest):', releases[0]);
if (releases[0] !== 'v${VERSION}') {
  console.log('❌ WARNING: New release may not appear as newest due to sorting issue');
  console.log('Current order:', releases.slice(0, 3));
} else {
  console.log('✅ Release will appear as newest');
}
"

# Verify release routes work (if dev server running)
curl -s http://localhost:5173/releases/api/[version] | jq .
```

## Output Requirements

1. Create GitHub release with version tag
2. Update releases.js with new release entry
3. Verify release appears on resto-website /releases route
4. Confirm all links and routing work correctly

## Error Handling

- Validate version format (must start with 'v')
- Check repository exists and is a git repo
- Ensure gh CLI is authenticated
- Verify releases.js file structure remains valid
- Handle cases where version already exists

## Known Issues & Troubleshooting

### **Version Sorting Issue (CRITICAL)**
- **Problem**: The `/releases` page uses lexicographic sorting which breaks with double-digit version numbers
- **Symptoms**: v2.10.0 appears after v2.9.0 instead of as newest release
- **Root Cause**: `.sort().reverse()` does string comparison, not semantic version comparison
- **Fix Required**: Replace with semantic version sorting function in `/src/routes/releases/+page.svelte`
- **Detection**: Run the validation check above - if new release isn't first, sorting is broken

### **Release Visibility Issues**
- **Build Success ≠ Live Deployment**: Just because build succeeds doesn't mean website is immediately updated
- **Manual Verification**: Always check the live `/releases` page after deployment
- **Cache Issues**: May need to clear browser cache to see new releases

## Success Criteria

- GitHub release created and published
- releases.js updated with proper structure
- **NEW**: Semantic version sorting validation passes (new release appears first)
- Website displays new release correctly with "newest" tag
- All validation commands pass
- Release notes are comprehensive and well-formatted

## Process Improvements from v2.10.0 Experience

### **What Worked Well**
- Comprehensive git history analysis with PR details
- Structured release notes generation following existing format
- Automated GitHub release creation
- Build validation catches syntax errors

### **What to Improve**
- Always run semantic version sorting check immediately after updating releases.js
- Don't assume "newest" tag will work without verification
- Test the actual user-facing /releases page behavior, not just data structure
- Consider deployment vs. build completion distinction