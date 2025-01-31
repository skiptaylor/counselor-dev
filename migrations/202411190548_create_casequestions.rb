Sequel.migration do
  change do
    create_table(:casequestions) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Integer :number     
      Integer :part       	
      Integer :position   
  	
      Text :body, default: ''
      Text :domain, default: ''
      Text :sub_domain, default: ''
      Text :discussion, default: ''
    end
  end
end


