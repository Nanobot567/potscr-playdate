import "CoreLibs/graphics"
import "infobar"

local gfx <const> = playdate.graphics

potatoscripts = {}
cursorpos = 1

selectedScript = ""

selectingScript = false


function selectScript()
    n = 0
    selectingScript = true
    gfx.clear()
    drawBar("select a script")
    files = playdate.file.listFiles("/potscr/")
    for i=1,#files do
        if string.find(files[i],".potscr") then
            n += 1
            potatoscripts[n] = files[i]
        end
    end
    for i=1,#potatoscripts do
        gfx.drawText(potatoscripts[i],30,i*17)
    end
    
end

function cursorupdate()
    if selectingScript == true then
        gfx.drawText(">",10,cursorpos*17)

        gfx.setColor(gfx.kColorWhite)
        if playdate.buttonJustPressed(playdate.kButtonUp) then
            if cursorpos == 1 then
            else
                cursorpos -= 1
                gfx.fillRect(0, 0, 20, 200)
            end
        elseif playdate.buttonJustPressed(playdate.kButtonDown) then
            if cursorpos == #potatoscripts then
            else
                cursorpos += 1
                gfx.fillRect(0, 0, 20, 200)
            end
        elseif playdate.buttonJustPressed(playdate.kButtonA) then
            gfx.clear()
            selectedScript = "/potscr/"..potatoscripts[cursorpos]
            print(selectedScript)
            selectingScript = false
            drawBar("selected: "..potatoscripts[cursorpos])
            potatoscripts = {}
        end
    end
end

function getSelectedScript()
    return selectedScript
end

function selectingScriptStatus()
    return selectingScript
end