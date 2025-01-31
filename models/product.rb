class Product < Sequel::Model
  plugin :timestamps
	
	def remove
		self.destroy!
	end
end