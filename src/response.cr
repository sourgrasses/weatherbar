require "json"

module Weatherbar
  class Coordinates
    include JSON::Serializable

    @[JSON::Field(key: "lon")]
    property longitude : Float64

    @[JSON::Field(key: "lat")]
    property latitude : Float64
  end

  class Weather
    include JSON::Serializable

    @[JSON::Field(key: "id")]
    property id : Int32

    @[JSON::Field(key: "main")]
    property main : String

    @[JSON::Field(key: "description")]
    property description : String

    @[JSON::Field(key: "icon")]
    property icon : String
  end

  class Temperatures
    include JSON::Serializable

    @[JSON::Field(key: "temp")]
    property temp : Float64

    @[JSON::Field(key: "feels_like")]
    property feels_like : Float64

    @[JSON::Field(key: "temp_min")]
    property temp_min : Float64

    @[JSON::Field(key: "temp_max")]
    property temp_max : Float64

    @[JSON::Field(key: "pressure")]
    property pressure : Float64

    @[JSON::Field(key: "humidity")]
    property humidity : Float64
  end

  class Wind
    include JSON::Serializable

    @[JSON::Field(key: "speed")]
    property speed : Float64

    @[JSON::Field(key: "deg")]
    property deg : Float64
  end

  class Sys
    include JSON::Serializable

    @[JSON::Field(key: "type")]
    property type : Int32

    @[JSON::Field(key: "id")]
    property id : Int32

    @[JSON::Field(key: "sunrise")]
    property sunrise : Int32

    @[JSON::Field(key: "sunset")]
    property sunset : Int32

    @[JSON::Field(key: "country")]
    property country : String
  end

  class WeatherResponse
    include JSON::Serializable

    @[JSON::Field(key: "coord")]
    property coordinates : Coordinates

    @[JSON::Field(key: "weather")]
    property weather : Array(Weather)

    @[JSON::Field(key: "base")]
    property base : String

    @[JSON::Field(key: "name")]
    property name : String

    @[JSON::Field(key: "main")]
    property temperatures : Temperatures

    @[JSON::Field(key: "visibility")]
    property visibility : Int32

    @[JSON::Field(key: "dt")]
    property dt : Int32

    @[JSON::Field(key: "timezone")]
    property timezone : Int32

    @[JSON::Field(key: "id")]
    property id : Int32

    @[JSON::Field(key: "cod")]
    property cod : Int32

    @[JSON::Field(key: "wind")]
    property wind : Wind

    @[JSON::Field(key: "sys")]
    property sys : Sys

    def weather_emoji
      case @weather[0].@icon
      when "01d"
        "☀️ "
      when "01n"
        "🌙 "
      when "02d"
        "🌤 "
      when "02n", "03d", "03n", "04d", "04n"
        "☁️ "
      when "09d", "09n"
        "🌧 "
      when "10d", "10n"
        "🌦 "
      when "11d", "11n"
        "⛈ "
      when "13d", "13n"
        "🌨 "
      when "50d", "50n"
        "🌫 "
      else
        ""
      end
    end
  end
end
