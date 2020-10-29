class CreateUserService
  attr_reader :user

  def initialize(form)
    @form = form
  end

  def call
    return false unless @form.valid?

    create_user
  end

  private

  def create_user
    @user = User.create(@form.attributes)
  end
end
