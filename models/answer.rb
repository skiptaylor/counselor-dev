class Answer < Sequel::Model
  plugin :timestamps

	many_to_one :question
	one_to_many :scores, :constraint => :destroy
  
  def remove
    self.scores.each {|s| s.delete}
    self.destroy!
  end

end

