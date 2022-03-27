

function potmath(mathtype,curnum,num,inputpotscr)
    print()
    if lookinfortxt == false then
        if inputpotscr[curnum+1] == "%" then
            if type(tonumber(inputpotscr[curnum+2])) == "number" then
                if mathtype == "+" then
                    num += tonumber(inputpotscr[curnum+2])
                elseif mathtype == "-" then
                    num -= tonumber(inputpotscr[curnum+2])
                elseif mathtype == "*" then
                    num = num * tonumber(inputpotscr[curnum+2])
                elseif mathtype == "/" then
                    num = num / tonumber(inputpotscr[curnum+2])
                end
            else
                if mathtype == "+" then
                    num += 5
                elseif mathtype == "-" then
                    num -= 5
                elseif mathtype == "*" then
                    num = num * 5
                elseif mathtype == "/" then
                    num = num / 5
                end
            end
        else
            if mathtype == "+" then
                num += 1
            elseif mathtype == "-" then
                num -= 1
            elseif mathtype == "*" then
                num = num * 1
            elseif mathtype == "/" then
                num = num / 1       
        end
    end
return num
end
end