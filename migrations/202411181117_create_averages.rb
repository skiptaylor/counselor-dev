Sequel.migration do
  change do
    create_table(:averages) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Integer :score
    end
  end
end
