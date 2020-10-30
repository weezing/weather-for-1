describe CreateCityService do
  it 'call: create city' do
    user = create(:user)
    form = double(
      valid?: true,
      attributes: {
        name: Faker::Address.city
      }
    )

    service = described_class.new(form, user)
    expect { service.call }.to change(City, :count).by(1)
    expect(City.last.user_id).to eq(user.id)
  end

  it 'invalid form' do
    user = create(:user)
    form = double(
      valid?: false
    )

    service = described_class.new(form, user)
    expect(service.call).to eq(false)
    expect { service.call }.to change(City, :count).by(0)
  end
end
