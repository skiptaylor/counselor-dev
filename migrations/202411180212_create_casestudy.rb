Sequel.migration do
  change do
    create_table(:casestudies) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Text :title, default: ''
      Text :set, default: ''  
	
      Text :number, default: ''
      Text :name, default: ''
      Text :age, default: ''
      Text :sex, default: ''
      Text :gender, default: ''
      Text :sexuality, default: ''
      Text :ethnicity, default: ''
      Text :relationship, default: ''
      Text :setting, default: ''
      Text :types, default: ''
      Text :problem, default: ''
      Text :diagnosis, default: ''
      Text :resources, default: ''
    
      Boolean :active, default: false
      Boolean :sample, default: false
    end
  end
end
  

