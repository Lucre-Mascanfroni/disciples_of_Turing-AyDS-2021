# frozen_string_literal: true

Sequel.migration do
  up do
    add_column :questions, :created_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
    add_column :questions, :updated_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
  end

  down do
    drop_column :questions, :created_at
    drop_column :questions, :updated_at
  end
end
