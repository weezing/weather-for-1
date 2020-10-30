describe DestroyCityService do
  it 'destroys city' do
    city = create(:city)
    service = described_class.new(city)

    expect{ service.call }.to change(City, :count).by(-1)
  end
end
