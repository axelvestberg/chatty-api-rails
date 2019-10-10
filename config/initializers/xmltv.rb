require 'httparty'
require 'json'
# Use the class methods to get down to business quickly
# response = HTTParty.get('https://json.xmltv.se/svt1.svt.se_2019-10-09.json')

# puts response.body, response.code, response.message, response.headers.inspect

# Or wrap things up in your own class
class ExternalApi
  include HTTParty
  base_uri 'https://json.xmltv.se'

  # def initialize(service, page)
  #   @options = { query: { site: service, page: page } }
	# end
	
	def initialize(channel, date)
		@channel = channel
		@date = date
	end

  def svt1
    self.class.get("/#{@channel}_#{@date}.json").parsed_response
  end

  def tv4
    self.class.get("/tv4.se_2019-10-09.json")
	end
end

response = ExternalApi.new("svt1.svt.se", Time.now.strftime("%Y-%m-%d"))
# obj = JSON.parse(response)
res = response.svt1['jsontv']['programme']

# puts @channel[/^([^.]+)/]

res.each do |program, index|
	existing_program = Program.find_by(title: program['title'], start: program['start'])
	if !existing_program || Program.count == 0
		programs = Program.new do |key|
		key.title = program['title']
		key.start = program['start']
		key.stop = program['stop']
		key.channel_id = 1
		end
		if programs.save
			puts "programs saved"
		else
			puts "progams not saved"
		end
	end
end