require 'capybara'
require 'site_prism'  
require "selenium-webdriver"
require 'capybara/cucumber'
require 'capybara/rspec'

Capybara.default_driver = :selenium
Capybara.app_host = 'https://www.youse.com.br'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Variables passed by parameter on the command line
$login = ENV['email']
$password = ENV['password']