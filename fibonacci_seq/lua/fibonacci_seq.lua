-- Setup Timer Function
local function RunAndTime(func, name, iters)
    local before = os.clock()
    _ = func(iters)
    local after = os.clock()
    print(string.format(name .. " took %0.6f seconds to find fib number " .. iters, after - before))
end

-- recursion
local function FibRec(index)
    if (index == 0) then
        return 0
    elseif (index < 2) then
        return 1
    else
        return FibRec(index - 1) + FibRec(index - 2)
    end
end

print("Fib number 20 is: " .. FibRec(20))
RunAndTime(FibRec, "FibRec", 35)

-- Iterative
local function FibIter(index, Acc, Next)
    if Acc  == nil then Acc = 0 end
    if Next == nil then Next = 1 end

    if (index == 0) then
        return Acc
    else
        return FibIter(index - 1, Next, Acc + Next)
    end
end

print("Fib number 20 is: " .. FibIter(20))
RunAndTime(FibIter, "FibIter", 100000)