Sequel.migration do
  change do
    create_table(:uses) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
	    Boolean :sample, default: false
      Boolean :certificate, default: false
  
      Date :cert_date
  
      String :cert_name, default: ""
    end
  end
end
