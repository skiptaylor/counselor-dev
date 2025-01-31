class Averages < Sequel::Model
  plugin :timestamps

	many_to_one :scenario, required: false
	many_to_one :exam,     required: false
	many_to_one :user
  
	def remove
		self.destroy!
	end

end