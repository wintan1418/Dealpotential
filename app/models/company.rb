class Company < ApplicationRecord
    has_many :investments
  
    def latest_investment
      investments.order(investment_date: :desc).first
    end
  
    def latest_investment_date
      latest_investment&.investment_date
    end
  
    def latest_investment_stage
      latest_investment&.stage
    end
  end