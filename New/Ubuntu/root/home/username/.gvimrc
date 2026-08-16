" See .vimrc for color scheme info

function! SetColorSchemeForGnome()
  let color_scheme = system('gsettings get org.gnome.desktop.interface color-scheme')
  if color_scheme =~ 'prefer-light' || color_scheme =~ 'default'
    colorscheme default
    set background=light
  else
    colorscheme torte
    set background=dark
  endif
endfunction

function! SetColorSchemeForWindows()
  let color_scheme = system('powershell
    \ Get-ItemPropertyValue
    \ -Path \"HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize\"
    \ -Name AppsUseLightTheme')
  if color_scheme == 1
    colorscheme default
    set background=light
  else
    colorscheme torte
    set background=dark
  endif
endfunction

if has('gui_running')
  " Initial dimensions
  set lines=12 columns=100

  " Font
  if has('win32')
    "set guifont=Fantasque_Sans_Mono:h12:cANSI:qDRAFT
    set guifont=Terminal:h9:cOEM:qDRAFT
  else
    "set guifont=Fantasque\ Sans\ Mono\ 12
    "set guifont=Terminus\ \(TTF\)\ 12
    set guifont=Ubuntu\ Mono\ 12
  endif

  " Color scheme
  if has('win32')
    call SetColorSchemeForWindows()
  else
    call SetColorSchemeForGnome()
  endif

  " Cursor
  highlight Cursor gui=reverse guifg=NONE guibg=NONE
  set guicursor=a:block-Cursor

  " Enable/disable menubar (m), toolbar (T) and scrollbars (r, b)
  set guioptions+=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=b

  " Tab names only show file tail name + modify flag
  "set guitablabel=%t\ %m
endif
