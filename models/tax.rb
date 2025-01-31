class Tax < Sequel::Model
  plugin :timestamps

  def self.rate zipcode
    rate = 0
    if area = self.first(zip: zipcode)
      rate = area.rate
    end
    rate
  end

end

