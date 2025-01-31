# Use with Postico

# ALTER TABLE casestudies ALTER COLUMN title TYPE integer USING (title::integer);
# delete from scores where deleted_at IS NOT NULL;
# delete from caseanswers where deleted_at IS NOT NULL;
# delete from casequestions where deleted_at IS NOT NULL;
# delete from users where email = 'sample';

# ALTER TABLE "public"."users" ADD UNIQUE ("email");

# delete from scores where deleted_at IS NOT NULL;
# delete from averages where deleted_at IS NOT NULL;
# delete from uses where delete_at IS NOT NULL;
# delete from users where delete_at IS NOT NULL;
# delete from purchases where delete_at IS NOT NULL;

# ALTER TABLE "public"."users" ADD "TRUE" ("setA");

# Update "public"."users"
# SET set_c = TRUE where max_scenarios = 36

# ALTER TABLE casestudies
# ALTER COLUMN title TYPE INTEGER USING (char_length(title));
  
  
class User < Sequel::Model
  plugin :timestamps
  
  include BCrypt

  one_to_many :scores, :constraint => :destroy
  one_to_many :casescores, :constraint => :destroy
	one_to_many :averages
	one_to_many :purchases, :constraint => :destroy
  one_to_many :caseaverages

	def remaining_exams
    unless :exam_id != nil
		self.max_exams - Use.all(user_id: self.id).count
  end
	end
   
	def remaining_scenarios
		used = 0
		Use.all(user_id: self.id, :scenario_id.not => nil, :sample => false).each do |use|
			used = used + 1 unless use.scenario.practice? || use.scenario.workshop?
		end
		self.max_scenarios - used
	end
  
	def remaining_practice_scenarios
		used = 0
		Use.all(user_id: self.id, :scenario_id.not => nil, :sample => false).each do |use|
			used = used + 1 if use.scenario.practice? unless use.scenario.workshop?
		end
		self.max_practice_scenarios - used
	end
  
  def remove_sample
    Use.all(user_id: self.id).destroy
    
    self.caseaverages.each {|c| c.remove}
    self.purchases.each {|p| p.remove}
    self.casescores.each {|o| o.remove}
    self.scores.each {|s| s.remove}
    self.delete
  end
	
	def expired?
		self.expiration_date < DateTime.now
	end
  
  def remove
    
    self.caseaverages.each {|c| c.remove}
    self.purchases.each {|p| p.remove}
    self.scores.each {|s| s.remove}
    self.casescores.each {|o| o.remove}
    self.delete
  end
end
