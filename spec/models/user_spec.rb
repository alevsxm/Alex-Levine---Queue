require 'rails_helper'

describe User do
  let(:hari) { User.new( username: "superman",
                          first_name: "Hari",
                          last_name: "Mohanraj",
                          email: "hari@gmail.com",
                          password: "hunter2",
                          password_confirmation: "hunter2")}

  it "is valid with a username, first_name, last_name, email, and password" do
    expect(hari).to be_valid
  end
end
