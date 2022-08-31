require 'spec_helper'

describe Elmas::SalesInvoiceLine do
  it "can initialize" do
    sales_invoice_line = Elmas::SalesInvoiceLine.new
    expect(sales_invoice_line).to be_a(Elmas::SalesInvoiceLine)
  end

  it "is not valid without certain attributes" do
    sales_invoice_line = Elmas::SalesInvoiceLine.new
    expect(sales_invoice_line.valid?).to eq(false)
  end

  it "is valid with certain attributes" do
    sales_invoice_line = Elmas::SalesInvoiceLine.new(invoice_ID:"627362", item: "23873")
    expect(sales_invoice_line.valid?).to eq(true)
  end

  let(:resource) { Elmas::SalesInvoiceLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", item: "22") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceLines?$filter=Item eq '22'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item, :id])
    end

    it "should apply greater-than filters" do
      resource = Elmas::SalesInvoiceLine.new(net_price: { gt: 5 })
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceLines?$filter=NetPrice gt 5")
      resource.find_by(filters: [:net_price])
    end

    it "should apply less-than filters" do
      resource = Elmas::SalesInvoiceLine.new(net_price: { lt: 5 })
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceLines?$filter=NetPrice lt 5")
      resource.find_by(filters: [:net_price])
    end
  end
end
