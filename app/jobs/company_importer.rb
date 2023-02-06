class CompanyImporter
  def perform
    Investment.find_in_batches do |investments|
      companies = {}

      investments.each do |investment|
        external_id = investment.company_external_id

        if companies.has_key?(external_id)
          company = companies[external_id]
          if investment.investment_date > company[:latest_investment_date]
            company[:latest_investment_date] = investment.investment_date
            company[:latest_investment_stage] = investment.stage
          end
        else
          companies[external_id] = {
            external_id: external_id,
            name: investment.company_name,
            latest_investment_date: investment.investment_date,
            latest_investment_stage: investment.stage
          }
        end
      end

      Company.upsert_all(companies.values, unique_by: :external_id)
    end
  end
end
