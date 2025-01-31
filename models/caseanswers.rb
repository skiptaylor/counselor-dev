class Caseanswer < Sequel::Model
  plugin :timestamps

	many_to_one :casequestion
  one_to_many :casescores, :constraint => :destroy
  
  def remove
    self.casescores.each {|s| s.delete}
    self.destroy!
  end

end
