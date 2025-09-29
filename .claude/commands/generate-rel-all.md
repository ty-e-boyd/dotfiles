# Generate Release All

## Auto-increment minor versions for all three projects

Automatically generates releases for resto-website, resto-api, and express-creator by:
1. Detecting the current latest version tag in each repository
2. Incrementing the minor version (following semver: MAJOR.MINOR.PATCH)
3. Using Claude to call the existing `generate-rel` command for each project

## Process Overview

This is a Claude orchestration command that:

1. **Version Detection** - Check latest tags in all repositories
2. **Version Calculation** - Calculate next minor version for each
3. **Release Generation** - Call `generate-rel` command for each project

## Repository Mapping

- **resto-website**: /Users/tylerboyd/Development/restoration_apparel_company/resto-website
- **resto-api**: /Users/tylerboyd/Development/restoration_apparel_company/resto-api
- **express-creator**: /Users/tylerboyd/Development/restoration_apparel_company/express-creator

## Implementation Instructions

When this command is executed, Claude should:

1. **Detect current versions** for all three repositories:
   ```bash
   cd /Users/tylerboyd/Development/restoration_apparel_company/resto-website
   git fetch --tags >/dev/null 2>&1
   git tag --list | grep "^v" | sort -V | tail -1
   ```
   
   ```bash
   cd /Users/tylerboyd/Development/restoration_apparel_company/resto-api
   git fetch --tags >/dev/null 2>&1
   git tag --list | grep "^v" | sort -V | tail -1
   ```
   
   ```bash
   cd /Users/tylerboyd/Development/restoration_apparel_company/express-creator
   git fetch --tags >/dev/null 2>&1
   git tag --list | grep "^v" | sort -V | tail -1
   ```

2. **Calculate next minor versions** for each project:
   - Parse current version (e.g., v2.10.0)
   - Increment minor version, reset patch to 0 (e.g., v2.11.0)
   - Handle edge cases (no tags = start with v1.0.0)

3. **Generate releases sequentially**:
   - Call `/generate-rel [next-version] resto-website`
   - Call `/generate-rel [next-version] resto-api` 
   - Call `/generate-rel [next-version] express-creator`

4. **Report progress and results** for each step

## Error Handling

- Continue processing other repositories if one fails
- Report clear error messages for each failure
- Validate that each repository directory exists
- Handle repositories with no existing tags

## Expected Output Format

```
🎯 Generating releases for all projects...
==================================================

📍 Current versions detected:
- resto-website: v2.10.0 → v2.11.0
- resto-api: v1.4.0 → v1.5.0  
- express-creator: v1.5.0 → v1.6.0

🔄 Processing resto-website...
[generate-rel output]

🔄 Processing resto-api...
[generate-rel output]

🔄 Processing express-creator...
[generate-rel output]

🎉 Release generation complete!
==================================================
```

## Usage

Simply run the command without any arguments:

```bash
/generate-rel-all
```

## Dependencies

- Requires the existing `/generate-rel` command to be available
- Requires git repositories to be properly initialized
- Requires proper environment setup for git and gh CLI