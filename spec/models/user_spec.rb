require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "Is created with a password and password_confirmation" do
      new_user = User.create(password: "abcdefg", password_confirmation: "abcdefg")
      expect(new_user.persisted?).to be(true)
    end
    it "Password and password_confirmation match" do
      new_user = User.create(password: "abcdefg", password_confirmation: "abcdefg")
      expect(new_user.password).to be(new_user.password_confirmation)
    end
    it "Is created with a name, and email" do
      new_user = User.create(first_name: "Graeme", last_name: "Chalmers", email:"chalmers.graeme@gmail.com", password: "abcdefg", password_confirmation: "abcdefgh")
      expect(new_user.persisted?).to be(true)
    end
  end
end
