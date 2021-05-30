require 'rails_helper'

RSpec.describe CourseRegistration, type: :model do
  it 'allows to register new student' do
    Student.create(name: "Mariano")
    Course.create!(name: "Mariano course",teacher: Teacher.create(name: 'example'))
    expect(CourseRegistration.create!(student: Student.first, course: Course.first)).to be_truthy
  end
end
