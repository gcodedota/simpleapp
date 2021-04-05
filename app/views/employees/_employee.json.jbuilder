json.extract! employee, :id, :organisation_id, :fname, :lname, :email, :password, :birthday, :role, :created_at, :updated_at
json.url employee_url(employee, format: :json)
