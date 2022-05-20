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
    gfx.drawText("you can also use the crank for step-by-step parsing.",0,115)
    gfx.drawText("*creating a potatoscript*",0,145)
    gfx.drawText("potatoscript documentation is available at",0,175)
    gfx.drawText("nanobot567.github.io/potscr.",0,195)
end

function about()
    gfx.clear()
    drawBar("potatoscript v2.0: \"CtM\"")

    gfx.drawText("*ABOUT*",175,0)
    gfx.drawText("*potatoscript is what again?*",0,35)
    gfx.drawText("potatoscript is an esoteric scripting",0,65)
    gfx.drawText("language developed by nanobot567.",0,85)
    gfx.drawText("for more information visit",0,145)
    gfx.drawText("*github.com/Nanobot567/potscr*",0,165)
end