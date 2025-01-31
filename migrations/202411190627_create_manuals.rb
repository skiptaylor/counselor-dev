Sequel.migration do
  change do
    create_table(:manuals) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Text :name, default: ''
      Text :title_page, default: ''
      Text :version, default: ''
      Text :isbn, default: ''
  
      Boolean :ncmhce, default: false
      Boolean :nce, default: false
      Boolean :ceu, default: false
    end
  end
end
  
