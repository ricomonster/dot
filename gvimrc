if has('gui')
  if has("gui_macvim")
    " Before:
    "  New Tab: CMD-t
    "  New Window: CMD-N
    "  Open Tab: CMD-T
    "  Show Errors: CMD-l
    " After:
    "  New Tab: CMD-n
    "  New Window: CMD-N
    "  Open Tab: No such thing
    "  Show Errors: unmapped
    macmenu &File.New\ Window key=<nop>
    macmenu &File.New\ Tab key=<nop>
    macmenu &File.New\ Tab key=<D-n>
    macmenu &File.New\ Window key=<D-N>
    macmenu &Tools.List\ Errors key=<nop>

    " Disable print shortcut for 'goto anything...'
    macmenu File.Print key=<nop>
  endif
endif

set visualbell
set t_vb=
