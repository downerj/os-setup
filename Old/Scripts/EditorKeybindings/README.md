# Keybindings for Editors

Note: The command syntax for Vim and for Emacs is unique to each editor.

## Opening/editing files
| Command | Vim | Emacs | Nano |
| - | - | - | - |
| Open a file in a new buffer | :edit *filepath* <br/> :e *filepath* | | |
| Edit a new file | :enew | | |
| Edit a new named file | :edit *newFilepath* <br/> :e *newFilepath* | | |
| Open a file in new tab | :tabedit *filepath* <br/> :tabe *filepath* | | |
| Open a new tab | :tabedit <br/> :tabe <br/> :tabnew | | |
| Open a new vertical window | :vsplit <br/> :vnew <br/> ^w v | | |
| Open a file in a new vertical window | :vsplit *filepath* | | |
| Open a new horizontal window | :split <br/> ^w s <br/> :new <br/> ^w n | | |
| Open a file in a new horizontal window | :split *filepath* | | |

## File operations
| Command | Vim | Emacs | Nano |
| - | - | - | - |
| Get current working directory/filepath | :pwd | | |
| Revert/reload file to buffer | :edit <br/> :e | | |
| Force revert buffer | :edit! <br/> :e! | | |
| Save file/buffer (first time) | :write *filepath* <br/> :w *filepath* | | |
| Save file/buffer | :write <br/> :w | | |
| Save all files/buffers | :wall <br/> :wa | | |
| Close window | :quit <br/> :q | | |
| Close tab | :quit <br/> :q | | |
| Force close window/tab | :quit! <br/> :q! | | |
| Close/kill file buffer | :bdelete <br/> :bd | | |
| Force kill buffer | :bdelete! <br/> :bd! | | |
| Quit (close all) | :qall <br/> :qa | | |
| Quit window (non-editor) | | | |
| Force quit (without saving) | :qall! <br/> :qa! | | |

## Window/tab/buffer navigation
| Command | Vim | Emacs | Nano |
| - | - | - | - |
| Navigate between windows | ^w LEFT <br/> ^w RIGHT <br/> ^w UP <br/> ^w DOWN | | |
| Navigate between tabs | :tabnext <br/> :tabn <br/> :tabprev <br/> :tabp | | |
| Navigate between buffers | :bnext <br/> :bn <br/> :bprev <br/> :bp | | |
| Goto buffer by name/number | :buffer *bufferNameOrNum* <br/> :b*bufferNum* | | |
| Move all buffers into tabs | :tab ball | | |

## Executing commands
| Command | Vim | Emacs | Nano |
| - | - | - | - |
| Execute a native command | :execute *quotedVimScript* | | |
| Cancel the current command | ESC | | |
| Run a shell command | :!command | | |
| Open a terminal window | :terminal | | |

## Display options
| Command | Vim | Emacs | Nano |
| - | - | - | - |
| Show whitespace | :set list | | |
| Hide whitespace | :set nolist | | |

## Page/line navigation
| Command | Vim | Emacs | Nano |
| - | - | - | - |
| Goto line | :*lineNum* | | |
| Jump to top | gg <br/> ^HOME | | |
| Jump to bottom | G <br/> ^END | | |
| Page up | ^b <br/> PAGEUP | | |
| Page down | ^f <br/> PAGEDOWN | | |
| Scroll up one line | ^y | | |
| Scroll down one line | ^e | | |
| Goto previous word | b | | |
| Goto next word | w | | |
| Goto beginning of line (non-blank) | ^ | | |
| Goto beginning of line (absolute) | 0 <br/> HOME | | |
| Goto end of line | $ <br/> END | | |

## Search &amp; replace
| Command | Vim | Emacs | Nano |
| - | - | - | - |
| Search | /*regexPattern* | | |
| Next search result | n | | |
| Previous search result | N | | |
| Replace | :%s/*regex*/*replacement*/g | | |
| Interactive replace | :%s/*regex*/*replacement*/gc | | |
| Remove highlights | :nohlsearch <br/> :nohl | | |

## Edit
| Command | Vim | Emacs | Nano |
| - | - | - | - |
| Select/mark region | ^v | | |
| Select/mark line(s) | ^V | | |
| Select/mark entire file/buffer | ggVG | | |
| Goto/highlight to matching brace | % | | |
| Cut | x | | |
| Cut to system clipboard | "+x | | |
| Copy | y | | |
| Copy to system clipboard | "+y | | |
| Paste | p | | |
| Paste from system clipboard | "+p <br/> "+gP | | |
| Undo | :undo <br/> :u <br/> u | | |
| Redo | :redo <br/> ^r | | |
| Delete to beginning of line (non-blank) | d^ | | |
| Delete to beginning of line (absolute) | d0 | | |
| Delete to end of line | d$ | | |
| Delete whole line | dd | | |
| Duplicate line | Yp | | |
| Insert literal character | ^V *character* | | |
| Insert literal tab | ^V TAB | | |
| Increate indent | &gt; | | |
| Decrease indent | &lt; | | |
| Add a comment to end of the line | | | |
| Toggle comment for the current line/region | | | |
