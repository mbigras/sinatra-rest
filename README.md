# Sinatra REST

> Quickly build a JSON server to play with


## Usage Examples

```
bundle exec ruby app.rb -p 9393
```

```
curl -X POST -H "Content-Type: application/json" -d '{
  "id": 104,
  "title": "lala",
  "body": "lala"
}' 'http://localhost:9393/notes'
curl -X GET 'http://localhost:9393/notes'
curl -X GET 'http://localhost:9393/notes/104'
curl -X PUT -H 'Content-Type: application/json' -d '{"body":"cats and"}' 'http://localhost:9393/notes/104'
curl -X DELETE -H 'Content-Type: application/json' 'http://localhost:9393/notes/104'
```