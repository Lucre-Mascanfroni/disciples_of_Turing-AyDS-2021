Sequel.migration do
  up do
    create_table(:choices) do
      primary_key   :id
      foreign_key   :question_id, :questions
      String        :text
    end
  end

  down do
    drop_table(:choices)
  end
end

