require 'rails_helper'

#RSpec.describe Datum, type: :model do
RSpec.describe "Data", type: :request do
  describe " GET /data/index.json" do
    before { @data = FactoryGirl.create_list(:datum, 2) }

    it "get Index" do

      # GET
      get data_path format: :json

      # Check status
      expect(response.status).to eq 200

      # Check body
      json = JSON.parse(response.body)
      expect(json.size    ).to eq @data.count
      expect(json[0]["id"]).to eq @data[0].id
      expect(json[1]["id"]).to eq @data[1].id
    end
  end # describe
end
