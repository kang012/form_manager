class User < ApplicationRecord
  def authenticate(password)
    self.password == password
  end
end
