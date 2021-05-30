Sequel.migration do
  up do
    add_column :careers, :full_description, String, text: true
  end

  down do
    drop_column :careers, :full_description
  end
end

