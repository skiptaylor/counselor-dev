Sequel.migration do
  change do
    create_table(:charts) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Integer :position
  
      Text :part, default: ''	
      Text :title, default: ''
      Text :body, default: ''
    end
  end
end
  
