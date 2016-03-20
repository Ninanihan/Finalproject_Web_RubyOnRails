json.array!(@products) do |product|
  json.extract! product, :id, :imageurl, :age, :breeds, :city, :father, :mother, :injectionurl, :health, :price, :gender, :user_id, :user_email
  json.url product_url(product, format: :json)
end
