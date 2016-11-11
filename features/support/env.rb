require 'capybara'
require 'site_prism'  
require "selenium-webdriver"
require 'capybara/cucumber'
require 'capybara/rspec'
require 'faker'

Faker::Config.locale = 'pt-BR'

Capybara.default_driver = :selenium
Capybara.app_host = 'https://www.youse.com.br'
Capybara.default_max_wait_time = 5
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


##############################################################################
##############################################################################

# Variables passed by parameter on the command line
$email 	       = ENV['email']
$password      = ENV['password']
$name 	       = ENV['name'] || (Faker::Name.name).tr(".", "")
$cpf 	       = ENV['cpf'] || "32917398094"
$date_of_birth = ENV['date_of_birth'] || "1#{Faker::Number.between(1, 9)}/0#{Faker::Number.between(1, 9)}/#{Faker::Number.between(1960, 1990)}"


# Tests won't run if email and password are missing
if (!$email || !$password)
	puts "E-mail and password are mandatory. Run again passing them as parameter: 'cucumber email=name@site.com password=12345678'"
	exit
end


# Password must have length more than 7
if ($password.length < 8)
	puts "Password must have more than 7 characters"
	exit
end

##############################################################################
##############################################################################


Before do
	page.driver.browser.manage.window.maximize
end


After do
  Capybara.reset_sessions!
end
