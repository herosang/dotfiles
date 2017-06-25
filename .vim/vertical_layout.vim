" expand the window to twice the side and vertical split (GUI mode)
if has('gui_running')
  if !exists('VerticalLayout')
    command VLayout call VerticalLayout() 

    function VerticalLayout()
      let &columns += &columns " double size of window
      vertical botright split  
    endfunction
  endif
endif
