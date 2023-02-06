# require 'rails_helper'

# RSpec.describe CompanyImporter do
#   subject { described_class.new.perform }

#   it "creates a company if it does not exist" do
#     Investment.insert(
#       {
#         company_name: "New company name",
#         company_external_id: 1,
#         investment_size: 1_000_000,
#         stage: "Series A",
#         investment_date: Date.parse("2022-01-01")
#       }
#     )

#     expect do
#       subject
#     end.to change {
#       Company.count
#     }.by(1)

#     company = Company.last
#     expect(company.name).to eq "New company name"
#   end

#   it "updates a company if it does exist" do
#     Company.create!(name: "Old name", external_id: 1)

#     Investment.insert(
#       {
#         company_name: "Updated name",
#         company_external_id: 1,
#         investment_size: 1_000_000,
#         stage: "Series A",
#         investment_date: Date.parse("2022-01-01")
#       }
#     )

#     expect do
#       subject
#     end.to_not change {
#       Company.count
#     }

#     company = Company.last
#     expect(company.name).to eq "Updated name"
#   end
# end


require 'rails_helper'
require 'factory_bot_rails'
RSpec.describe CompanyImporter, type: :job do
  describe "#perform" do
    it "updates the latest investment date and stage for each company" do
      company1 = create(:company, external_id: '123')
      company2 = create(:company, external_id: '456')

      investment1 = create(:investment, company: company1, investment_date: '2022-01-01', stage: 'seed')
      investment2 = create(:investment, company: company1, investment_date: '2022-02-01', stage: 'series_a')
      investment3 = create(:investment, company: company2, investment_date: '2022-03-01', stage: 'series_b')

      CompanyImporter.new.perform

      expect(Company.count).to eq(2)
      company1 = Company.find_by(external_id: '123')
      expect(company1.latest_investment_date).to eq(Date.parse('2022-02-01'))
      expect(company1.latest_investment_stage).to eq('series_a')
      company2 = Company.find_by(external_id: '456')
      expect(company2.latest_investment_date).to eq(Date.parse('2022-03-01'))
      expect(company2.latest_investment_stage).to eq('series_b')
    end
  end
end





