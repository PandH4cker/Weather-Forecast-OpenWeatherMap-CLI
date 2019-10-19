#!/usr/bin/env ruby

require 'net/http'
require 'json'
require './api.rb'

def weatherNow()
  #Get city's name:
  print 'Name in English of the city: '
  name = gets.chomp

  puts ''
  puts '==============================='
  puts 'OpenWeatherMap API Loading...'
  puts '==============================='
  puts ''


  # Fetch weather data
  uri = URI('http://api.openweathermap.org/data/2.5/weather?q=' + name + '&units=metric&lang=en' + @api_param)
  json = Net::HTTP.get(uri)
  weather = JSON.parse(json)

  if weather['cod'] == 200
    #Output
    name = weather['name']
    puts 'It is ' + (Time.at(weather['dt']) + 2 * 60 * 60).strftime('%F %R %:z') + ' in ' + name

    puts 'The weather in ' + name + ' is ' + weather['weather'][0]['description']

    puts 'The temperature in ' + name + ' is ' + weather['main']['temp'].to_s + '℃'

    puts 'The minimal and maximal temperatures in ' + name + ' are ' + weather['main']['temp_min'].to_s + '℃  ~ ' + weather['main']['temp_max'].to_s + '℃'

    puts 'The next sunrise in ' + name + ' is at ' + (Time.at(weather['sys']['sunrise']) + 2 * 60 * 60).strftime('%F %R %:z') + ','
    puts ''
    puts 'The next sunset is at ' + (Time.at(weather['sys']['sunset']) + 2 * 60 * 60).strftime('%F %R %:z')

    puts 'The percent of clouds in ' + name + ' is ' + weather['clouds']['all'].to_s + '%'

    puts 'The wind speed in ' + name + ' is ' + weather['wind']['speed'].to_s + 'metric/second'

    puts 'The percent of humidity in ' + name + ' is ' + weather['main']['humidity'].to_s + '%'

    puts 'The amount of pressure in ' + name + ' is ' + weather['main']['pressure'].to_s + 'hPa'

    puts ''
    puts 'Information from OpenWeatherMap : http://openweathermap.org/'
    puts ''
  else
    puts weather['cod'].to_s + ' - ' + weather['message']
  end
end