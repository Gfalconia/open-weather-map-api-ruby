# frozen_string_literal: true
require "zeitwerk"
require "json"
require "ostruct"
loader = Zeitwerk::Loader.for_gem
loader.setup
require "faraday"
require "faraday_middleware"
require_relative "open_weather_map_api/version"

module OpenWeatherMapApi
  
end

loader.eager_load