require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:user) { User.create(name: 'test', email: 'test@test.com', password: 'password') }
  let(:image_path) { Rails.root.join('public', 'images', 'ani-kolleshi.jpg') }
  let(:image_file) { File.open(image_path) }
  let(:doctor_with_image) do
    doctor = Doctor.new(
      name: 'doc1',
      bio: 'doc from kenya',
      user:
    )
    doctor.image.attach(io: image_file, filename: 'ani-kolleshi.jpg', content_type: 'image/jpeg')
    doctor
  end

  describe 'validations' do
    before do
      @location = doctor_with_image.build_location(
        address: '1333 Main Street',
        city: 'San Fransisco',
        state: 'State',
        zip_code: 56_789
      )
    end
    it 'is valid' do
      expect(@location).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to doctor' do
      association = described_class.reflect_on_association(:doctor)
      expect(association.macro).to eq :belongs_to
    end
  end
end