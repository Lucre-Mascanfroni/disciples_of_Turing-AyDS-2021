# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:administrators) do
      primary_key   :id
      String        :username
      String        :password
      DateTime      :created_at,   default: Sequel::CURRENT_TIMESTAMP
      DateTime      :updated_at,   default: Sequel::CURRENT_TIMESTAMP
    end
  end

  down do
    drop_table(:administrators)
  end
end
