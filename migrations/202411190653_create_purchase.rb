Sequel.migration do
  change do
    create_table(:purchases) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      String :package
      String :options
      String :options2
      String :hard_copy
      String :nce_hard_copy
      String :stripe_id
      String :address1
      String :address2
      String :city
      String :state
      String :zip
      String :tracking_number
  
      Float :amount

      Date :shipped_on
      Date :received_on
    end
  end
end

