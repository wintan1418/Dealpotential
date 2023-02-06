class CreateCompany < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :external_id
      t.string :latest_investment_stage
      t.date :latest_investment_date

      t.timestamps
    end
  end
end
