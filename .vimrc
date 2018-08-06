if 0 | endif
 
if has('vim_starting')
   if &compatible
      set nocompatible               " Be iMproved
   endif
 
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
 
" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
 
call neobundle#end()
 
" Required:
filetype plugin indent on
 
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Jedi for python
NeoBundleLazy "davidhalter/jedi-vim", {
			\ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}

if ! empty(neobundle#get("jedi-vim"))
	let g:jedi#auto_initialization = 1
	let g:jedi#auto_vim_configuration = 1

	nnoremap [jedi] <nop>
	xnoremap [jedi] <nop>
	nmap <leader>j [jedi]
	xmap <leader>j [jedi]
"	let g:jedi#completions_command = "<C-S>"    # 補完キーの設定この場合はCtrl+Space
"	let g:jedi#goto_assignments_command = "<C-g>"   # 変数の宣言場所へジャンプ（Ctrl + g)
"	let g:jedi#goto_definitions_command = "<C-d>"   # クラス、関数定義にジャンプ（Gtrl + d）
"	let g:jedi#documentation_command = "<C-k>"      # Pydocを表示（Ctrl + k）
	let g:jedi#rename_command = "[jedi]r"
	let g:jedi#usages_command = "[jedi]n"
	let g:jedi#popup_select_first = 0
	let g:jedi#popup_on_dot = 0
	autocmd FileType python setlocal completeopt-=preview
	" for w/ neocomplete
	if ! empty(neobundle#get("neocomplete.vim"))
		autocmd FileType python setlocal omnifunc=jedi#completions
		let g:jedi#completions_enabled = 0
		let g:jedi#auto_vim_configuration = 0
		let g:neocomplete#force_omni_input_patterns.python =
					\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
	endif
endif
