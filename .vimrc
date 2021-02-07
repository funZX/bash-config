source ~/.vim/config/settings.vim
source ~/.vim/config/mappings.vim
source ~/.vim/config/abbreviations.vim
source ~/.vim/config/commands.vim
source ~/.vim/config/coc.vim

au BufNewFile,BufRead *.nut setf squirrel
au BufRead,BufNewFile *.bb setf bash
au BufRead,BufNewFile *.bbappend setf bash
