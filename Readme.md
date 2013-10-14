== Installation

		rvm install jruby
		export JRUBY_OPTS=--1.9
		bundle install
		bundle exec redstorm install
		bundle exec redstorm bundle topology
		# Local
		bundle exec redstorm local lib/storm/c4c_topoplogy.rb 

== Configure Twitter Keys

 Add your twitter configuration `lib/twitter/twitter_reader.rb`
 
		 rvm use ruby-1.9.3
		 bundle install
		 ruby lib/twitter/twitter_reader.rb