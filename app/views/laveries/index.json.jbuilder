json.array!(@laveries) do |lavery|
  json.extract! lavery, :id, :laverie_id, :name, :nbmaxpers, :numtel, :numrue, :librue, :cdpost, :libville
  json.url lavery_url(lavery, format: :json)
end
