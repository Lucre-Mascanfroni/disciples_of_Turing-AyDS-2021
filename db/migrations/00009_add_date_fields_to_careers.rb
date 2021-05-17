Sequel.migration do
  up do
    add_column :careers, :created_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
    add_column :careers, :updated_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
  end

  down do
    drop_column :careers, :created_at
    drop_column :careers, :updated_at
  end
end