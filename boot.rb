ENV["RACK_ENV"] ||= "development"
env = ENV['RACK_ENV']
# RAILS_ENV work as well
if ENV["RAILS_ENV"]
  env = ENV["RAILS_ENV"]
end

ENV['RACK_ENV'] = env
RACK_ENV = env

require 'rubygems'
require 'bundler'
Bundler.setup
Bundler.require(:default)

$LOAD_PATH.unshift "."

require "sinatra"
require 'yaml'
require 'json'

require 'logger'
require 'date'
require 'time'
require 'multi_json'
require 'faraday'
require 'oj'
MultiJson.engine = :oj

APP_ROOT = Pathname.new(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load(
  APP_ROOT.join(".env.local"),
  APP_ROOT.join(".env.#{ENV['RACK_ENV']}"),
  APP_ROOT.join(".env")
)

ActiveSupport::Dependencies.autoload_paths << APP_ROOT.join("jobs")

Dir["config/initializers/*.rb"].sort.each { |f| require f }
