class Question < Sequel::Model
  plugin :timestamps

	many_to_one :scenario, required: false
	many_to_one :exam, required: false
	one_to_many :answers, :constraint => :destroy

	def passed? user
		if self.exam_id
			return true if self.answers.scores.first user_id: user
		elsif self.scenario_id
			required_answers = self.answers.all required: 't'
			if required_answers.count > 0
				answered = 0
				required_answers.each {|a| answered += 1 if a.scores.first user_id: user}
				return true if answered == required_answers.count
			else
				return true if self.answers.scores.first user_id: user
			end
		end

		return false
	end

	def stop?
		unless self.scenario_id
			return false
		else
			required_answers = self.answers.all required: 't'
			if required_answers.count > 0
				return true
			else
				return false
			end
		end
	end

	def remove
		self.answers.each {|a| a.remove}
		self.destroy!
	end
  
end