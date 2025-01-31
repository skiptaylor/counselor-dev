Sequel.migration do
  change do
    create_table(:questions) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Text :body,, lazy: false
      Text :notes, lazy: false
	
      String :score_type
      String :score_type2
	
      Boolean :countable, default: true
	
      Integer :position
    end
  end
end

