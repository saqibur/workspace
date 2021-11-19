function Randomize-Terminal-Background-Image {
    [string] $BackgroundImagesDirectory = "C:\workspace\backgrounds"

    $TermProfile = (Get-Item -Path "${ENV:LocalAppData}\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json").FullName

    # TODO: Change this, so that instead of a particular image, we get to choose
    #       from different profiles.
    $Pics        = (Get-Childitem $BackgroundImagesDirectory).FullName


    $Raw           = Get-Content -Path $TermProfile -Raw
    $TerminalJson  = ConvertFrom-Json -InputObject $Raw

    $CurrentBackground = ($TerminalJson.profiles.list).Where({ $_.name -eq 'PowerShell' }).backgroundImage.replace("\","\\")
    $NewBackground     = ($Pics | Get-Random).replace("\", "\\")

    $Raw.Replace($CurrentBackground, $NewBackground) | Set-Content -Path $TermProfile
}

Randomize-Terminal-Background-Image



oh-my-posh --init --shell pwsh --config C:\workspace\themes\oh-my-posh\powerlevel10k_rainbow.omp.json | Invoke-Expression

Import-Module -Name Terminal-Icons
Import-Module -Name posh-git
Import-Module z

# --- PSReadline Configs ---
Import-Module PSReadLine

# `ForwardChar` accepts the entire suggestion text when the cursor is at the end of the line.
# This custom binding makes `RightArrow` behave similarly - accepting the next word instead of the entire suggestion text.
Set-PSReadLineKeyHandler -Key RightArrow `
                         -BriefDescription ForwardCharAndAcceptNextSuggestionWord `
                         -LongDescription "Move cursor one character to the right in the current editing line and accept the next word in suggestion when it's at the end of current editing line" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($cursor -lt $line.Length) {
        [Microsoft.PowerShell.PSConsoleReadLine]::ForwardChar($key, $arg)
    } else {
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptNextSuggestionWord($key, $arg)
    }
}

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function Complete

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# --- PSReadline Configs End ---


# --- MusikCube Configs ----
Set-Alias -Name music -Value musikcube
# --- MusikCube Configs End ---


# --- YouTube-Dl Configs ---
Set-Alias -Name YTDL_DOWNLOAD_LOCATION -Value "C:\workspace\cli-tools\youtube-dl\downloads\"
function Dl-Audio ([string] $AudioFormat, [string] $YouTubeLinkOrId) {
    [string] $AudioSavePath = "C:\workspace\cli-tools\youtube-dl\downloads\audio\%(title)s.%(ext)s"

    youtube-dl --extract-audio --audio-format $AudioFormat --output  $AudioSavePath $YouTubeLinkOrId
}

function Dl-Mp3 ([string] $YouTubeLinkOrId) {
    Dl-Audio "mp3" $YouTubeLinkOrId
}

function Dl-Video ([string] $YouTubeLinkOrId) {
    [string] $VideoSavePath = "C:\workspace\cli-tools\youtube-dl\downloads\video\%(title)s.%(ext)s"

    youtube-dl -f "bestvideo[height<=1080,ext=mp4]+bestaudio[ext=m4a]" --output $VideoSavePath $YouTubeLinkOrId
}
# --- YouTube-Dl Configs End ---
