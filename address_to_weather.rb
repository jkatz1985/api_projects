require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
street_address = gets.chomp
url_safe_street_address = URI.encode(street_address)

# Your code goes below.

url_weather_data = "https://api.forecast.io/forecast/5c48999e1c9b93f9fd0134d755bf0271"+url_safe_street_address
raw_weather_data = open(url_weather_data).read
parsed_weather_data = JSON.parse(raw_weather_data)

the_hour_outlook = parsed_weather_data["hourly"]["data"][1]["summary"]
the_day_outlook = parsed_weather_data["daily"]["data"][1]["summary"]
the_temperature = parsed_weather_data["currently"]["temperature"]

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{street_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
