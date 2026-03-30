find ./ -maxdepth 2 -name ".git" -type d | while read gitdir; do
  repo=$(dirname "$gitdir")
  name=$(basename "$repo")
  dirty=$(git -C "$repo" status --porcelain 2>/dev/null)
  if [ -n "$dirty" ]; then
    count=$(echo "$dirty" | wc -l | tr -d ' ')
    echo "UNCOMMITTED: $name ($count changed files)"
  fi
done
