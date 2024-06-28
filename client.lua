local currentWeather = "Clear" -- Condition météo par défaut
local temperature = 20 -- Température par défaut
local humidity = 50 -- Humidité par défaut

RegisterNetEvent('meteo:updateWeather')
AddEventHandler('meteo:updateWeather', function(temp, hum, condition)
    temperature = temp
    humidity = hum
    currentWeather = condition

    SetWeatherTypePersist(currentWeather)
    SetWeatherTypeNow(currentWeather)
    SetWeatherTypeNowPersist(currentWeather)
    SetWindSpeed(5.0) 

    -- Afficher des messages de météo (facultatif)
    TriggerEvent('chat:addMessage', {
        color = { 255, 255, 255 },
        multiline = true,
        args = { 'Météo mise à jour :', string.format('Température : %.1f°C, Humidité : %d%%, Conditions : %s', temperature, humidity, currentWeather) }
    })
end)
