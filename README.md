# Workspace
## Code Editors
1. [Visual Studio Code](https://code.visualstudio.com/)
1. [Sublime Text](https://www.sublimetext.com/)
1. [Vim](https://www.vim.org/download.php) | Remember to add `vim` to `PATH`.
1. [Notepads](https://github.com/JasonStein/Notepads) | Replacement for notepad



## Git
* Install [Git](https://git-scm.com/downloads)



## Visual Studio Code
TODO: Add visual studio code portable settings and extension download scripts.
Alternatively, we can use VSCode Portable.



## Windows Terminal
1. Download and install Windows Terminal either from
the [Windows Store]((https://aka.ms/terminal)), or using `winget`.

```PowerShell
winget Install Windows.Terminal
```

2. Configure Windows Terminal
    * Open `settings.json` for Windows Terminal and replace everything with the
    contents of `configs/windows-terminal-settings.json` from this repo.
    * Pick/change/add background images as needed from the `backgrounds` folder.


### Useful Shortcuts to Remember
* Full Screen: `F11` or `Alt+Enter`
* Split Pane: `Alt+Shift+d`
* Close Pane or Tab: `Ctrl+Shift+w`
* Navigating Panes: `Alt+ArrowKeys`
* Zooming into a Pane: `Ctrl+z`
* Toggling Read-Only for a Pane: `Ctrl+r`



## Nerd Fonts
Download a `Nerd Font` from
[nerdfonts.com](https://www.nerdfonts.com/font-downloads). Prime choices include:
* `Caskaydia Cove Nerd Font` -
[Preview](https://www.programmingfonts.org/#cascadia-code) |
[Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip)
* `FiraCode Nerd Font` -
[Preview](https://www.programmingfonts.org/#firacode) |
[Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip)
* `UbuntuMono Nerd Font` -
[Preview](https://www.programmingfonts.org/#ubuntu) |
[Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip)



## PowerShell
Almost all of the customization options here was derived from:
https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal


1. Install the latest PowerShell. Either from the
[Windows Store](https://www.microsoft.com/store/apps/9MZ1SNWT0N5D) or using
`winget`.

```PowerShell
winget Install Microsoft.PowerShell
```

2. Edit or create the PowerShell profile. It should be in `$PROFILE`, aka,
`Documents/PowerShell`.
    * Copy and paste `Microsoft.PowerShell_profile.ps1` from the `configs` folder
    in this repository.
    * Select a theme from [Oh My Posh Themes](https://ohmyposh.dev/docs/themes),
    or use one of the ones saved in `themes/oh-my-posh`.
    * By default the configs use `powerlevel10k_rainbow`. Note: Console title is
    set to `false` here, but the default is `true` with a fresh download.
    * Pick and install any/all of the following and edit
    `Microsoft.PowerShell_profile.ps1` only if any of the add-ons are skipped.
    Otherwise, leave everything as-is:
        * [Oh-My-Posh](https://ohmyposh.dev/docs/windows)
        * [Post-Git](https://github.com/dahlbyk/posh-git)
        * [PSReadLine](https://github.com/PowerShell/PSReadLine)
        * [Terminal-Icons](https://github.com/devblackops/Terminal-Icons)

```PowerShell
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name z
```



## Add-Ons and CLI-Tools
* Music Player - [musickcube](https://github.com/clangen/musikcube/).
* YouTube DL - [youtube-dl](https://github.com/ytdl-org/youtube-dl).

Note: Remember to add `musikcube` to PATH. Also, I've set a `music` alias for
`musikcube`. And you might also want to grab [`ffmpeg`](https://www.ffmpeg.org/)
for any audio-video conversion for `youtube-dl`.


### Useful Functions to Remember
```PowerShell
Dl-Audio ([string] $AudioFormat, [string] $YouTubeLinkOrId)
Dl-Mp3   ([string] $YouTubeLinkOrId)
Dl-Video ([string] $YouTubeLinkOrId)
```