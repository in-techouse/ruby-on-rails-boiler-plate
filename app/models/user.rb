class User < ApplicationRecord
  extend Devise::Models

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User
end
