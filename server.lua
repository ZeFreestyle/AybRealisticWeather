local apiKey = "YOUR_API_KEY" -- Clé API de l'API météo
local apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=Los%20Angeles,us&units=metric&appid=" .. apiKey
local updateInterval = 600000 

function updateWeather()
    PerformHttpRequest(apiUrl, function(statusCode, data, headers)
        if statusCode == 200 then
            local weatherData = json.decode(data)
            local temperature = weatherData.main.temp
            local humidity = weatherData.main.humidity
            local weatherCondition = weatherData.weather[1].main 

            TriggerClientEvent('meteo:updateWeather', -1, temperature, humidity, weatherCondition)
        else
            print("Erreur lors de la récupération des données météorologiques : " .. statusCode)
        end
    end)
end

-- Appeler updateWeather toutes les 10 minutes
Citizen.CreateThread(function()
    while true do
        updateWeather()
        Citizen.Wait(updateInterval)
    end
end)
