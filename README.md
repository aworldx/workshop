# Workshop

Примеры использования
```ruby
GeoClient.get_location("109.248.241.51", 'city, country')

=>
{
  :city => "Казань",
  :country => "RU"
}

GeoClient.get_location("109.248.241.51", 'city, foo')

=>
{
  :city => "Казань",
  :foo => ""
}

GeoClient.get_location("blah.248.241.51", 'city')

=>
{
  :city => ""
}
```
