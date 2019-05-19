class User < ApplicationRecord
  has_many :forms
  has_many :answered_forms

  def authenticate(password)
    self.password == password
  end
end
