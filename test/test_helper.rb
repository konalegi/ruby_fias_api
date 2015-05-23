ENV['APP_ENV'] ||= 'test'

require File.join(File.dirname(__FILE__), '../config/environment.rb')

require 'endive/testing'
require 'minitest/autorun'
