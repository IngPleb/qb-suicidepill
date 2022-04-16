QBCore = exports['qb-core']:GetCoreObject()

-- Suicide pill
QBCore.Functions.CreateUseableItem("suicidepill" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(item.name, 1, item.slot)
    TriggerClientEvent("qb-suicidepill:client:usedSuicidePill",source)
end)

-- Fake suicide pill
QBCore.Functions.CreateUseableItem("fakesuicidepill" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    -- Remove the used item
    Player.Functions.RemoveItem(item.name, 1, item.slot)
    TriggerClientEvent("qb-suicidepill:client:usedFakeSuicidePill",source)
end)