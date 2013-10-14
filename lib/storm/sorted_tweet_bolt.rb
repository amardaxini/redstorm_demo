require 'json'
require 'redis'
module C4CAnalyzer
  class SortedTweetBolt < RedStorm::SimpleBolt
  	on_init do
  		@redis = Redis.new(:host => "localhost", :port => 6379)
  	end

    on_receive do |tuple| 
      @redis.ZRANGEBYSCORE('tweet',-inf+inf)
     
    end
  end
end
