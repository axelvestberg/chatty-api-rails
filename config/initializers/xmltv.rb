require 'httparty'
require 'json'

class ExternalApi
  include HTTParty
  base_uri 'https://json.xmltv.se'

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
res = response.svt1['jsontv']['programme']

# [/^([^.]+)/] regex for finding string before first period .

res.each do |program, index|
	existing_program = Program.find_by(title: program['title'], start: program['start'])
	if !existing_program || Program.count == 0
		programs = Program.new do |key|
		key.title = program['title']
		key.start = program['start']
		key.stop = program['stop']
		key.live = false
		key.channel_id = 1
		end
		if programs.save
			puts "programs saved"
		else
			puts "progams not saved"
		end
	end
end