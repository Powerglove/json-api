require 'rails_helper'


RSpec.describe StudentsController, type: :request do

  context 'with student present' do
  let(:student) {  FactoryGirl.create :student }

    describe "GET /students/:id" do
      it "finds student by id" do

        get "/students/#{student.id}.json"
        expect(response.status).to eq(200)
      end

      it "renders JSON by default" do
        get "/students/#{student.id}"
        expected = ActiveSupport::JSON.decode(student.to_json)
        parsed_response = ActiveSupport::JSON.decode(response.body)
        expect(parsed_response).to eql expected
      end
    end

    describe "PUT 'update'" do
      let(:update_params) { {name: "Stan"} }

      it "updates student with the given params" do
      expect { put "/students/#{student.id}", { student: update_params }  }.to change{ student.reload.name }.from("John").to("Stan")
      end
    end

    describe "DELETE 'destroy'" do
      let!(:student) {  FactoryGirl.create :student }

      it "deletes an existing student" do
        expect { delete "/students/#{student.id}" }.to change{ Student.count }.by(-1)
      end
    end

  end

  describe "POST 'create'" do
    let(:create_params) { FactoryGirl.attributes_for(:student) }

    it "returns correct status code" do
      post "/students", { student: create_params }
      expect(assigns[:student]).to be_present # checks if the controller has an instance variable named @student assigned but we do not do this in request spesc
      # because instance vars are "implementation details" not relevant for request "result"
      expect(response.status).to eq(201)
    end

    it "creates new student" do
      expect { post "/students", { student: create_params }  }.to change{ Student.count }.by(1)
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
