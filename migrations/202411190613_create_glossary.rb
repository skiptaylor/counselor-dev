Sequel.migration do
  change do
    create_table(:glossaries) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Text :term, lazy: false
      Text :definition, lazy: false
      Text :short_def, default: 'Empty'
	
      String :exam
      String :chapter
    end
  end
end
