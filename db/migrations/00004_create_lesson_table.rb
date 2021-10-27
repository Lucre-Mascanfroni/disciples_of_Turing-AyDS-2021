# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:lessons) do
      primary_key   :id
      String        :name
      String        :description
    end
  end

  down do
    drop_table(:lessons)
  end
end
