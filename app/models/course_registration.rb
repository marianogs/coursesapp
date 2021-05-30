class CourseRegistration < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validate :check_max_students

  before_create :notificate_teacher

  def notificate_teacher
    Rails.logger.info("Hi #{course.teacher.name}, #{student.name} just joined your course_name course!")
  end

  def check_max_students
    if course.students.count >= 30
      errors.add(:base,"Max ammount of students reached")
    else
      true
    end
  end
end
