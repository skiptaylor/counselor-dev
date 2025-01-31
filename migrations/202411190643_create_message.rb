Sequel.migration do
  change do
    create_table(:messages) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Text :body, default: ''
  
      Boolean :casestudies, default: false
      Boolean :nce, default: false
      Boolean :profile, default: false
    end
  end
end
  
  