class Score < Sequel::Model
  plugin :timestamps

	many_to_one :user
	many_to_one :answer
	many_to_one :question
	many_to_one :scenario, required: false
	many_to_one :exam, required: false

	def remove
		self.destroy
	end
end

