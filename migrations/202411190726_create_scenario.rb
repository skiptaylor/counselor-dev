Sequel.migration do
  change do
    create_table(:scenarios) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Text :title, lazy: false
      Text :body, lazy: false
      Text :references, lazy: false
      	
      Boolean :active, default: true
      Boolean :sample, default: false
      Boolean :workshop, default: false
      Boolean :practice, default: false
    end
  end
end


