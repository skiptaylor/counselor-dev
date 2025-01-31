Sequel.migration do
  change do
    create_table(:taxes) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      String :zip
      
      Float :rate
    end
  end
end

