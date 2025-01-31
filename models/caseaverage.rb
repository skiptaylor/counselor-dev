class Caseaverage < Sequel::Model
  plugin :timestamps

	many_to_one :user
  many_to_one :casestudy, required: false
	
  def remove
		self.destroy
	end

end