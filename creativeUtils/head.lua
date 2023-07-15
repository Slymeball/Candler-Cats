require(... .. ".register")

events.TICK:register(function()
    if candler and candler.cats.examples then
        candler.lib.setCommand("creativeUtils", "head", {
            aliases = {"skull"}, -- Every other command that should lead to this file.
            description = "Gives yourself the skull of a player.", -- A description of the command.
            arguments = {
                {
                    name = "player", -- The name of the argument.
                    description = "The name of the player you'd like to get the skull of.", -- A description of the argument.
                    required = false, -- Does not actually do anything, just shows the argument as <arg> in help menus. If not required, it is displayed as [arg].
                }
            }
        }, function (arg)
            if not player:getGamemode() == "CREATIVE" then
                printJson('[{"text":"ERROR!", "color":"red", "bold":true}, {"text":" You must be in creative mode to use this command.", "color":"gray", "bold":false}]')
                return nil
            end

            if not arg[1] then
                arg[1] = player:getName()
            end

            host:setSlot(-1, world:newItem('minecraft:player_head{SkullOwner:"' .. arg[1] .. '"}'))
        end)
        events.TICK:remove("reg.creativeUtils.head")
    end
end, "reg.creativeUtils.head")