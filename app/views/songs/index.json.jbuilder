json.array! @songs do |song|
  json.id song.id
  json.name song.name
  json.last_sang_at song.last_sang_at
  json.created_at song.created_at
  json.updated_at song.updated_at
  json.pinned_at song.pinned_at
  json.artist_name song.api_artist_name
end
