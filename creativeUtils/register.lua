events.TICK:register(function()
    if candler then
        candler.lib.newCategory("CreativeUtils", {
            description     = "Commands that utilize Figura's host:setSlot() function.",
            author          = "Slymeball",
            version         = "0.1.0",
            website         = "https://github.com/Slymeball/Candler-Cats/tree/main/cmds/creativeUtils",
            issues          = "https://github.com/Slymeball/Candler-Cats/issues"
        })
        events.TICK:remove("reg.creativeUtils")
    end
end, "reg.creativeUtils")