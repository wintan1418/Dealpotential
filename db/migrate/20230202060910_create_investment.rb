class CreateInvestment < ActiveRecord::Migration[7.0]
  def change
    create_table :investments do |t|
      t.string :company_name
      t.integer :company_external_id
      t.integer :investment_size
      t.string :stage
      t.date :investment_date
      
    end
  end
end
