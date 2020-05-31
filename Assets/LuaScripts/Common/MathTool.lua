MathTool = {}

function MathTool:Lerp(from, to, t)
    return from + (to - from) * t
end

return MathTool
