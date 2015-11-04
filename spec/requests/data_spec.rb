require 'rails_helper'

RSpec.describe "[Data]", type: :request do

  describe "[一覧]" do
    before do
      @data = FactoryGirl.create_list(:datum, 2)
      get data_path format: :json
    end
    it "GET /data.json" do
      # Check status
      expect(response).to have_http_status(200)

      # Check body
      json = JSON.parse(response.body)
      expect(json.size    ).to eq @data.count
      expect(json[0]["id"]).to eq @data[0].id
      expect(json[1]["id"]).to eq @data[1].id
    end
  end

  describe "表示" do
    before do
      @datum = FactoryGirl.create(:datum)
      get datum_path @datum, format: :json
    end
    it "GET /data/:id.json" do
      # Chcck status
      expect(response).to have_http_status(200)

      # Check body
      json = JSON.parse(response.body)
      expect(json["id"]         ).to eq @datum.id
      expect(json["category_id"]).to eq @datum.category_id
    end
  end

  describe "[新規/更新/削除]" do
    before  do
      @params = { datum: FactoryGirl.attributes_for(:datum) }
      # post data_path(format: :json), @params
      expect {
        post data_path(format: :json), @params
      }.to change { Datum.count }.by 1
    end
    it "POST /data.json" do
      expect(response).to have_http_status(201)

      json = JSON.parse(response.body)
      expect(json['id']).to eq 1
      expect(json['category_id']).to eq @params[:datum][:category_id]
      expect(response.location).to eq datum_url(Datum.last)
    end
    it "PATCH /data/:id.json" do
      params = { format: :json, datum: {category_id: 999} }
      patch datum_path(Datum.last, params)
      #patch datum_path(Datum.last, format: :json, datum:{category_id: 999})
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['id']).to eq 1
      expect(json['category_id']).to eq params[:datum][:category_id]
      expect(response.location).to eq datum_url(Datum.last)
    end
    it "DELETE /data/:id.json" do
      expect {
        delete datum_path(Datum.last, format: :json)
      }.to change { Datum.count }.by(-1)
      expect(response).to have_http_status(204)
    end
  end

end
