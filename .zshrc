# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/zhangshengjie/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
colored-man-pages
)

source $ZSH/oh-my-zsh.sh


alias run_tfqt="cd /Users/zhangshengjie/tfqt &&  source venv/bin/activate && python app.py"

alias mc="cd ~/mark && claude"
alias mi="cd ~/mark/mark-ios-app && claude"
alias mp="cd ~/mark/sanjay-dev-mark-pi && claude"
alias mm="cd ~/mark/mark-marketing-web && claude"
alias deploy-v3="cd ~/mark/sanjay-dev-mark-pi && ./scripts/deploy.sh --run --version v3 --watch"
alias deploy-ios="cd ~/mark/mark-ios-app && pkill -9 Xcode; pkill -9 xcodebuild; \rm -rf ~/Library/Developer/Xcode/DerivedData && cd /Users/zhangshengjie/mark/mark-ios-app && flutter clean && \rm -rf ios/Pods ios/Podfile.lock && flutter pub get && cd ios && pod install --repo-update && cd .. && flutter run -d 00008110-000C70E21EC1401E"
alias triggerscan='f=/tmp/trigger1_$(date +%Y%m%d_%H%M%S).jpg && cp ~/trigger1.jpg "$f" && cd /Users/zhangshengjie/mark/sanjay-dev-mark-pi && ./scripts/trigger_scan.sh "$f"'
alias mark-stop="bash ~/mark/scripts/close-all.sh"
alias mark-restart="bash ~/mark/scripts/restart-all.sh"
alias eq="python3 /Users/zhangshengjie/english-helper/quiz.py"
alias sz="source ~/.zshrc"

# Kill process by port number
killport() { lsof -ti:$1 | xargs kill -9; }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

. "$HOME/.local/bin/env"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

# Java 21 configuration
export JAVA_HOME=/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="/opt/homebrew/share/google-cloud-sdk/bin:$PATH"
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

#export ANTHROPIC_BASE_URL=https://api.moonshot.ai/anthropic
#export ANTHROPIC_AUTH_TOKEN=sk-wv6nNuscvPR5pQZVllCF4CM6ogwachivKq96RWDDgMlmhpvw
#export ANTHROPIC_MODEL=kimi-k2-thinking
#export ANTHROPIC_SMALL_FAST_MODEL=claude-sonnet-4-5-20250929
#export ANTHROPIC_SMALL_FAST_MODEL=kimi-k2-thinking


# Added by Antigravity
export PATH="/Users/zhangshengjie/.antigravity/antigravity/bin:$PATH"

# Flutter iOS clean rebuild and run
flutter-reset() {
  local device="${1:-00008110-000C70E21EC1401E}"
  pkill -9 Xcode; pkill -9 xcodebuild
  rm -rf ~/Library/Developer/Xcode/DerivedData/* \
    && cd ~/mark/mark-ios-app \
    && flutter clean \
    && rm -rf ios/Pods ios/Podfile.lock \
    && flutter pub get \
    && cd ios && pod install --repo-update && cd .. \
    && flutter run -d "$device"
}

# Amp CLI
export PATH="/Users/zhangshengjie/.amp/bin:$PATH"
