# Discal
Gets the distance between two points

Sample code for a gem.

For using the API:
1 - Create an account and get an API Key at: https://www.bingmapsportal.com
2 - Put the API key at the file: key.txt

Documentation for the API: https://docs.microsoft.com/en-us/bingmaps/rest-services/routes/calculate-a-distance-matrix

### Example
```
lat1 = 39.06546
lat2 = 33.06546
lat3 = 21.06546
lng1 = -104.88544
lng2 = -104.80
lng3 = -103.80

coordinates = [[lat1, lng1], [lat2, lng2], [lat3, lng3], [lat2, lng2]]

d = Discal.new(coordinates)
d.calculate_distance_with_math
d.calculate_distance_with_api # should use simple internal cache if the points were already evaluated
```
