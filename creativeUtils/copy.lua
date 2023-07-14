require(... .. ".register")

events.TICK:register(function()
    if candler and candler.cats.examples then
        candler.lib.setCommand("creativeUtils", "copy", {
            aliases = {}, -- Every other command that should lead to this file.
            description = "Copies the item in your hand (or offhand) into your clipboard.", -- A description of the command.
            arguments = {
                {
                    name = "offhand", -- The name of the argument.
                    description = "Copy your offhand instead of your main hand.", -- A description of the argument.
                    required = false, -- Does not actually do anything, just shows the argument as <arg> in help menus. If not required, it is displayed as [arg].
                }
            }
        }, function (args)
            if args[1] == "true" then
                host:setClipboard(player:getHeldItem(true):toStackString())
                printJson('{"text":"Copied offhand item to clipboard!","color":"gray"}')
            else
                host:setClipboard(player:getHeldItem():toStackString())
                printJson('{"text":"Copied main hand item to clipboard!","color":"gray"}')
            end
        end)
        events.TICK:remove("reg.creativeUtils.copy")
    end
end, "reg.creativeUtils.copy")