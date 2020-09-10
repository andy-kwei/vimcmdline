" Ensure that plugin/vimcmdline.vim was sourced
if !exists("g:cmdline_job")
    runtime plugin/vimcmdline.vim
endif

function! OCamlSourceLines(lines)
    call VimCmdLineSendCmd(substitute(join(a:lines, b:cmdline_nl), ";;$", "", "g"))
    call VimCmdLineSendCmd(";;\<CR>")
endfunction

let b:cmdline_nl = "\<CR>"
let b:cmdline_app = "utop"
let b:cmdline_quit_cmd = "#quit;;"
let b:cmdline_source_fun = function("OCamlSourceLines")
let b:cmdline_send_empty = 1
let b:cmdline_filetype = "ocaml"

exe 'nmap <buffer><silent> ' . g:cmdline_map_start . ' :call VimCmdLineStartApp()<CR>'

exe 'autocmd VimLeave * call delete(g:cmdline_tmp_dir . "/lines.ml")'

call VimCmdLineSetApp("ocaml")
