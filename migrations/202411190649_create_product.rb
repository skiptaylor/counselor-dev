Sequel.migration do
  change do
    create_table(:products) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      String :name
      String :package
  
      Float :amount
    end
  end
end  
	
