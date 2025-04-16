read -p "What is your name: " name
echo "Hey, $name"
sleep 5
echo "bye"
#!/bin/bash

# Load environment variables from .env
set -a
source "$(dirname "$0")/.env"
set +a

# Get current timestamp
current_time=$(date +"%A, %B %d, %Y at %I:%M %p")

# Path to the HTML file
html_file="$repo_directory/hello.html"

# Create HTML content
cat <<EOF > "$html_file"
<!DOCTYPE html>
<html>
<body>
    <div>
        <h1>Hello World!</h1>
        <p>Brother, this push happened on <span class="time">$current_time</span></p>
        <p>Keep that streak going! 💪</p>
    </div>

    <div>
        <h1>Ninte thantha alla ente thantha</h1>
    </div>
</body>
</html>
EOF

# Git operations
cd "$repo_directory" || exit
git add hello.html
git commit -m "Daily commit: $(date +'%Y-%m-%d')"
git push "$git_remote" "$git_branch"
