local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
PlayerGang = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerGang = QBCore.Functions.GetPlayerData().gang
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate')
AddEventHandler('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerGang = GangInfo
    isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('qb-gangs:vagosStash')
AddEventHandler('qb-gangs:vagosStash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "vagosstash_"..QBCore.Functions.GetPlayerData().gang)
    TriggerEvent("inventory:client:SetCurrentStash", "vagosstash_"..QBCore.Functions.GetPlayerData().gang)
end)

RegisterNetEvent('qb-gangs:ballasStash')
AddEventHandler('qb-gangs:ballasStash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "ballasstash_"..QBCore.Functions.GetPlayerData().gang)
    TriggerEvent("inventory:client:SetCurrentStash", "ballasstash_"..QBCore.Functions.GetPlayerData().gang)
end)

RegisterNetEvent('qb-gangs:lostmcStash')
AddEventHandler('qb-gangs:lostmcStash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "lostmcstash_"..QBCore.Functions.GetPlayerData().gang)
    TriggerEvent("inventory:client:SetCurrentStash", "lostmcstash_"..QBCore.Functions.GetPlayerData().gang)
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("lostmcClothingStash", vector3(987.13, -93.12, 74.85), 2, 1, { name="lostmcClothingStash", heading=312, debugPoly=true, minZ=72.05, maxZ=76.05 },
        { options = { 
            { 
                type = "client",
                event = "qb-clothing:lostmc", 
                icon = "fas fa-male", 
                label = "Open Wardrobe", 
                job = "bltowing"
            },
            { 
                type = "client",
                event = "qb-gangs:lostmcStash",
                icon = "fas fa-door-closed", 
                label = "Access Gang Stash", 
                job = "bltowing" 
            },
        }, 
        distance = 1.5
    })
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("vagosStash", vector3(345.26, -2021.48, 22.39), 2, 1, { name="vagosStash", heading=50, debugPoly=true, minZ=20.19, maxZ=24.19 },
        { options = { 
            { 
                type = "client",
                event = "qb-gangs:vagosStash",
                icon = "fas fa-door-closed", 
                label = "Access Gang Stash", 
                gang = "vagos" 
            },
        }, 
        distance = 1.5
    })
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("vagosClothing", vector3(349.42, -2024.96, 22.39), 1.5, 1, { name="vagosClothing", heading=50, debugPoly=true, minZ=18.79, maxZ=22.79 },
        { options = { 
            { 
                type = "client",
                event = "qb-clothing:vagos",
                icon = "fas fa-door-closed", 
                label = "Open Wardrobe", 
                gang = "vagos" 
            },
        }, 
        distance = 1.5
    })
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("ballasStash", vector3(118.61, -1965.42, 21.33), 2, 1, { name="ballasStash", heading=291, debugPoly=true, minZ=18.73, maxZ=22.73 },
        { options = { 
            { 
                type = "client",
                event = "qb-gangs:ballasStash",
                icon = "fas fa-door-closed", 
                label = "Access Gang Stash", 
                gang = "ballas" 
            },
        }, 
        distance = 1.5
    })
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("ballasClothing", vector3(120.87, -1969.18, 21.33), 1.5, 1, { name="ballasClothing", heading=292, debugPoly=true, minZ=18.33, maxZ=22.33 },
        { options = { 
            { 
                type = "client",
                event = "qb-clothing:ballas",
                icon = "fas fa-door-closed", 
                label = "Open Wardrobe", 
                gang = "ballas" 
            },
        }, 
        distance = 1.5
    })
end)
