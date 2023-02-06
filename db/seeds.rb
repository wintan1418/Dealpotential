# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
counter = 1
10.times do |i|
  company = Company.create(
    name: "Company #{i}",
    external_id: counter,
    latest_investment_stage: nil,
    latest_investment_date: nil
  )

  investment_dates = [Time.now - 1.week, Time.now - 2.weeks, Time.now - 3.weeks]
  10.times do |j|
    Investment.create(
      company_name: company.name,
      company_external_id: company.external_id,
      investment_size: j,
      stage: "Stage #{j}",
      investment_date: investment_dates[j % 3]
    )
  end

  # Update the company with the latest investment information
   # Update the company with the latest investment information
   latest_investment = company.investments.order(investment_date: :desc).first
   if latest_investment
     company.update(latest_investment_date: latest_investment.investment_date, latest_investment_stage: latest_investment.stage)
   end
 
  counter += 1
end



  