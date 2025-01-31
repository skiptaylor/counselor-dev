Sequel.migration do
  change do
    create_table(:scoretypes) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
	    String :type, default: 'Undefined'
  
      Integer :possible, default: 0
      Integer :correct,	default: 0
    end
  end
end

