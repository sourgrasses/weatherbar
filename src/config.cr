require "json"

module Weatherbar
  class Config
    include JSON::Serializable

    @[JSON::Field(key: "key")]
    property key : String

    @[JSON::Field(key: "city")]
    property city : String

    @[JSON::Field(key: "units")]
    property units : String
  end
end
