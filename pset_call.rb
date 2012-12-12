require 'net/http'
require 'uri'

if ARGV[0] == 'json'
   headers = {"ACCEPT" => 'application/json' }
else
   headers = {"ACCEPT" => 'application/xml' }
end


url = URI.parse('http://test-integral.nature.com/product/data/families')
req = Net::HTTP::Get.new(url.request_uri, headers)


res = Net::HTTP.start(url.host, url.port) { |http|
   http.request(req)
}
puts res.body  
