class CreateCityService
  def initialize(form, user)
    @form = form
    @user = user
  end

  def call
    return false unless @form.valid?

    create_city
  end

  private

  attr_reader :user

  def create_city
    user.cities.create(@form.attributes)
  end
end
