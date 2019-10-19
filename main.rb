#!/usr/bin/env ruby

require './weatherNow.rb'
require './forecast3Hours5Days.rb'
require './forecast24Hours.rb'

while true
  puts '1. Weather Now'
  puts '2. Forecast 3 Hours / 5 Days'
  puts '3. Forecast 24 Hours'
  puts 'Q. Quit the program'

  case gets.chomp
  when 'q', 'Q'
    break
  when '1'
    weatherNow()
  when '2'
    forecast3Hours5Days()
  when '3'
    forecast24Hours()
  else
    puts ''
    puts 'Choose one of these options...'
    puts ''
  end
end