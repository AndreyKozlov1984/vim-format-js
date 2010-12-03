let s:jsFolder = expand("<sfile>:p:h") . "/../js/"
let s:payloadName = s:jsFolder . "payload.js"
let s:jsName = s:jsFolder . "beautify.js"
function! s:FormatJs()
    normal mp
    let s:optionsName = s:GetOptionsFileName()
    execute "%!js " . s:payloadName . " " . s:jsName . " " . s:optionsName
    normal `p
endfunction
function! s:GetOptionsFileName()
    let s:optionsInCurrentFolder = ".jsbeautify"
    let s:optionsInHomeFolder = "~/.jsbeautify" 
    let s:optionsInPlugin = s:jsFolder . "settings.js" 
    for fileName in [s:optionsInCurrentFolder,s:optionsInHomeFolder,s:optionsInPlugin]
        echo fileName
        if filereadable(fileName)
            return fileName
        endif
    endfor
endfunction

command FormatJs call <SID>FormatJs()
nmap <leader>ff :FormatJs<cr>
