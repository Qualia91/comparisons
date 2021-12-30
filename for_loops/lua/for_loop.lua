local function RecLoop(index)
    io.write(index)
    index = index + 1
    if (index < 5) then
        RecLoop(index)
    end
end

-- Numeric for
for i=0,4 do io.write(i) end

print()

local values = {0,1,2,3,4}

-- Loop through normal table
for _, value in pairs(values) do
    io.write(value)
end

print()

-- Loop through indexed table
for _, value in ipairs(values) do
    io.write(value)
end

print()

-- recursion
RecLoop(0)