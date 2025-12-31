__CHEST="$HOME/.chest"
declare -a post_cd_hooks

# Check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}
