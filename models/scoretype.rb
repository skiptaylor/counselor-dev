class Scoretype < Sequel::Model
  plugin :timestamps

  many_to_one :scenario
	many_to_one :user

	def remove
		self.destroy!
	end

end