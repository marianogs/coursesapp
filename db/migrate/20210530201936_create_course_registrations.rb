class CreateCourseRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :course_registrations do |t|
      t.references :student
      t.references :course

      t.timestamps
    end
  end
end
