# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rake'
require File.expand_path('../config/application', __FILE__)

module ::Potts
  class Application
    include Rake::DSL
  end
end

Potts::Application.load_tasks
