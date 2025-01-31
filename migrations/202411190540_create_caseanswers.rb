Sequel.migration do
  change do
    create_table(:caseanswers) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Text :position, default: ''
      Text :body, default: ''
      Text :correct, default: false
    end
  end
end

