Config = {}

Config.Locale = "en"

if GetResourceState("qb-core") == 'started' then
    Config.NotifyEvent = "QBCore:Notify"
end
if GetResourceState("es_extended") == 'started' then
    Config.NotifyEvent = "esx:showNotification"
end

if Config.NotifyEvent == nil then
    Config.NotifyEvent = ""
end
