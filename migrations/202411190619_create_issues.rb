Sequel.migration do
  change do
    create_table(:issues) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Text :name, default: ''
      Text :problem, default: ''
      Text :solution, default: ''
    end
  end
end