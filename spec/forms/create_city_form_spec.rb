describe CreateCityForm do
  it 'valid' do
    expected_attributes = { name: 'London' }
    params = { name: 'London' }
    form = described_class.new(params)

    expect(form.valid?).to eq true
    expect(form.attributes).to eq(expected_attributes)
  end

  context 'invalid' do
    it 'name: presence' do
      params = { name: '' }
      form = described_class.new(params)

      expect(form.valid?).to eq false
      expect(form.errors[:name]).to include("can't be blank")
    end
  end
end
