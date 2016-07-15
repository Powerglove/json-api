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
      it "returns correct status code" do
        params = {name: 'Dan'}
        put "/students/#{student.id}", { student: params }
      
         expect { put "/students/#{student.id}" }.to change { student_params }.to("Dan")
      
      end

     # it "updates correctly" do
     # end
    end
  end

  describe "POST 'create'" do
    let(:student_params) { FactoryGirl.attributes_for(:student) }

    it "returns correct status code" do 
      post "/students", { student: student_params }
      expect(assigns[:student]).to be_present # checks if the controller has an instance variable named @student assigned but we do not do this in request spesc
      # because instance vars are "implementation details" not relevant for request "result"
      expect(response.status).to eq(201)
    end

    it "creates new student" do
      expect { post "/students", { student: student_params }  }.to change{ Student.count }.by(1)
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
