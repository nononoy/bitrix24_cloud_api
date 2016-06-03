require 'spec_helper'

describe Bitrix24CloudApi::CRM do
  let(:class_name) { described_class::Deal }

  describe ".resource_path" do

    let(:class_name_with_module) { described_class::DEAL::Userfield }

    it "returns correct class name transform" do
      expect(class_name.resource_path).to eq "crm.deal"
      expect(class_name_with_module.resource_path).to eq "crm.deal.userfield"
    end
  end

  describe ".resource_url" do

    it "returns correct api endpoint" do
      expect(class_name.resource_url(@client, "list")).to eq "#{@client.api_endpoint}crm.deal.list.json"
    end
  end
end