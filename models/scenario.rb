class Scenario < Sequel::Model
  plugin :timestamps
  
  one_to_many :questions, :constraint => :destroy
	one_to_many :averages, :constraint => :destroy
	
	def group_average
		averages = self.averages
		avg = 0
		averages.each {|a| avg += a.score}
		avg = (avg/averages.count).to_i
	end

	def remove
		self.questions.each {|q| q.remove}
		self.averages.each  {|a| a.remove}
		Use.all(scenario_id: self.id).destroy
		self.destroy!
	end
end