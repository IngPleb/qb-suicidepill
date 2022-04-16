QBCore = exports['qb-core']:GetCoreObject()

local unconscious = false
local timeLeft = 0

-- Function that checks if player is alive
local function isPlayerAlive()
    local playerPed = PlayerPedId()
    if IsPedDeadOrDying(playerPed) then
        return false
    else
        return true
    end
end

local function animation()
    if Config.General.UseAnimation then
        -- Please ensure that you have these FUNCTINOS! They were included in fairly new update!
        QBCore.Functions.RequestAnimDict("mp_suicide")
        QBCore.Functions.PlayAnim("mp_suicide", "pill", true, 3000)
        Wait(3000)
    end
end

-- Function that disables players controls
local function disableControls()
    if Config.FakeSuicidePill.DisableMouseMovement then
        DisableControlAction(0, 1, true) -- LookLeftRight
        DisableControlAction(0, 2, true) -- LookUpDown
        DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
    end

    for _, v in pairs(Config.FakeSuicidePill.DisabledControls) do 
        DisableControlAction(0, v, true)
    end
end

local function drawText(text, x, y, scale)
    -- SetTextFont(font or 4)
    local scale = scale or 0.45
    SetTextScale(scale, scale)
    -- SetTextColour(r or 185, g or 185, b or 185, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentString(text)
    EndTextCommandDisplayText(x, y)
end

-- Show timer on scren function
local function showTimer()
    -- Chechk if timer should be shown and if not return
    if not Config.FakeSuicidePill.ShowTimer then
        return
    end
    drawText(Lang:t("info.timeLeft",{timeleft = math.floor(timeLeft / 1000)}), Config.FakeSuicidePill.TimerPosition.x, Config.FakeSuicidePill.TimerPosition.y)
end

local function effect()
    if Config.Effect.UseEffect then
        -- Show screen effect "wasted"
        StartScreenEffect("DeathFailOut", 0,0)
        ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
        -- Play sound
        if Config.Effect.UseSound then
            PlaySoundFrontend(-1, "ScreenFlash", "WastedSounds", 1)
        end
        CreateThread(function()
            Wait(Config.Effect.EffectDuration * 1000)
            -- Do screen fadeOut 500 ms and then wait 500 ms and then fadeIn 500 ms
            DoScreenFadeOut(500)
            Wait(500)
            DoScreenFadeIn(500)
            StopScreenEffect("DeathFailOut")
        end)
    end
end


-- Register net event "qb-suicidepill:client:usedSuicidePill"
RegisterNetEvent("qb-suicidepill:client:usedSuicidePill", function()
    CreateThread(function()
        -- Check if player is alive and if not return
        if not isPlayerAlive() then
            return
        end

        animation()

        -- Wait for the timer to end
        Wait(Config.SuicidePill.SuicidePillTimer * 1000)

        -- Check if player is alive and if not return
        if not isPlayerAlive() then
            return
        end

        effect()

        -- Kill player`s ped
        SetEntityHealth(PlayerPedId(), 0)
        -- Call the function
        Config.SuicidePill.SuicidePillFunction()
    end)
end)

-- Register net event "qb-suicidepill:client:usedFakeSuicidePill"
RegisterNetEvent("qb-suicidepill:client:usedFakeSuicidePill", function()
    CreateThread(function()
        -- Check if player is alive and if not return
        if not isPlayerAlive() or unconscious then
            return
        end

        animation()

        -- Wait for the timer to end
        Wait(Config.FakeSuicidePill.FakeSuicidePillTime * 1000)

        -- Check if player is alive and if not return
        if not isPlayerAlive() or unconscious then
            return
        end

        effect()

        timeLeft = Config.FakeSuicidePill.FakeSuicidePillDuration * 1000
        unconscious = true

        CreateThread(function()
            while timeLeft > 0 and isPlayerAlive() do
                Wait(1000)
                timeLeft = timeLeft - 1000
            end
            unconscious = false
        end)

        CreateThread(function()
            while unconscious do
                SetPedToRagdoll(PlayerPedId(), 50000, 50000, 0, 0, 0, 0)
                Wait(6000)
            end
            SetPedCanRagdoll(PlayerPedId(), false)
            Wait(2000)
            SetPedCanRagdoll(PlayerPedId(), true)
        end)
        CreateThread(function()
            while unconscious do
                disableControls()
                showTimer()
    
                -- Wait 20 milliseconds
                Wait(10)
            end
        end)
    end)
end)


CreateThread(function()
    for _, v in pairs(Config.FakeSuicidePill.WakeUpEvents) do
        RegisterNetEvent(v)
        AddEventHandler(v, function()
            unconscious = false
        end)
    end
end)