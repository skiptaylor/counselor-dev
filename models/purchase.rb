class Purchase < Sequel::Model
  plugin :timestamps

	many_to_one :user
	
	def shipping_status
		color = 'warning'		
		color = 'important' if shipped_on
		color = 'success' if received_on
		color
	end

	def remove
		self.destroy
	end

end