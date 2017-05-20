require './boot.rb'

Dir["lib/**/*.rb"].each { |f| require f }
Dir["models/**/*.rb"].each { |f| require f }
