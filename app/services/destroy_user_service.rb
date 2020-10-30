class DestroyUserService
  def initialize(user)
    @user = user
  end

  def call
    destroy_user
  end

  private

  attr_reader :user

  def destroy_user
    user.destroy
  end
end
