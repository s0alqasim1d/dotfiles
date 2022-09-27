$MPV_URL="https://www.youtube.com/watch?v=pFS4zYWxzNA"
$MPV_URL2="https://www.youtube.com/watch?v=XMEXPkPmmq0"
$GITHUB="https://github.com"
$SCOOP_APPS_DIR="C:\Users\s.alqasim\scoop\apps"
$POSH_THEMES_DIR="oh-my-posh\current\themes"
# $THEME="$POSH_THEMES_DIR\ys.omp.json"
# $THEME="$POSH_THEMES_DIR\zash.omp.json"
# $THEME="$POSH_THEMES_DIR\smoothie.omp.json"
# $THEME="$POSH_THEMES_DIR\space.omp.json"
# $THEME="$POSH_THEMES_DIR\spaceship.omp.json"
# $THEME="$POSH_THEMES_DIR\craver.omp.json"
# $THEME="$POSH_THEMES_DIR\robbyrussel.omp.json"
# $THEME="$POSH_THEMES_DIR\xtoys.omp.json"
# $THEME="$POSH_THEMES_DIR\stelbent.minimal.omp.json"
# $THEME="$POSH_THEMES_DIR\pure.omp.json"
# $THEME="$POSH_THEMES_DIR\negligible.omp.json"
# $THEME="$POSH_THEMES_DIR\markbull.omp.json"
# $THEME="$POSH_THEMES_DIR\microverse-power.omp.json"
# $THEME="$POSH_THEMES_DIR\cert.omp.json"
# $THEME="$POSH_THEMES_DIR\clean-detailed.omp.json"
# $THEME="$POSH_THEMES_DIR\capr4n.omp.json"
# $THEME="$POSH_THEMES_DIR\cloud-native-azure.omp.json"
# $THEME="$POSH_THEMES_DIR\M365Princess.omp.json"
# $THEME="$POSH_THEMES_DIR\bubbles.omp.json"
# $THEME="$POSH_THEMES_DIR\bubblesline.omp.json"
# $THEME="$POSH_THEMES_DIR\lambda.omp.json"
# $THEME="$POSH_THEMES_DIR\emodipt.omp.json"
# $THEME="$POSH_THEMES_DIR\half-life.omp.json"
# $THEME="$POSH_THEMES_DIR\iterm2.omp.json"
# $THEME="$POSH_THEMES_DIR\powerlevel10k_lean.omp.json"
# $THEME="$POSH_THEMES_DIR\agnoster.omp.json"
# $THEME="$POSH_THEMES_DIR\blueish.omp.json"
# $THEME="$POSH_THEMES_DIR\agnoster.omp.json"
# $THEME="$POSH_THEMES_DIR\atomicbit.omp.json"
# $THEME="$POSH_THEMES_DIR\montys.omp.json"
# $THEME="$POSH_THEMES_DIR\kali.omp.json"
# $THEME="$POSH_THEMES_DIR\sonicboom_dark.omp.json"
# $THEME="$POSH_THEMES_DIR\peru.omp.json"
$THEME="$POSH_THEMES_DIR\di4am0nd.omp.json"
# $THEME="$POSH_THEMES_DIR\tokyo.omp.json"

oh-my-posh prompt init pwsh --config "$SCOOP_APPS_DIR/$THEME" | iex
# Enable-PoshTransientPrompt
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -BellStyle None
# Set-PSReadLineOption -EditMode Vim

Import-Module posh-git
Import-Module DockerCompletion
Clear-Host
