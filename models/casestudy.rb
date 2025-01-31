class Casestudy < Sequel::Model
  plugin :timestamps

  one_to_many :casequestions
  one_to_many :charts
  one_to_many :casescores
  one_to_many :caseaverages

end

