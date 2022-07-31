Citizen.CreateThread(function()
    local shown = false
    local cacheddata = {}

    function OpenProgressBar(data)
        if shown == false then
            if data == nil then
                data = {
                    time = 10,
                    label = "Test Progress Bar"
                }
            else
                if data.time == nil then
                    data.time = 10
                end
                if data.label == nil then
                    data.label = "Test Progress Bar"
                end
                if data.allowcancel == nil then
                    data.allowcancel = false
                end
            end

            cacheddata = data
            SendNUIMessage({
                action = "open",
                data = data
            })
            shown = true
        else
            TriggerEvent(Config.NotifyEvent, _U('already_doing_something'))
        end
    end

    exports("OpenProgressBar", OpenProgressBar)

    RegisterNUICallback("stop", function()
        shown = false

        if cacheddata.finished ~= nil then
            cacheddata.finished(cacheddata)
        end
    end)

    RegisterCommand("testprogbar", function()
        exports["zerio-progressbar"]:OpenProgressBar({
            allowcancel = true,
            time = 5,
            label = "Test",

            finished = function()
                print("finished")
            end,

            canceled = function()
                print("canceled")
            end
        })
    end)

    while true do
        if cacheddata and cacheddata.allowcancel then
            if IsControlPressed(0, 200) then
                if cacheddata.canceled ~= nil then
                    cacheddata.canceled(cacheddata)
                end

                cacheddata = {}
                shown = false
                SendNUIMessage({
                    action = "cancel"
                })
                TriggerEvent(Config.NotifyEvent, _U('cancelled'))
            end
            Citizen.Wait(0)
        else
            Citizen.Wait(500)
        end
    end
end)
