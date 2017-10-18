source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
#Defaults
gem 'bcrypt', '~> 3.1.7'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.2'
gem 'redis', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

#custom additions
gem 'activeadmin'
gem 'airrecord'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'chartkick'
gem 'devise'
gem 'easy_as_pie'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'friendly_id', '~> 5.1.0'
gem 'groupdate'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'omniauth-google-oauth2'
gem 'sendgrid-ruby'
gem 'twitter'
# Plus integrations with activeadmin
gem 'active_bootstrap_skin'
gem 'cancancan' # or cancancan
gem 'draper'
gem 'pundit'
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
