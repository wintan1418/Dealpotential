class AddCompanyIdToInvestments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :investments, :companies, column: :company_external_id
  end
end
