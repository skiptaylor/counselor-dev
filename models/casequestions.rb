class Casequestion < Sequel::Model
  plugin :timestamps

	many_to_one :casestudy,   required: false
	one_to_many :caseanswers, :constraint => :destroy
  
	def remove
		self.caseanswers.each {|a| a.remove}
		self.destroy!
	end

end

