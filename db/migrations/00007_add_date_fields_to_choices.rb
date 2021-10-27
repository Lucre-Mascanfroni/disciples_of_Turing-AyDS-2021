# frozen_string_literal: true

Sequel.migration do
  up do
    add_column :choices, :created_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
    add_column :choices, :updated_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
  end

  down do
    drop_column :choices, :created_at
    drop_column :choices, :updated_at
  end
end
