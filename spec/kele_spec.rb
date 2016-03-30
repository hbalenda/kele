require 'spec_helper'

describe Kele do
  before do
    @kele_client = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
  end

  context "#get_me" do
    it "returns correct user data as a hash" do
      expect(@kele_client.get_me['id']).to eq(2313271)
    end
  end

  context "#get_mentor_availability" do
    it "returns mentor availability as an array of hashes" do
      @mentor_availability = @kele_client.get_mentor_availability(623967)
      expect(@mentor_availability.first['id']).to eq(15183)
    end
  end
end
