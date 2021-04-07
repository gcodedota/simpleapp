require 'rails_helper'

RSpec.describe UserMailer, :type => :mailer do
  describe 'notify' do
    let(:user) {
      Employee.create(
        fname: 'firstName',
        lname: 'lastName',
        email: 'email@email.com',
        birthday: Time.current,
        organisation: organisation,
        password: '213123123'
    )}
    let(:mail) { UserMailer.welcome_email(user) }

    # it 'renders the headers' do
    #   # expect(mail.subject).to eq('Signup')
    #   # expect(mail.to).to eq(['to@example.org'])
    #   # expect(mail.from).to eq(['from@example.com'])
    #   puts mail.subject
    #   puts mail.to
    #   puts mail.from
    # end

    it 'renders the body' do
      puts mail.body
    end
  end
end