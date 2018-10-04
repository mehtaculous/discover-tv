require 'rails_helper'
require 'factories/user'

RSpec.describe User, type: :model do
  context "validation passes" do
    let!(:user) { FactoryBot.create(:user) }
    let(:random) { FactoryBot.build(:random_user) }

    it "ensures username is present" do
      random.username = "janedoe"
      expect(random.save).to eq(true)
    end

    it "ensures username is unique" do
      random.username = "janedoe"
      expect(random.save).to eq(true)
    end

    it "ensures email is unique" do
      random.email = "jane@gmail.com"
      expect(random.save).to eq(true)
    end
  end

  context "validation fails" do
    let!(:user) { FactoryBot.create(:user) }
    let(:random) { FactoryBot.build(:random_user) }

    it "ensures username is present" do
      random.username = ""
      expect(random.save).to eq(false)
    end

    it "ensures username is unique" do
      random.username = "johndoe"
      expect(random.save).to eq(false)
    end

    it "ensures email is unique" do
      random.email = "john@gmail.com"
      expect(random.save).to eq(false)
    end
  end
end
