# frozen_string_literal: true

Sequel.migration do
  up do
    drop_table(:posts)
  end

  down do
    create_table(:posts) do
      primary_key   :id
      String        :description
    end
  end
end
