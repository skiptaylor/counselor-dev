Sequel.migration do
  change do
    create_table(:casescores) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
  
      Integer :correct, default: 0
      Integer :casequestion_id, default: 0
      
      String :domain
      String :set
    end
  end
end


