json.array!(@laundromats) do |laundromat|
  json.extract! laundromat, :id, :name, :capacity, :phone, :nbstreet, :libstreet, :zipcode, :libcity
  json.url laundromat_url(laundromat, format: :json)
end
