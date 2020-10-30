require 'rails_helper'

describe DestroyUserService do
  it 'destroys user and his cities' do
    user = create(:user)
    create(:city, user: user)
    service = described_class.new(user)

    expect{ service.call }.to change(User, :count).by(-1)
      .and change(City, :count).by(-1)
  end
end
