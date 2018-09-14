# Workshop

Примеры использования
```ruby
Workshop::GeoBaseClient.get_location("109.248.241.51", 'city, country')

=>
{
  :city => "Казань",
  :country => "RU"
}

Workshop::GeoBaseClient.get_location("109.248.241.51", 'city, foo')

=>
{
  :city => "Казань",
  :foo => ""
}

Workshop::GeoBaseClient.get_location("blah.248.241.51", 'city')

=>
{
  :city => ""
}
```
