let s:jsFolder = expand("<sfile>:p:h") . "/../js/"
let s:payloadName = s:jsFolder . "payload.js"
let s:jsName = s:jsFolder . "beautify.js"
"Remembering current position ignoring all blank symbols
function! s:GetNumberOfNonSpaceCharactersBeforeCursor()
    let cursorPositionAsList = getpos('.')
    let cursorRow = cursorPositionAsList[1]
    let cursorColumn = cursorPositionAsList[2]
    let lineNumber = 1
    let nonBlankCount = 0
    while lineNumber <= cursorRow
        let lineContent = getline(lineNumber)
        if lineNumber == cursorRow
            let lineContent = strpart(lineContent,0,cursorColumn)
        endif
        let charIndex = 0
        while charIndex < len(lineContent)
            let char = strpart(lineContent,charIndex,1)
            if match(char,'\s') == -1
                let nonBlankCount = nonBlankCount + 1
            endif
            let charIndex = charIndex + 1
        endwhile
        let lineNumber = lineNumber + 1
    endwhile
    return nonBlankCount
endfunction
"Restoring current position by number of non blank characters
function! s:SetNumberOfNonSpaceCharactersBeforeCursor(numberOfNonBlankCharactersFromTheStartOfFile)
    let lineNumber = 1
    let nonBlankCount = 0
    while lineNumber <= line('$')
        let lineContent = getline(lineNumber)
        let charIndex = 0
        while charIndex < len(lineContent)
            let char = strpart(lineContent,charIndex,1)
            if match(char,'\s') == -1
                let nonBlankCount = nonBlankCount + 1
            endif
            let charIndex = charIndex + 1
            if nonBlankCount == a:numberOfNonBlankCharactersFromTheStartOfFile 
                call setpos('.',[0,lineNumber,charIndex,0])
                return
            end
        endwhile
        let lineNumber = lineNumber + 1
    endwhile
endfunction

function! s:FormatJs()
    let oldPosition = s:GetNumberOfNonSpaceCharactersBeforeCursor()

    let s:optionsName = s:GetOptionsFileName()
    execute "%!js " . s:payloadName . " " . s:jsName . " " . s:optionsName

    call s:SetNumberOfNonSpaceCharactersBeforeCursor(oldPosition)
endfunction
function! s:GetOptionsFileName()
    let s:optionsInCurrentFolder = ".jsbeautify"
    let s:optionsInHomeFolder = "~/.jsbeautify" 
    let s:optionsInPlugin = s:jsFolder . "settings.js" 
    for fileName in [s:optionsInCurrentFolder,s:optionsInHomeFolder,s:optionsInPlugin]
        if filereadable(fileName)
            return fileName
        endif
    endfor
endfunction

command! FormatJs call <SID>FormatJs()
nmap <leader>ff :FormatJs<cr>
