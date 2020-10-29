class CreateUserEmailUniquenessValidator < ActiveModel::Validator
  def validate(record)
    if User.where(email: record.email).present?
      record.errors[:email] << 'has already been taken'
    end
  end
end
