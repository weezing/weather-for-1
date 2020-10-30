describe CreateUserForm do
  it 'valid' do
    expected_attributes = {
      email: 'user@example.com',
      password: 'password'
    }
    params = {
      email: 'user@example.com',
      password: 'password',
      password_confirmation: 'password'
    }
    form = described_class.new(params)

    expect(form.valid?).to eq true
    expect(form.attributes).to eq(expected_attributes)
  end

  context 'invalid' do
    it 'email: presence' do
      params = {
        email: '',
        password: 'password',
        password_confirmation: 'password'
      }
      form = described_class.new(params)

      expect(form.valid?).to eq false
      expect(form.errors[:email]).to include("can't be blank")
    end

    it 'email: format' do
      params = {
        email: 'invalid@email',
        password: 'password',
        password_confirmation: 'password'
      }
      form = described_class.new(params)

      expect(form.valid?).to eq false
      expect(form.errors[:email]).to include('is invalid')
    end

    it 'email: uniqueness' do
      user = create(:user)

      params = {
        email: user.email,
        password: 'password',
        password_confirmation: 'password'
      }
      form = described_class.new(params)

      expect(form.valid?).to eq false
      expect(form.errors[:email]).to include('has already been taken')
    end

    it 'password: presence' do
      params = {
        email: Faker::Internet.safe_email,
        password: '',
        password_confirmation: 'password'
      }
      form = described_class.new(params)

      expect(form.valid?).to eq false
      expect(form.errors[:password]).to include("can't be blank")
    end

    it 'password: length' do
      params = {
        email: Faker::Internet.safe_email,
        password: 'pass',
        password_confirmation: 'pass'
      }
      form = described_class.new(params)

      expect(form.valid?).to eq false
      expect(form.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'password_confirmation: presence' do
      params = {
        email: Faker::Internet.safe_email,
        password: 'password',
        password_confirmation: ''
      }
      form = described_class.new(params)

      expect(form.valid?).to eq false
      expect(form.errors[:password_confirmation]).to include("can't be blank")
    end

    it 'password_confirmation: match password' do
      params = {
        email: Faker::Internet.safe_email,
        password: 'password',
        password_confirmation: 'wrongpassword'
      }
      form = described_class.new(params)

      expect(form.valid?).to eq false
      expect(form.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
end
