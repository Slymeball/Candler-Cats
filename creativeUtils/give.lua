require(... .. ".register")

events.TICK:register(function()
    if candler and candler.cats.examples then
        candler.lib.setCommand("creativeUtils", "give", {
            aliases = {"dfgive", "i"}, -- Every other command that should lead to this file.
            description = "Gives yourself the item on the clipboard or the item passed as an argument.", -- A description of the command.
            arguments = {
                {
                    name = "item", -- The name of the argument.
                    description = "Item to give.", -- A description of the argument.
                    required = false, -- Does not actually do anything, just shows the argument as <arg> in help menus. If not required, it is displayed as [arg].
                }
            }
        }, function (arg)
            if not player:getGamemode() == "CREATIVE" then
                printJson('[{"text":"ERROR!", "color":"red", "bold":true}, {"text":" You must be in creative mode to use this command.", "color":"gray", "bold":false}]')
                return nil
            end

            local itemString
            if arg[1] then
                itemString = table.remove(arg, 1)
                for _, v in pairs(arg) do
                    itemString = itemString .. " " .. v
                end
            else
                itemString = host:getClipboard()
            end

            local _, err = pcall(function() local item = world:newItem(itemString) end)
            if err then
                printJson('[{"text":"ERROR!", "color":"red", "bold":true}, {"text":" \'' .. itemString .. '\' is not an item.", "color":"gray", "bold":false}]')
                return nil
            end

            host:setSlot(-1, world:newItem(itemString))
        end)
        events.TICK:remove("reg.creativeUtils.give")
    end
end, "reg.creativeUtils.give")