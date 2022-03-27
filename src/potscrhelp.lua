import "CoreLibs/graphics"
import "infobar"

local gfx <const> = playdate.graphics
getmetatable('').__index = function(str,i) return string.sub(str,i,i) end

function help()
    gfx.clear()
    drawBar("potscr help - press Ⓑ to exit")

    gfx.drawText("*HELP*",182,0)
    gfx.drawText("*running a potatoscript*",0,35)
    gfx.drawText("go to menu/select script. then, select a script using",0,65)
    gfx.drawText("Ⓐ, and run it by pressing Ⓐ again.",0,85)
    gfx.drawText("*creating a potatoscript*",0,115)
    gfx.drawText("potatoscript documentation is available at",0,145)
    gfx.drawText("nanobot567.github.io/potscr.",0,165)
end