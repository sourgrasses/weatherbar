require "./config"
require "./response"

require "http/client"
require "option_parser"

module Weatherbar
  extend self

  def main
    path = Path.new(Path.home, ".weatherbar.json")
    detail = false

    OptionParser.parse do |parser|
      parser.banner = "Usage: weatherbar [args]"
      parser.on("-c", "--config", "Path to configuration file, defaults to $HOME/.weatherbar.json") { |p| path = Path.new(p) }
      parser.on("-d", "--detail", "Prints more detailed weather information") { detail = true }
      parser.on("-h", "--help", "Show help") do
        puts parser
        exit
      end
    end

    config = File.open(path) do |fd|
      Config.from_json(fd.gets_to_end)
    end

    url = "http://api.openweathermap.org/data/2.5/weather?APPID=#{config.key}&id=#{config.city}&units=#{config.units}"

    res = HTTP::Client.get url
    weather = WeatherResponse.from_json(res.body)

    if detail
      puts weather.name
      puts "#{weather.weather[0].description}"
      puts "#{weather.temperatures.temp.to_i}°, feels like #{weather.temperatures.feels_like.to_i}°"
    else
      puts "#{weather.weather_emoji} #{weather.temperatures.temp.to_i}°"
    end
  end
end

Weatherbar.main
