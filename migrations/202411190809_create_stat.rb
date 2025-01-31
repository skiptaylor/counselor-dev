Sequel.migration do
  change do
    create_table(:stats) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
	    String :name
	    
      Integer :content, default: 0
    end
  end
end

