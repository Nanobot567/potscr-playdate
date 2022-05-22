import "CoreLibs/graphics"
import "CoreLibs/crank"
import "CoreLibs/keyboard"
import "CoreLibs/timer"
import "sscript"
import "potmath"
import "infobar"
import "helpabout"
import "parser"

local gfx <const> = playdate.graphics
doScript = false

storednum = 0

txtfound = ""
i = 0
lookinfortxt = ""
stored = ""
char = ""
inputpotscr = ""
textsentnum = 0
waitingForInput = false
gotInput = ""

getmetatable('').__index = function(str,i) return string.sub(str,i,i) end

drawBar("potscr.pdx v2.1")


menu = playdate.getSystemMenu()
menu:addMenuItem("help",help)
menu:addMenuItem("about",about)
menu:addMenuItem("select script",selectScript)

function playdate.update()
    if playdate.buttonJustPressed(playdate.kButtonB) then
        clearAndRedraw()
    elseif playdate.buttonJustPressed(playdate.kButtonA) then
        if getSelectedScript() == nil or getSelectedScript() == "" then
            gfx.clear()
            drawBar("error: no script selected!")
        else
            storednum = 0

            txtfound = ""
            i = 0
            lookinfortxt = ""
            stored = ""
            char = ""
            inputpotscr = ""
            textsentnum = 0

            potscrfile = playdate.file.open(getSelectedScript(), playdate.file.kFileRead)
            inputpotscr = potscrfile:read(1000000)
            print(inputpotscr)
            
            doScript = true
            gfx.fillRect(0,220,400,240)
            drawBar("running script...")
        end
    end
    
    if doScript == true then
        if playdate.isCrankDocked() == false then
            if playdate.getCrankTicks(4) == 1 then
                parse()
            end
        else
            parse()
        end
    end

    cursorupdate()
end

function clearAndRedraw()
    gfx.clear()
    drawBar("potscr.pdx v2.1")
end

function playdate.keyboard.textChangedCallback()
    print("kb text = "..playdate.keyboard.text)
    temp = playdate.keyboard.text
end