require 'spec_helper'

describe Elmas::GoodsDeliveryLine do
  it "can initialize" do
    GoodsDeliveryLine = Elmas::GoodsDeliveryLine.new
    expect(GoodsDeliveryLine).to be_a(Elmas::GoodsDeliveryLine)
  end

  it "accepts attribute setter" do
    GoodsDeliveryLine = Elmas::GoodsDeliveryLine.new
    GoodsDeliveryLine.tracking_number = "9999 9999 9999"
    expect(GoodsDeliveryLine.tracking_number).to eq "9999 9999 9999"
  end

  it "returns value for getters" do
    GoodsDeliveryLine = Elmas::GoodsDeliveryLine.new({ tracking_number: "9999 9999 9999" })
    expect(GoodsDeliveryLine.tracking_number).to eq "9999 9999 9999"
  end

end
