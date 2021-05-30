class Course < ApplicationRecord
  has_many :course_registrations
  has_many :students,class_name: "Student", through: :course_registrations,foreign_key: 'student_id'
  belongs_to :teacher, class_name: 'Teacher',foreign_key: 'teacher_id'
  validate :check_teacher_teaching_courses

  MAX_STUDENTS = 30

  def check_teacher_teaching_courses
    if teacher && Course.where(teacher: teacher).count >= 2
      self.errors.add(:base, "Max ammount of teaching courses reached")
    else
      true
    end
  end
end
