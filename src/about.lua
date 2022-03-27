import "CoreLibs/graphics"

local gfx <const> = playdate.graphics

function about()
    gfx.clear()
    drawBar("potatoscript v1.0: \"hot garbage\"")

    gfx.drawText("*ABOUT*",175,0)
    gfx.drawText("*potatoscript is what again?*",0,35)
    gfx.drawText("potatoscript is an esoteric scripting",0,65)
    gfx.drawText("language developed by nanobot567.",0,85)
    gfx.drawText("for more information visit",0,145)
    gfx.drawText("*github.com/Nanobot567/potscr*",0,165)
end