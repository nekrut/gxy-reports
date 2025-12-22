#!/bin/bash
# Galaxy Year in Review - Stats Fetcher
# Fetches commit counts, PR counts, and other metrics from GitHub API
# Usage: ./fetch_stats.sh [year]

YEAR=${1:-$(date +%Y)}
START_DATE="${YEAR}-01-01T00:00:00Z"
END_DATE="${YEAR}-12-31T23:59:59Z"

echo "=========================================="
echo "Galaxy Stats for ${YEAR}"
echo "=========================================="
echo ""

# Function to get commit count from pagination header
get_commit_count() {
    local repo=$1
    local count=$(curl -s "https://api.github.com/repos/${repo}/commits?since=${START_DATE}&until=${END_DATE}&per_page=1" -I 2>/dev/null | grep -i "link:" | grep -oP 'page=\d+(?=>; rel="last")' | grep -oP '\d+')
    echo "${count:-0}"
}

# Function to get merged PR count
get_pr_count() {
    local repo=$1
    local count=$(curl -s "https://api.github.com/search/issues?q=repo:${repo}+is:pr+is:merged+merged:${YEAR}-01-01..${YEAR}-12-31" 2>/dev/null | grep -oP '"total_count":\s*\K\d+' | head -1)
    echo "${count:-0}"
}

# Function to get release count
get_release_count() {
    local repo=$1
    local count=$(curl -s "https://api.github.com/repos/${repo}/releases?per_page=100" 2>/dev/null | grep -c "\"published_at\": \"${YEAR}")
    echo "${count:-0}"
}

echo "=== Core Repositories ==="
echo ""

# Galaxy Core
echo -n "galaxyproject/galaxy: "
GALAXY_COMMITS=$(get_commit_count "galaxyproject/galaxy")
GALAXY_PRS=$(get_pr_count "galaxyproject/galaxy")
echo "${GALAXY_COMMITS} commits, ${GALAXY_PRS} PRs"

# Training Material
echo -n "galaxyproject/training-material: "
GTN_COMMITS=$(get_commit_count "galaxyproject/training-material")
GTN_PRS=$(get_pr_count "galaxyproject/training-material")
echo "${GTN_COMMITS} commits, ${GTN_PRS} PRs"

# Tools IUC
echo -n "galaxyproject/tools-iuc: "
IUC_COMMITS=$(get_commit_count "galaxyproject/tools-iuc")
IUC_PRS=$(get_pr_count "galaxyproject/tools-iuc")
echo "${IUC_COMMITS} commits, ${IUC_PRS} PRs"

# IWC
echo -n "galaxyproject/iwc: "
IWC_COMMITS=$(get_commit_count "galaxyproject/iwc")
IWC_PRS=$(get_pr_count "galaxyproject/iwc")
echo "${IWC_COMMITS} commits, ${IWC_PRS} PRs"

echo ""
echo "=== Infrastructure & Developer Tools ==="
echo ""

# Planemo
echo -n "galaxyproject/planemo: "
PLANEMO_COMMITS=$(get_commit_count "galaxyproject/planemo")
PLANEMO_PRS=$(get_pr_count "galaxyproject/planemo")
PLANEMO_RELEASES=$(get_release_count "galaxyproject/planemo")
echo "${PLANEMO_COMMITS} commits, ${PLANEMO_PRS} PRs, ${PLANEMO_RELEASES} releases"

# Pulsar
echo -n "galaxyproject/pulsar: "
PULSAR_COMMITS=$(get_commit_count "galaxyproject/pulsar")
PULSAR_PRS=$(get_pr_count "galaxyproject/pulsar")
PULSAR_RELEASES=$(get_release_count "galaxyproject/pulsar")
echo "${PULSAR_COMMITS} commits, ${PULSAR_PRS} PRs, ${PULSAR_RELEASES} releases"

# TPV
echo -n "galaxyproject/total-perspective-vortex: "
TPV_COMMITS=$(get_commit_count "galaxyproject/total-perspective-vortex")
TPV_PRS=$(get_pr_count "galaxyproject/total-perspective-vortex")
TPV_RELEASES=$(get_release_count "galaxyproject/total-perspective-vortex")
echo "${TPV_COMMITS} commits, ${TPV_PRS} PRs, ${TPV_RELEASES} releases"

# Galaxy Charts
echo -n "galaxyproject/galaxy-charts: "
CHARTS_COMMITS=$(get_commit_count "galaxyproject/galaxy-charts")
CHARTS_PRS=$(get_pr_count "galaxyproject/galaxy-charts")
echo "${CHARTS_COMMITS} commits, ${CHARTS_PRS} PRs"

echo ""
echo "=== Totals ==="
TOTAL_COMMITS=$((GALAXY_COMMITS + GTN_COMMITS + IUC_COMMITS))
echo "Core repos (galaxy + training-material + tools-iuc): ${TOTAL_COMMITS} commits"

echo ""
echo "=== IWC Workflow Categories ==="
WF_COUNT=$(curl -s "https://api.github.com/repos/galaxyproject/iwc/contents/workflows" 2>/dev/null | grep -c '"name"')
echo "Workflow categories: ${WF_COUNT}"

echo ""
echo "=========================================="
echo "Note: Usage stats (jobs, users, datasets) must be"
echo "obtained from Looker Studio dashboard manually:"
echo "https://lookerstudio.google.com/u/0/reporting/8cfee054-2ddd-4711-af5a-a7a8d62076bb"
echo "=========================================="
