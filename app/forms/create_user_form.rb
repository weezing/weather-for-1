class CreateUserForm
  include ActiveModel::Model

  attr_accessor(
    :email,
    :password,
    :password_confirmation
  )

  validates :email, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: { case_sensitive: true }
  validates :password_confirmation, presence: true

  validates_with CreateUserEmailUniquenessValidator

  def attributes
    {
      email: email,
      password: password
    }
  end
end
