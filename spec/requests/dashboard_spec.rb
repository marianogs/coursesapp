require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/dashboard/index"
      expect(response).to have_http_status(:success)
    end
    before do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean
    end

    context 'we have at least one student registered in one course' do
      it "when user doesn't belongs to europe" do
        course =Course.create!(name: 'Example course',teacher: Teacher.create(name: 'example teacher'))
        student = Student.create!(name: 'example',country: "Argentina")
        CourseRegistration.create!(student: student,course: course)
        get "/dashboard/index"
        expect(response).to have_http_status(:success)
        expect(response.body).to match("Example course")
      end

      it 'when user belongs to europe' do
        course =Course.create!(name: 'Example course',teacher: Teacher.create(name: 'example teacher'))
        student = Student.create!(name: 'example',country: "Spain")
        CourseRegistration.create!(student: student,course: course)
        get "/dashboard/index"
        expect(response).to have_http_status(:success)
        expect(response.body).to match("REDACTED")
      end
    end
  end
end
