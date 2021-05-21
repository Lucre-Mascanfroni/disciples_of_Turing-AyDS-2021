Sequel.migration do
  up do
    drop_table(:lessons)
  end
  
  down do
    create_table(:lessons) do
      primary_key   :id
      String        :name
      String        :description
    end
  end
end
