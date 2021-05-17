Sequel.migration do
  up do
    add_column :surveys, :created_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
    add_column :surveys, :updated_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
  end

  down do
    drop_column :surveys, :created_at
    drop_column :surveys, :updated_at
  end
end