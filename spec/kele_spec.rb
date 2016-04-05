require 'spec_helper'

describe Kele do

  context "#initialize" do
    it "returns @auth_token as a string", vcr: {cassette_name: :initialize}  do
      @kele_client = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      expect(@kele_client.instance_variable_get(:@auth_token)).to be_a String
    end
  end

  context "#get_me" do
    it "returns correct ", vcr: {cassette_name: :get_me} do
      @kele_client = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = @kele_client.get_me
      expect(response.instance_variable_get(:@current_user)).to be_a Object
    end
  end

  context "#get_mentor_availability" do
    it "returns mentor availability", vcr: {cassette_name: :mentor_availability} do
      @kele_client = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = @kele_client.get_mentor_availability(623967)
      expect(response.instance_variable_get(:@mentor_availability)).to be_a Object
    end
  end

  context "#get_messages" do
    it "returns messages by page", vcr: {cassette_name: :get_messages} do
      @kele_client = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = @kele_client.get_messages(1)
      expect(response.instance_variable_get(:@messages)).to be_a Object
    end
  end

  context "roadmap module" do
    it "#get_roadmap returns roadmap", vcr: {cassette_name: :get_roadmap}do
      @kele_client = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = @kele_client.get_roadmap(31)
      expect(response.instance_variable_get(:@roadmap)).to be_a Object
    end

    it "#get_checkpoint returns checkpoint", vcr: {cassette_name: :get_checkpoint} do
      @kele_client = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = @kele_client.get_checkpoint(99)
      expect(response.instance_variable_get(:@checkpoint)).to be_a Object
    end
  end
end
