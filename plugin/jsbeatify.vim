let s:jsFolder = expand("<sfile>:p:h") . "/../js/"
let s:payloadName = s:jsFolder . "payload.js"
let s:jsName = s:jsFolder . "beautify.js"
function! s:FormatJs()
    normal mp
    execute "%!js " . s:payloadName . " " . s:jsName 
    normal `p
endfunction

command FormatJs call <SID>FormatJs()
nmap <leader>ff :FormatJs<cr>
