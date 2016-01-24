json.array!(@topics) do |topic|
  json.extract! topic, :id, :title, :last_poster_id, :last_post_at, :tags, :forum_id, :user_id
  json.url topic_url(topic, format: :json)
end
