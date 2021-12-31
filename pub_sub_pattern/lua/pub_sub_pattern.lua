local publisher = coroutine.create(function (type, input)
    local current_type  = type
    local current_input = input
    local subscribers = {}
    while (true) do
        if (current_type == "sub") then
            subscribers[#subscribers + 1] = current_input
        end
        if (current_type == "unsub") then
            for idx, subscriber in ipairs(subscribers) do
                if (subscriber == current_input) then
                    subscribers[idx] = nil
                end
            end
        end
        if (current_type == "pub") then
            for _, subscriber in ipairs(subscribers) do
                subscriber.message(subscriber.name, current_input)
            end
        end
        current_type, current_input = coroutine.yield()
    end
  end)

local function message_subscriber(name, input)
    print(name .. " received data: " .. input)
end
local subOne = {
    message = message_subscriber,
    name = "SubOne"}
local subTwo = {
    message = message_subscriber,
    name = "SubTwo"}
local subThree = {
    message = message_subscriber,
    name = "SubThree"}

coroutine.resume(publisher, "sub", subOne)
coroutine.resume(publisher, "sub", subTwo)
coroutine.resume(publisher, "sub", subThree)
coroutine.resume(publisher, "pub", "Some Data")
coroutine.resume(publisher, "unsub", subThree)
coroutine.resume(publisher, "pub", "Other Data")