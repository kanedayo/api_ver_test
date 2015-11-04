json.array!(@data) do |datum|
  json.extract! datum, :id, :title, :category_id
  json.url datum_url(datum, format: :json)
end
