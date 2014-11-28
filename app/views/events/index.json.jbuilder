json.array!(@events) do |event|
  json.extract! event, :id, :date, :user_id, :laundromat_id
  json.url event_url(event, format: :json)
end
