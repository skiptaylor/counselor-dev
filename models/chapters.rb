class Chapter < Sequel::Model
  plugin :timestamps
  
  many_to_one :section, required: false
end

