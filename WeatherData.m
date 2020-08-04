#import "WeatherData.h"

@implementation WeatherData
-(id) initWithJSON:(NSData *)json {
  if(self = [super init]) {
    NSError *error;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if(error) {
      NSLog(@"NSJSONSerialization failed with error: %@", [error localizedDescription]);
      return self;
    }

    if([jsonObject isKindOfClass:[NSDictionary class]]) {
      id requestDictionary = [jsonObject objectForKey:@"request"];
      if([requestDictionary isKindOfClass:[NSDictionary class]]) {
        id type = [requestDictionary objectForKey:@"type"];
        if([type isKindOfClass:[NSString class]]) {
          _type = type;
        }

        id query = [requestDictionary objectForKey:@"query"];
        if([query isKindOfClass:[NSString class]]) {
          _query = query;
        }

        id language = [requestDictionary objectForKey:@"type"];
        if([language isKindOfClass:[NSString class]]) {
          _language = language;
        }

        id unit = [requestDictionary objectForKey:@"unit"];
        if([unit isKindOfClass:[NSString class]]) {
          _unit = unit;
        }
      }

      id locationDictionary = [jsonObject objectForKey:@"location"];
      if([locationDictionary isKindOfClass:[NSDictionary class]]) {
        id name = [locationDictionary objectForKey:@"name"];
        if([name isKindOfClass:[NSString class]]) {
          _name = name;
        }

        id country = [locationDictionary objectForKey:@"country"];
        if([country isKindOfClass:[NSString class]]) {
          _country = country;
        }

        id region = [locationDictionary objectForKey:@"region"];
        if([region isKindOfClass:[NSString class]]) {
          _region = region;
        }

        id lat = [locationDictionary objectForKey:@"lat"];
        if([lat isKindOfClass:[NSString class]]) {
          _lat = lat;
        }

        id lon = [locationDictionary objectForKey:@"lon"];
        if([lon isKindOfClass:[NSString class]]) {
          _lon = lon;
        }

        id timezone_id = [locationDictionary objectForKey:@"timezone_id"];
        if([timezone_id isKindOfClass:[NSString class]]) {
          _timezone_id = [timezone_id stringByReplacingOccurrencesOfString:@"\\" withString:@""];
        }

        id localtime = [locationDictionary objectForKey:@"localtime"];
        if([localtime isKindOfClass:[NSString class]]) {
          _localtime = localtime;
        }

        _localtime_epoch = [NSNumber numberWithInt:[[locationDictionary objectForKey:@"localtime_epoch"] intValue]];

        id utc_offset = [locationDictionary objectForKey:@"utc_offset"];
        if([utc_offset isKindOfClass:[NSString class]]) {
          _utc_offset = utc_offset;
        }
      }

      id currentDictionary = [jsonObject objectForKey:@"current"];
      if([currentDictionary isKindOfClass:[NSDictionary class]]) {
        id observation_time = [locationDictionary objectForKey:@"observation_time"];
        if([observation_time isKindOfClass:[NSString class]]) {
          _observation_time = observation_time;
        }

        _temperature = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"temperature"] intValue]];
        _weather_code = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"weather_code"] intValue]];

        id weather_icons = [currentDictionary objectForKey:@"weather_icons"];
        if([weather_icons isKindOfClass:[NSArray class]]) {
          _weather_icons = weather_icons;
        }

        id weather_descriptions = [currentDictionary objectForKey:@"weather_descriptions"];
        if([weather_descriptions isKindOfClass:[NSArray class]]) {
          _weather_descriptions = weather_descriptions;
        }

        _wind_speed = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"wind_speed"] intValue]];
        _wind_degree = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"weather_degree"] intValue]];

        id wind_dir = [currentDictionary objectForKey:@"wind_dir"];
        if([wind_dir isKindOfClass:[NSString class]]) {
          _wind_dir = wind_dir;
        }

        _pressure = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"pressure"] intValue]];
        _precip = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"precip"] intValue]];
        _humidity = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"humidity"] intValue]];
        _cloudcover = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"cloudcover"] intValue]];
        _feelslike = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"feelslike"] intValue]];
        _uv_index = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"uv_index"] intValue]];
        _visibility = [NSNumber numberWithInt:[[currentDictionary objectForKey:@"visibility"] intValue]];

        _visibility = [NSNumber numberWithBool:[[currentDictionary objectForKey:@"is_day"] boolValue]];
      }
    } else {
      NSLog(@"Data is not a Dictionary");
    }
  } return self;
}
@end
