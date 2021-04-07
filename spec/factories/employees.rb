FactoryBot.define do
  factory :employee do
    fname { 'firstName' }
    lname { 'lastName' }
    email { 'email@email.com' }
    birthday { Time.current }
    organisation { association :organisation }
    password { '12345' }
    transient do
      roles { 'system' }
      status {'activated'}
    end
  end
end