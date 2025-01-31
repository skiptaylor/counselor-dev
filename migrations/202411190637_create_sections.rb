Sequel.migration do
  change do
    create_table(:sections) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Text :section_number, default: ''
      Text :section_title, default: ''
    end
  end
end
  
