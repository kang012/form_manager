class User < ApplicationRecord
  has_many :forms

  def authenticate(password)
    self.password == password
  end
end
