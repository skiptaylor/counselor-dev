class Chart < Sequel::Model
  plugin :timestamps
  
  many_to_one :casestudy

end

