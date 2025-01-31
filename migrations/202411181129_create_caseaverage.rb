Sequel.migration do
  change do
    create_table(:caseaverages) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Integer :score
      Integer :title

      String :set
    end 
  end
end