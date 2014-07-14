require 'rails_helper'

describe User do
  let(:hari) { User.create!( username: "superman",
                          first_name: "Hari",
                          last_name: "Mohanraj",
                          email: "hari@gmail.com",
                          password: "hunter2",
                          password_confirmation: "hunter2",
                          id: 2 )}
  let(:alex) { User.create!( username: "batman",
                          first_name: "Alex",
                          last_name: "Levine",
                          email: "alex@gmail.com",
                          password: "hello",
                          password_confirmation: "hello",
                          id: 1 )}

  it "is valid with a username, first_name, last_name, email, and password" do
    expect(hari).to be_valid
  end

  describe "user ratings" do
    it "calculates the average of the user's given recommendations" do
      BookRecommendation.create!( {title: "grapes of wrath", recommendee: alex,
        recommendor: hari, user_rating: 4} )
      MovieRecommendation.create!( {title: "bobo the clown", recommendee: alex,
        recommendor: hari, user_rating: 7} )
      MovieRecommendation.create!( {title: "bobo the clown", recommendee: alex,
          recommendor: hari, user_rating: 3} )
      expect(hari.avg_rating).to eq 4.7
    end

    it "returns nil if the user has no recommendations with ratings" do
      expect(hari.avg_rating).to eq 0
    end
  end



end
