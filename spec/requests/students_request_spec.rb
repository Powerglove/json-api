require 'spec_helper'
require 'rails_helper'


describe "Students", type: :request do
  describe 'GET /students/1' do
    it "shows the student with the id" do
       let(:student)
      FactoryGirl.create(:student)
      get "/students/#{}"
      expect(response.status).to eq(200)
    end

  end
end




# RSpec.describe 'Widgets API', type: :request do
#   describe 'GET /api/v1/widgets' do
#     get '/api/v1/widgets'
#     expect(response.status).to eq(200)
#   end
# end
#
#
# end
