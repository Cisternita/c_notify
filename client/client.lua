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
    sendNotification('rgb(255, 0, 0), 'Title', 'Message', 5000)
 */