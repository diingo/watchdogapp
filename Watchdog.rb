require 'twitter'
require 'gmail'

Twitter.configure do |config|
  config.consumer_key = "ptR29a9NXqpYJuLXQFfuQ"
  config.consumer_secret = "RrswBFjkseKJcnv37dcJyDTKJjT4qUaciwIuiTAHB0"
  config.oauth_token = "1537170236-ax1koZDRm6XbHVvuv3wtL6JdJ8VVUPeOYyxZO64"
  config.oauth_token_secret = "808ilDvObTUGyNc6ovk8av9zTpnOVHv3fJkFKYd332g"
end

@tweets = []

Twitter.search("@Makersquare", options = {:count => 10}).results.each do |tweet|
 
    @tweets << [tweet.user.handle, tweet.text, tweet.user.url]


end

TWEETS = @tweets

gmail = Gmail.connect("", "") do |gmail|

  gmail.deliver do
    to "gene.gkl@gmail.com"
    subject "Twitter Watchdog: MKS"
    @check="Hello"
    html_part do
      body "<p>'#{TWEETS[0][0]}: #{TWEETS[0][1]}'</p>
            <p>'#{TWEETS[1][0]}: #{TWEETS[1][1]}'</p>
            <p>'#{TWEETS[2][0]}: #{TWEETS[2][1]}'</p>
            <p>'#{TWEETS[3][0]}: #{TWEETS[3][1]}'</p>
            <p>'#{TWEETS[4][0]}: #{TWEETS[4][1]}'</p>
            <p>'#{TWEETS[5][0]}: #{TWEETS[5][1]}'</p>
            <p>'#{TWEETS[6][0]}: #{TWEETS[6][1]}'</p>
            <p>'#{TWEETS[7][0]}: #{TWEETS[7][1]}'</p>
            <p>'#{TWEETS[8][0]}: #{TWEETS[8][1]}'</p>
            <p>'#{TWEETS[9][0]}: #{TWEETS[9][1]}'</p>"
        end
    end   
end



