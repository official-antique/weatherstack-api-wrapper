#import "WeatherAPI.h"

@implementation WeatherAPI
+(WeatherAPI *) sharedInstance {
  static WeatherAPI *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[WeatherAPI alloc] init];
  });
  return sharedInstance;
}

-(void) fetchWeatherForLocation:(CLLocation *)location completion:(void(^)(WeatherData *weatherData))completion failure:(void(^)(NSError *error))failure {
  float latitude = location.coordinate.latitude;
  float longitude = location.coordinate.longitude;

  NSString *urlString = [NSString stringWithFormat:@"http://api.weatherstack.com/current?access_key=%@&query=%f,%f&units=%@", @"API_KEY", latitude, longitude, @"MEASUREMENT (f/m/s)"];

  NSURLSession *session = [NSURLSession sharedSession];
  NSURL *url = [NSURL URLWithString:urlString];

  [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if(error) {
      failure(error);
    } else {
      WeatherData *weather = [[WeatherData alloc] initWithJSON:data];
      completion(weather);
    }
  }] resume];
}
@end
