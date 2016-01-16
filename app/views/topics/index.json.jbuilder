json.array!(@topics) do |topic|
  json.extract! topic, :id, :name, :last_poster_id, :last_post_at
  json.url topic_url(topic, format: :json)
end
