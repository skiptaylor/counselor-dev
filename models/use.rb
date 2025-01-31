class Use < Sequel::Model
  plugin :timestamps

	many_to_one :user
	many_to_one :scenario, required: false
	many_to_one :exam, required: false
end