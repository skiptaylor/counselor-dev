class Section < Sequel::Model
  plugin :timestamps
  
  many_to_one :manual, required: false
  one_to_many :chapters, :constraint => :destroy
end
