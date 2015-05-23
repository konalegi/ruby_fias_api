require File.expand_path('../boot', __FILE__)

Bundler.require(:default)

require 'endive'
Endive.application.config.root = File.expand_path('../..', __FILE__)

module Govermedia
  class Application < Endive::Application

  end
end