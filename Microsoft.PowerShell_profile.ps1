# A command-line installer for Windows.
if (!(Get-Command scoop -errorAction SilentlyContinue)) {
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}


# Predictive IntelliSense
Set-PSReadLineOption -PredictionSource History


# The minimal, blazing-fast, and infinitely customizable prompt for any shell!
if (!(Get-Command starship -errorAction SilentlyContinue)) {
  scoop install starship
}
Invoke-Expression (&starship init powershell)

# A command-line fuzzy finder
if (!(Get-Command fzf -errorAction SilentlyContinue)) {
  scoop install fzf
}

# The next gen ls command
if (!(Get-Command lsd -errorAction SilentlyContinue)) {
  scoop install lsd
}
Set-Alias ls 'lsd'

# A cat(1) clone with wings.
if (!(Get-Command bat -errorAction SilentlyContinue)) {
  scoop install bat
}
Set-Alias cat 'bat --paging=never'
Set-Alias less 'bat'

# ripgrep recursively searches directories for a regex pattern while respecting your gitignore
if (!(Get-Command rg -errorAction SilentlyContinue)) {
  scoop install ripgrep
}

# A simple, fast and user-friendly alternative to 'find'
if (!(Get-Command fd -errorAction SilentlyContinue)) {
  scoop install fd
}

# A viewer for git and diff output
if (!(Get-Command delta -errorAction SilentlyContinue)) {
  scoop install delta
  git config --global core.pager 'delta'
  git config --global interactive.diffFilter 'delta --color-only'
  git config --global delta.line-numbers true
  git config --global delta.diff-so-fancy true
  git config --global delta.keep-plus-minus-markers true
}

# Tools implemented in Rust
if (Get-Command cargo -errorAction SilentlyContinue) {
  & (Join-Path (Get-Item $PROFILE).DirectoryName 'Use-RustTools.ps1')
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Import-Module 'C:\src\vcpkg\scripts\posh-vcpkg'

Set-PsEnv
