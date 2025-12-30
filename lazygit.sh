GITHUB_LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/jesseduffield/lazygit/releases/latest | jq -r .tag_name | tr -d 'v')
GITHUB_FILE="lazygit_${GITHUB_LATEST_VERSION}_$(uname -s | tr 'A-Z' 'a-z')"_$(uname -m).tar.gz
GITHUB_URL="https://github.com/jesseduffield/lazygit/releases/download/v$GITHUB_LATEST_VERSION/$GITHUB_FILE"

curl -L -s -o lazygit.tar.gz $GITHUB_URL
tar -xvzf lazygit.tar.gz lazygit
install -Dm 755 lazygit -t ~/.local/bin
rm lazygit lazygit.tar.gz

