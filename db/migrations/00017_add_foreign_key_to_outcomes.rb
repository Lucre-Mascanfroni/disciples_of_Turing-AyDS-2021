# frozen_string_literal: true

Sequel.migration do
  up do
    alter_table(:outcomes) do
      add_foreign_key :career_id, :careers
    end
  end

  down do
    alter_table(:outcomes) do
      drop_foreign_key :career_id
    end
  end
end
