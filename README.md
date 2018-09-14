# Workshop

Примеры использования
```ruby
client = Workshop::GeoBaseClient.new()
client.get_location("109.248.241.51", 'city, country')

=>
{
  :city => "Казань",
  :country => "RU"
}

client.get_location("109.248.241.51", 'city, foo')

=>
{
  :city => "Казань",
  :foo => ""
}

client.get_location("blah.248.241.51", 'city')

=>
{
  :city => ""
}
```
