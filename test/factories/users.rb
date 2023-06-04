FactoryBot.define do
    factory :test_user, class: User do
      sequence(:email) { |n| "test#{n}@example.com" }
      encrypted_password { Devise::Encryptor.digest(User, 'password123') }
    end
  end
