json.array!(@breeders) do |breeder|
  json.extract! breeder, :id, :name, :imageurl, :age, :breeds, :city, :father, :mother, :injectionurl, :health, :gender, :user_id, :user_email
  json.url breeder_url(breeder, format: :json)
end
