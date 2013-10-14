require 'bundler/setup'
require 'redis'
require 'thread'
require 'twitter'
require 'pry'

module C4CAnalyzer

  class TwitterReader
    attr_accessor :config

    def initialize
      @redis = Redis.new(:host => "localhost", :port => 6379, :driver => :hiredis)
      @tweets = Queue.new
      @client =  Twitter::REST::Client.new do |config|
        config.consumer_key        = "GWjgwCbAC7D7OwyoMxth5Q"
        config.consumer_secret     = "RHfgS9jT74n3p3taebmrNiAB0YnvxkDsBEyLhDeGBR8"
        config.access_token        = "44545367-A5D4BSmpugex7uvEILyKKCpNqPcFjZi7stOm4bCBV"
        config.access_token_secret = "KCss6zYtcvFE2PfYXniz8c9fDMJxma2vPvIlr6Vck"
     end

    end

    def search(keywords=[],no_of_tweets=100)

                  
      puts("TwitterReader starting")
      @client.search(keywords.join(","),:result_type =>'mixed').collect do |item|
        puts item.id
        @redis.rpush("twitter_search", item.attrs.merge(:score=>0).to_json)
      end

      puts("opening stream connection")
      begin
        # stream.run
      ensure
        puts("closing stream connection")
        # stream.stop
      end
      binding.pry
    end     

    private
    # def search
    #   # @twitter_client.search(query,params)
    # end
  end
end
x = C4CAnalyzer::TwitterReader.new
x.search(["coffee"])
# loop do
#   begin
#     Tweitgeist::TwitterReader.new.start
#   rescue
#     puts("TwitterReader exception=##{$!.inspect}")
#   end
# end