class Senario_purchase < Sequel::Model
  plugin :timestamps

	many_to_one :user

	def remove_purchase_date
		self.destroy!
	end

end