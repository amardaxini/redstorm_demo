source 'https://rubygems.org'

platform :jruby do
  gem 'redstorm'
  gem 'pry'
end

platform :mri  do
  #gem 'twitter-stream', '~> 0.1.16'
  gem 'redis', '~> 3.0.2'
  gem 'hiredis', '~> 0.4.5'
  gem 'twitter',:git=>'git@github.com:sferik/twitter.git'
  
end


group :test do
  gem 'rake'
  gem 'rspec', '~> 2.11.0'
end
gem 'pry'

group :topology do
  gem 'redis', '~> 3.0.2', :platforms => :jruby
  gem 'json', :platforms => :jruby
  gem 'twitter-text', '~> 1.5.0', :platform => :jruby
  gem 'pry',:platform=>:jruby
end