Sequel.migration do
  change do
    create_table(:scores) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
	    Integer :value, default: 0
	
      String :score_type,	default: 'Undefined'
      String :score_type2,default: 'Undefined'
	
      Boolean :countable, default: true
	    Boolean :required, default: false
    end
  end
end

