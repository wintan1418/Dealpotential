FactoryBot.define do
    factory :investment, class: Investment do
      company_external_id { '123' }
      investment_date { '2022-01-01' }
      stage { 'seed' }
    end

    factory :company, class: Company do
        external_id { '123' }
        latest_investment_date { '2022-01-01' }
        latest_investment_stage { 'seed' }
    end

  end
  