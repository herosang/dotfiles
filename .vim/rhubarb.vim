" Gblame on word currently over cursor (ie a commit id on Gblame)
if !exists('GbrowseHere')
  command GbrowseHere execute "Gbrowse " . expand("<cword>")
endif

