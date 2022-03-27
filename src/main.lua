import "CoreLibs/graphics"
import "CoreLibs/crank"
import "CoreLibs/keyboard"
import "CoreLibs/timer"
import "sscript"
import "potmath"
import "infobar"
import "about"
import "potscrhelp"

local gfx <const> = playdate.graphics

getmetatable('').__index = function(str,i) return string.sub(str,i,i) end

drawBar("potscr.pdx v1.0")


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



            for i = 0,#inputpotscr,1 do
                if lookinfortxt == true then
                    if char == "-" then
                    else
                        txtfound = txtfound..char
                    end
                end

                -- print("char = "..char)
                -- print("i = "..i)
                -- print("txtfound = "..txtfound)

                char = inputpotscr[i]
            
                if char == "-" then
                    lookinfortxt = true
                elseif char == "_" then
                    lookinfortxt = false
                    if inputpotscr[i+1] == "%" then
                        gfx.drawText(txtfound,0,textsentnum*17)
                        print(txtfound)
                        txtfound = ""
                    else
                        gfx.drawText(txtfound,0,textsentnum*17)
                        print(txtfound)
                        txtfound = ""
                    end
                    textsentnum += 1
                elseif char == "#" then
                    -- if lookinfortxt == false then
                    --     playdate.keyboard.show()
                    --     if tonumber(temp) == nil and inputpotscr[i+1] == "%" then
                    --         storednum = tonumber(temp)
                    --     elseif inputpotscr[i+2] == "!" and inputpotscr[i+1] == "%" then
                    --         stored = stored+temp
                    --     elseif inputpotscr[i+1] == "%" and not lua_isnumber(temp) then
                    --         print("ERROR: Input must be an integer!")
                    --         exit()
                    --     else
                    --         stored = temp
                    --     end
                    -- end
                    print("# hasn't been implemented yet")
                    break
        
                elseif char == "$" then -- print stored var
                    gfx.drawText(stored,0,textsentnum*17)
                    textsentnum += 1
                elseif char == "/" then -- newline
                    textsentnum += 1
                elseif char == "*" then -- reset stored number
                    storednum = 0
                elseif char == "+" then -- number +
                    storednum = potmath("+",i,storednum,inputpotscr)
                elseif char == "`" then -- number -
                    storednum = potmath("-",i,storednum,inputpotscr)
                elseif char == ">" then -- number multiplied
                    storednum = potmath("*",i,storednum,inputpotscr)
                elseif char == "&" then -- number divided
                    storednum = potmath("/",i,storednum,inputpotscr)
                elseif char == "^" then -- print stored num
                    if inputpotscr[i+1] == "%" then
                        gfx.drawText(tostring(storednum),0,textsentnum*17)
                    else
                        gfx.drawText(tostring(storednum),0,textsentnum*17)
                        textsentnum += 1
                    end
                    
                elseif char == "@" then
                    -- if lookinfortxt:
                    --     pass
                    -- else:
                    --     try:
                    --         sleep(tonumber(inputpotscr[i+1]))
                    --     except ValueError:
                    --         print(f"\nERROR: Char {i}: An integer is required for sleeping")
                    --         exit()
                    print("@ hasn't been implemented yet")
                elseif char == "!" then
                    if lookinfortxt == false then
                        
                        if inputpotscr[i-2] == "#" then
                            -- nothing lol
                        else
                            if inputpotscr[i+1] == "%" then
                                compnum = inputpotscr[i+2]
                                if tonumber(compnum) == storednum then
                                    break
                            else
                                break
                            end
                        end
                    
                        if inputpotscr[i+1] == "%" then
                            compnum = inputpotscr[i+2]
                            if tonumber(compnum) == storednum then
                                break
                            end
                        else
                            break
                        end
                    end
                end
                
        
                i += 1
            end
            gfx.fillRect(0,220,400,240)
            gfx.drawText(i,2,223)
            drawBar("done!")
        end
    end
    end
    cursorupdate()
end

function clearAndRedraw()
    gfx.clear()
    drawBar("potscr.pdx v1.0")
end

function playdate.keyboard.textChangedCallback()
    print("kb text = "..playdate.keyboard.text)
    temp = playdate.keyboard.text
end