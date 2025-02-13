class Exam < Sequel::Model
  plugin :timestamps
  
	one_to_many :questions
	one_to_many :averages
	
	def group_average
		averages = self.averages(:score.gt => 20)
		if averages.count > 0
			avg = 0
			averages.each {|a| avg += a.score}
			return avg = (avg/averages.count).to_i
		else
			return nil
		end
	end

	def remove
		self.questions.each {|q| q.remove}
		self.averages.each  {|a| a.remove}
		Use.all(exams_id: self.id).destroy
		self.destroy!
	end

end