require 'spec_helper'

describe Elmas::Address do
  it "can initialize" do
    Address = Elmas::Address.new
    expect(Address).to be_a(Elmas::Address)
  end

  it "accepts attribute setter" do
    Address = Elmas::Address.new
    Address.address_line1 = "1600 Pennsylvania Ave."
    expect(Address.address_line1).to eq "1600 Pennsylvania Ave."
  end

  it "returns value for getters" do
    Address = Elmas::Address.new({ address_line1: "1600 Pennsylvania Ave." })
    expect(Address.address_line1).to eq "1600 Pennsylvania Ave."
  end

  it "crashes and burns when getting an unset attribute" do
    Address = Elmas::Address.new({ address_line1: "1600 Pennsylvania Ave."  })
    expect(Address.try(:birth_name)).to eq nil
  end

  it "does not allow to set an invalid attribute" do
    Address = Elmas::Address.new
    Address.airplane = "Boeing 777"
    expect(Address.airplaine).to eq nil
  end
end
