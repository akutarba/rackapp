require "rubygems"
require "bundler/setup"
require "sinatra"
require "haml"
require File.expand_path(File.dirname(__FILE__) + '/app')

set :run, false
set :raise_errors, true
set :server => 'Thin'

run Sinatra::Application