class AddExternalIdUniqueIndexForCompanies < ActiveRecord::Migration[7.0]
  def change
    add_index :companies, :external_id, unique: true
  end
end
