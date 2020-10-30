class CreateCityForm
  include ActiveModel::Model

  attr_accessor :name

  validates :name, presence: true

  def attributes
    { name: name }
  end
end
