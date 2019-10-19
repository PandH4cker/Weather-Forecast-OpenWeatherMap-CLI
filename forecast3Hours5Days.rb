#!/usr/bin/env ruby

require 'net/http'
require 'json'
require './api.rb'

def forecast3Hours5Days()
  #Get city's name:
  print 'Name in English of the city: '
  name = gets.chomp

  puts ''
  puts '==============================='
  puts 'OpenWeatherMap API Loading...'
  puts '==============================='
  puts ''

  #Fetch weather data
  uri = URI('http://api.openweathermap.org/data/2.5/forecast?q=' + name + '&units=metric&lang=en' + @api_param)
  json = Net::HTTP.get(uri)
  data = JSON.parse(json)

  #Output
  if data['cod'] == '200'
    name = data['city']['name']
    data['list'].each do |day|
        puts '== ' + Time.at(day['dt']).strftime('%F %R %:z') + ' =='

        puts 'The weather in ' + name + ' is ' + day['weather'][0]['description']

        puts 'The mainly temperature in ' + name + ' is ' + day['main']['temp'].to_s + '℃' 

        puts 'The minimal and maximal temperatures in ' + name + ' are ' + day['main']['temp_min'].to_s + '℃  ~ ' + day['main']['temp_max'].to_s + '℃'

        puts 'The percent of clouds in ' + name + ' is ' + day['clouds']['all'].to_s + '%'

        puts 'The wind speed in ' + name + ' is ' + day['wind']['speed'].to_s + ' metric/second at ' + day['wind']['deg'].to_s + ' degree'

        puts 'The percent of humidity in ' + name + ' is ' + day['main']['humidity'].to_s + '%'

        puts 'The amount of pressure in ' + name + ' is ' + day['main']['pressure'].to_s + 'hPa'

        puts ''
    end
  else
    puts data['cod'].to_s + ' - ' + data['message']
  end

  puts ''
  puts 'Information from OpenWeatherMap : http://openweathermap.org/'
  puts ''
end