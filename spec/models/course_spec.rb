require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'attributes' do
    it 'respond to name' do
      expect(Course.new).to respond_to(:name)
    end
  end


  describe 'validations' do
    context 'registration should be invalid if we already had two teachers in the same course' do
      let!(:course_a){ Course.create(name: "English A",teacher: teacher) } 
      let!(:course_b){ Course.create(name: "English B",teacher: teacher) } 
      let(:teacher) { Teacher.create!(name: "example 1",email: "example1@mail.com",country: "example") }

      it 'Teacher only can teach one course' do
        invalid_course = Course.new(name: "English C",teacher: teacher)
        expect(invalid_course.valid?).to be_falsey
        expect(invalid_course.errors[:base].join).to match("Max ammount of teaching courses reached")
      end
    end
  end
end
