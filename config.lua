Config = {}

Config.General = {
    -- Use the pill animation from GTA online?
    UseAnimation = true,
}

Config.Effect = {
    -- Use effect
    UseEffect = true,

    -- How long should it last in seconds
    EffectDuration = 10,

    -- Sound
    UseSound = true,
}

Config.SuicidePill = {
    -- The time in seconds before the player will die in seconds
    SuicidePillTimer = 10,
    -- Specific function to be called after players death
    SuicidePillFunction = function()
        -- Do something here
    end,
}

Config.FakeSuicidePill = {
    -- The time in seconds before the player will fall unconscious in seconds
    FakeSuicidePillTime = 10,
    -- Duration during the players is unconscious in seconds
    -- Default is 180 seconds => 3 minutes
    FakeSuicidePillDuration = 180, 
    -- Show timer on screen
    ShowTimer = true,

    -- Timer position
    TimerPosition = {
        x = 0.5,
        y = 0.9,
    },
    -- Specific function to be called after players fall unconscious
    FakeSuicidePillFunction = function()
        -- Do something here
    end,
    -- Specific function to be called after players wake up
    FakeSuicidePillWakeUpFunction = function()
        -- Do something here
    end,

    -- Disable mouse movement
    DisableMouseMovement = false,
    -- Additionnal controls to be disabled
    DisabledControls = {}, -- Just add numbers from https://docs.fivem.net/docs/game-references/controls/

    -- Events that should wake up player
    WakeUpEvents = {
        "hospital:client:Revive",
    },
}