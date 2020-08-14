 
ColorHelper={}

local function SixNumToRGB(str_num, OutLine)
    local str_num_six
    if string.len(str_num) == 6 then
        str_num_six = str_num
    else
        str_num_six = string.sub(str_num, 1, 7)
    end

    local RGB = {}
    RGB.r = tonumber(string.sub(str_num_six, 1, 2), 16)
    RGB.g = tonumber(string.sub(str_num_six, 3, 4), 16)
    RGB.b = tonumber(string.sub(str_num_six, 5, 6), 16)

    if OutLine then
        RGB.a = OutLine
    end

    return RGB
end

ColorHelper.SixNumToRGB=SixNumToRGB

return ColorHelper