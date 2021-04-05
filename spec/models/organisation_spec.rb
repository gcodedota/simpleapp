require 'spec_helper'

RSpec.describe Organisation, type: :model do
  subject {
    described_class.new(name: 'newOrganisation')
  }

  describe '.validation' do
    context 'when name is not unique' do
      before { described_class.create!(name: 'newOrganisation') }
      it {expect(subject).to be_invalid}
    end

    context 'when name is  unique' do
      before { described_class.create!(name: 'newOrganisation1') }
      it {expect(subject).to be_valid}
    end
  end
end
