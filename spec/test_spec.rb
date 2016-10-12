require 'spec_helper'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: true, timeout: 30)
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :poltergeist
  config.app_host = 'http://tsmsogn.github.io'
end

describe '/', type: :feature do
  subject { page }
  before { visit('/') }

  it 'Title' do
    expect(page).to have_title 'u.find.any?'
  end
end
