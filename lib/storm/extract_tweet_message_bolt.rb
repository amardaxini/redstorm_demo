require 'json'
require 'redis'
module C4CAnalyzer
  class ExtractTweetMessageBolt < RedStorm::SimpleBolt
  	on_init do
  		@redis = Redis.new(:host => "localhost", :port => 6379)
  	end

    on_receive do |tuple| 
      json = tuple.getString(0)
      hash = JSON.parse(json)
      hash["score"] = rand(10)
      @redis.hmset("tweets:#{hash['id']}" ,"data",hash.to_json)
      # @redis.sadd("tweet",hash['id'])
      @redis.zadd('tweet',hash["score"],hash)
      [hash['id'],hash["score"]]
    end
  end
end
