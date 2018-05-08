require 'sinatra'

DB = 'db.json'

get '/notes' do
  File.read(DB)
end

get '/notes/:id' do
  db = JSON.parse(File.read(DB))
  note = db['notes'].find { |n| n['id'] == params['id'].to_i }
  note.to_json
end

post '/notes' do
  db = JSON.parse(File.read(DB))
  note = JSON.parse(request.body.read)
  db['notes'].push(note)
  File.write(DB, JSON.pretty_generate(db))
  note.to_json
end

put '/notes/:id' do
  db = JSON.parse(File.read(DB))
  note = JSON.parse(request.body.read)
  db['notes'].find { |n| n['id'] == params['id'].to_i }.merge!(note)
  File.write(DB, JSON.pretty_generate(db))
  note.to_json
end

delete '/notes/:id' do
  db = JSON.parse(File.read(DB))
  note = db['notes'].find { |n| n['id'] == params['id'].to_i }
  db['notes'].delete(note)
  File.write(DB, JSON.pretty_generate(db))
end