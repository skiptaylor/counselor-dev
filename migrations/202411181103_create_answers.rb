Sequel.migration do
  change do
    create_table(:answers) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Text :body, lazy: false
      Text :response lazy: false
      
      Integer :value, default: 0
      
      Boolean :required, default: false
    end
  end
end
      
