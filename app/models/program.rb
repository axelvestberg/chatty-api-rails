class Program < ApplicationRecord
	belongs_to :channel

	def as_json(options={})
		super(:include => {
						:channel => {:only => [:name]}
			}
		)	
		end
end
