describe CreateUserService do
  it 'call: create user' do
    form = double(
      valid?: true,
      attributes: {
        email: Faker::Internet.safe_email,
        password: 'password'
      }
    )

    service = described_class.new(form)
    expect { service.call }.to change(User, :count).by(1)
  end

  it 'invalid form' do
    form = double(
      valid?: false
    )

    service = described_class.new(form)
    expect(service.call).to eq(false)
    expect { service.call }.to change(User, :count).by(0)
  end
end
