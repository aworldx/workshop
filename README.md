# Workshop
*** 1 задание
Примеры использования
```ruby
GeoClient.get_location("109.248.241.51")

=>
{
  :city => "Казань",
  :country => "RU"
}
```
*** 2 задание
```
weather --service meta_weather london

=> temperature: 18, weather_state: Heavy Cloud

weather --service open_weather moscow

=> temperature: 14, weather_state: Clouds

weather --service foo bobryisk

=> temperature: -999, weather_state: brrrrr
```
