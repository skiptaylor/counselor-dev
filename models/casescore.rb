class Casescore < Sequel::Model
  plugin :timestamps
  
  many_to_one :user
  many_to_one :casestudy,  required: false
  many_to_one :caseanswer
  many_to_one :casequestion

  def remove
    self.destroy
  end

end


