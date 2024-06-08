require 'net/http'
require 'uri'

uri = URI.parse('http://localhost:3000/')
response = Net::HTTP.get_response(uri)

puts response.body
