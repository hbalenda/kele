require 'spec_helper'

describe Kele do
  context "#get_me" do
    it "returns correct user data as a hash" do
      @kele_client = Kele.new("example@example.com", "password")
      expect(@kele_client.get_me['id']).to eq(2313271)
    end
  end
end
