Sequel.migration do
  change do
    create_table(:states) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      String  :name, :required => false
      String  :abbr, :required => false
    end
  end
end
  
