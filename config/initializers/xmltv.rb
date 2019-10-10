require 'httparty'
require 'json'

class ExternalApi
  include HTTParty
  base_uri 'https://json.xmltv.se'	

	def initialize(channel, date)
		@channel = channel
		@date = date
	end

  def url
    self.class.get("/#{@channel}_#{@date}.json").parsed_response
	end
end

def fetch_tv_data
	@savedArray = []
	@notSavedArray = []
	iterate_channels
	puts "Found #{@notSavedArray.length} programs that already exist in database"
	puts "Found #{@savedArray.length} programs and added them to database"
	puts "-- Fetch complete --"
end

def iterate_channels
	cha = ["svt1.svt.se", "svt2.svt.se", "tv3.se", "tv4.se", "kanal5.se", "tv6.se"]

	cha.each_with_index do |channel, index|

		existing_channel = Channel.find_by(name: cha[index][/^([^.]+)/])

		if !existing_channel
			channels = Channel.new do |key|
				key.name = cha[index][/^([^.]+)/]
			end

			if channels.save
				puts "Channel saved"
			else
				puts "Channel not saved"
			end

			@indexplus = index + 1
			response = ExternalApi.new(cha[index], Time.now.strftime("%Y-%m-%d"))
			@res = response.url['jsontv']['programme']
			iterate_programs

		end
	end
end

def iterate_programs

	@res.each do |program, index|

		existing_program = Program.find_by(title: program['title'], start: program['start'])

		if !existing_program
			programs = Program.new do |key|
				key.title = program['title']
				key.start = program['start']
				key.stop = program['stop']
				key.live = false
				key.channel_id = @indexplus
			end
			
			if programs.save
				@savedArray.push(program['title'])
			else
				@notSavedArray.push(program['title'])
			end

		end
	end
end

fetch_tv_data