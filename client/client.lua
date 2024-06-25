function sendNotification(args)
    SendNUIMessage({
        action = 'notification',
        data = args
    })
end

exports('sendNotification', sendNotification)

/**
 * @param {string} color (rgb)
 * @param {string} title
 * @param {string} message
 * @param {number} time
 */

/*example
    sendNotification('rgb(), 'Title', 'Message', 5000)
    
    CreateThread(function()
        while true do
            if IsControlJustReleased(0, 38) then
                sendNotification({color = 'rgb(255, 0, 0)', title = 'Title', message = 'Message', time = 5000})
            end
            Wait(1)
        end
    end)
 */