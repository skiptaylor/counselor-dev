Sequel.migration do
  change do
    create_table(:senario_purchases) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
	    Date :purchase_date
    end
  end
end

