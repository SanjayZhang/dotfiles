#export proxy='socks5://127.0.0.1:7890'
#export http_proxy='socks5://127.0.0.1:7890'
#export https_proxy='socks5://127.0.0.1:7890'

. "$HOME/.local/bin/env"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export PATH="/opt/homebrew/share/google-cloud-sdk/bin:$PATH"
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

export ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic"
export ANTHROPIC_AUTH_TOKEN="sk-MKWdIHLNy0ARKCkhqStq8V3hf3tcH7xuXd9t4rUfu5ClkJOo"
export ANTHROPIC_MODEL="kimi-k2-thinking"
export ANTHROPIC_SMALL_FAST_MODEL="claude-sonnet-4-5-20250929"
