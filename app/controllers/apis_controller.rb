require 'httparty'

class FetchApi
	def self.fetch_xmltv
		url = 'https://json.xmltv.se/svt1.svt.se_2019-10-10.json'
		response = HTTParty.get(url)
		response.parsed_response
	end
end