class Manual < Sequel::Model
  plugin :timestamps
  
  one_to_many :sections, :constraint => :destroy
  
end

