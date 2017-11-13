json.extract! enrollment, :id, :student_id, :course_id, :percentage, :lettergrade, :created_at, :updated_at
json.url enrollment_url(enrollment, format: :json)
