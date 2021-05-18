Sequel.migration do
    up do
      add_column :responses, :created_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
      add_column :responses, :updated_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
    end
  
    down do
      drop_column :responses, :created_at
      drop_column :responses, :updated_at
    end
  end