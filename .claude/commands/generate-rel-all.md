# Generate Release All

## Auto-increment minor versions for all three projects

Automatically generates releases for resto-website, resto-api, and express-creator by:
1. Detecting the current latest version tag in each repository
2. Incrementing the minor version (following semver: MAJOR.MINOR.PATCH)
3. Calling the existing `generate-rel` command for each project

## Process Overview

1. **Version Detection**
   - Navigate to each project directory
   - Get the latest git tag using `git tag --list | grep "^v" | sort -V | tail -1`
   - Parse the version and increment the minor version
   - Handle edge cases (no tags, malformed versions)

2. **Release Generation**
   - Call `generate-rel` command for each project with the calculated next version
   - Projects processed in order: resto-website, resto-api, express-creator

3. **Repository Mapping**
   - **resto-website**: /Users/tylerboyd/Development/restoration_apparel_company/resto-website
   - **resto-api**: /Users/tylerboyd/Development/restoration_apparel_company/resto-api
   - **express-creator**: /Users/tylerboyd/Development/restoration_apparel_company/express-creator

## Implementation

```bash
#!/bin/bash

# Function to get next minor version
get_next_minor_version() {
    local repo_path="$1"
    local repo_name="$2"
    
    cd "$repo_path" || {
        echo "❌ Failed to navigate to $repo_name at $repo_path"
        return 1
    }
    
    # Fetch latest tags from remote
    echo "🔄 Fetching latest tags for $repo_name..."
    git fetch --tags >/dev/null 2>&1
    
    # Get latest version tag
    local current_version=$(git tag --list | grep "^v" | sort -V | tail -1)
    
    if [[ -z "$current_version" ]]; then
        echo "⚠️  No version tags found in $repo_name, starting with v1.0.0"
        echo "v1.0.0"
        return 0
    fi
    
    echo "📍 Current version for $repo_name: $current_version"
    
    # Parse version (remove 'v' prefix and split on dots)
    local version_no_v="${current_version#v}"
    local major=$(echo "$version_no_v" | cut -d. -f1)
    local minor=$(echo "$version_no_v" | cut -d. -f2)
    local patch=$(echo "$version_no_v" | cut -d. -f3)
    
    # Increment minor version, reset patch to 0
    local next_minor=$((minor + 1))
    local next_version="v${major}.${next_minor}.0"
    
    echo "🚀 Next version for $repo_name: $next_version"
    echo "$next_version"
}

# Main execution
echo "🎯 Generating releases for all projects..."
echo "=================================================="

# Source environment for proper shell setup
source ~/.zshrc 2>/dev/null || true

# Array of projects
declare -a projects=(
    "/Users/tylerboyd/Development/restoration_apparel_company/resto-website:resto-website"
    "/Users/tylerboyd/Development/restoration_apparel_company/resto-api:resto-api"
    "/Users/tylerboyd/Development/restoration_apparel_company/express-creator:express-creator"
)

# Process each project
for project in "${projects[@]}"; do
    IFS=':' read -r repo_path repo_name <<< "$project"
    
    echo ""
    echo "🔄 Processing $repo_name..."
    echo "----------------------------------------"
    
    # Get next version
    next_version=$(get_next_minor_version "$repo_path" "$repo_name")
    
    if [[ $? -ne 0 ]]; then
        echo "❌ Failed to determine next version for $repo_name"
        continue
    fi
    
    echo "📦 Calling generate-rel $next_version $repo_name"
    
    # Call the existing generate-rel command
    # Note: This assumes the generate-rel command is available in the current context
    generate-rel "$next_version" "$repo_name"
    
    if [[ $? -eq 0 ]]; then
        echo "✅ Successfully generated release $next_version for $repo_name"
    else
        echo "❌ Failed to generate release for $repo_name"
    fi
done

echo ""
echo "🎉 Release generation complete!"
echo "=================================================="
```

## Usage

Simply run the command without any arguments:

```bash
generate-rel-all
```

## Error Handling

- Validates that each repository directory exists
- Handles repositories with no existing tags (defaults to v1.0.0)
- Continues processing other repositories if one fails
- Provides clear status messages for each step

## Dependencies

- Requires the existing `generate-rel` command to be available
- Requires git repositories to be properly initialized
- Requires proper shell environment setup (sources ~/.zshrc)

## Example Output

```
🎯 Generating releases for all projects...
==================================================

🔄 Processing resto-website...
----------------------------------------
📍 Current version for resto-website: v2.10.0
🚀 Next version for resto-website: v2.11.0
📦 Calling generate-rel v2.11.0 resto-website
✅ Successfully generated release v2.11.0 for resto-website

🔄 Processing resto-api...
----------------------------------------
📍 Current version for resto-api: v1.4.0
🚀 Next version for resto-api: v1.5.0
📦 Calling generate-rel v1.5.0 resto-api
✅ Successfully generated release v1.5.0 for resto-api

🔄 Processing express-creator...
----------------------------------------
📍 Current version for express-creator: v0.3.0
🚀 Next version for express-creator: v0.4.0
📦 Calling generate-rel v0.4.0 express-creator
✅ Successfully generated release v0.4.0 for express-creator

🎉 Release generation complete!
==================================================
```