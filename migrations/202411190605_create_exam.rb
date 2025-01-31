Sequel.migration do
  change do
    create_table(:exams) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
	    Text :title, lazy: false
	    
      Boolean :sample, default: false
    end
  end
end

