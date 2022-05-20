import "CoreLibs/graphics"

local gfx <const> = playdate.graphics

function parse()
    if i == #inputpotscr then
        gfx.fillRect(0,220,400,240)
        gfx.drawText(i,2,223)
        drawBar("done!")
        doScript = false
    else
        gfx.fillRect(0,221,25,19)
        gfx.drawText(i,2,223)
        i += 1
    end


    if lookinfortxt == true then
        if char ~= "-" then
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
            txtfound = ""
        else
            gfx.drawText(txtfound,0,textsentnum*17)
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
        if lookinfortxt then
        else
            gfx.fillRect(0,220,400,240)
            drawBar("sleeping for "..inputpotscr[i+1].." seconds...")
            gfx.drawText(i,2,223)
            playdate.wait(tonumber(inputpotscr[i+1]*1000))
            gfx.fillRect(0,220,400,240)
            drawBar("running script...")
        end
    elseif char == "!" then
        if lookinfortxt == false then
            
            if inputpotscr[i-2] == "#" then
                -- nothing lol
            else
                if inputpotscr[i+1] == "%" then
                    compnum = inputpotscr[i+2]
                    if tonumber(compnum) == storednum then
                        doScript = false
                else
                    doScript = false
                end
            end
        
            if inputpotscr[i+1] == "%" then
                compnum = inputpotscr[i+2]
                if tonumber(compnum) == storednum then
                    doScript = false
                end
            else
                doScript = false
            end
        end
    end
end
end