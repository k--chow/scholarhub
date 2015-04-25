json.array!(@scholars) do |scholar|
  json.extract! scholar, :id, :name, :email, :school
  json.url scholar_url(scholar, format: :json)
end
