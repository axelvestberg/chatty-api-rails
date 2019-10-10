class Channel < ApplicationRecord
	has_many :programs

	def as_json(options={})
		super(:include => {
						:programs => {:only => [:title, :start, :stop, :live]}
			},
			:except => [:created_at, :updated_at]
		)	
		end
end
