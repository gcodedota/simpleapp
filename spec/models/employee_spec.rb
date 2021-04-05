require 'spec_helper'

RSpec.describe Employee, type: :model do

  let(:organisation) { Organisation.create(:name => 'organisationName') }
  subject {
    described_class.new(
      fname: "firstName",
      lname: "lastName",
      email: "email@email.com",
      birthday: Time.current,
      organisation: organisation,
      password: "213123123"
    )
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
