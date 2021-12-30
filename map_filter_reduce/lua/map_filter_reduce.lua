local function map(func, tab)
    local new_tab = {}
    for i,elem in pairs(tab) do
        new_tab[i] = func(elem)
    end
    return new_tab
end
local function filter(func, tab)
    local new_tab = {}
    for i,elem in pairs(tab) do
        if func(elem) then
            new_tab[i] = elem
        end
    end
    return new_tab
end
local function reduce(identity, func, tab)
    local result = identity
    for _,v in pairs(tab) do
        result = func(result, v)
    end
    return result
end
local tab = {}
for i=1,20 do tab[#tab + 1] = i end
-- Square elements
-- Take only ones less than 50
-- Multiply remaining together
Result = reduce(
    1,
    (function(acc, elem) return elem * acc end),
    filter(
        (function(elem) return elem < 50 end),
        map(
            (function(elem) return elem*elem end), 
            tab)
    )
)
print(Result)