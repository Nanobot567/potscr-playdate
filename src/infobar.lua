import "CoreLibs/graphics"

local gfx <const> = playdate.graphics

function drawBar(info)
    gfx.setColor(gfx.kColorBlack)
    gfx.drawText("potatoscript",300,222)
    gfx.drawLine(0, 220, 400, 220)
    gfx.drawLine(290, 220, 290, 240)
    gfx.drawLine(30, 220, 30, 240)
    gfx.drawText(info, 35, 222)
    gfx.setColor(gfx.kColorWhite)
end