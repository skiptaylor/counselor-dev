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
  
  
Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Integer :legacy_id, 
      
	    Text :email, unique_index: true
	    Text :password, BCryptHash
      
	    String :pass_reset_key
	    Date :pass_reset_date
      
	    Boolean :admin, default: false
      
	    String :name
	    String :phone
      String :license, default: ""
	    String :hear_about_us
      
	    Text :notes
      
	    Date :expiration_date, default: Chronic.parse('1 year from now')
	    Date :refund_request_date
	    Date :refund_check_date
      
	    Integer :max_exams, default: 0
	    Integer :max_scenarios, default: 0
      Integer :max_practice_scenarios, default: 0
      
	    Boolean :set_a, default: false
      Boolean :set_b, default: false
      Boolean :set_c, default: false
      Boolean :set_d, default: false
      Boolean :hard_copy, default: false
      
      Boolean :nce_hard_copy, default: false
      
      Boolean :casestudy_downloads, default: false
      Boolean :ncmhce_downloads, default: false
	    Boolean :nce_downloads, default: false
      
	    Boolean :ncmhce_flashcards, default: false
	    Boolean :nce_flashcards, default: false
      
	    Boolean :workshop_scenarios, default: false
      Boolean :practice_exams, default: false
    end
  end
end

