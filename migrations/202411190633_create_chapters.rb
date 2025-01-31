Sequel.migration do
  change do
    create_table(:chapters) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Text :chapter_number, default: ''
      Text :chapter_title, default: ''
      Text :sub_chapter_title, default: ''
      Text :body, default: ''
    end
  end
end
  
