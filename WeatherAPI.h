#import <CoreLocation/CoreLocation.h>
#import "WeatherData.h"

@interface WeatherAPI : NSObject
+(WeatherAPI *) sharedInstance;

-(void) fetchWeatherForLocation:(CLLocation *)location completion:(void(^)(WeatherData *weatherData))completion failure:(void(^)(NSError *error))failure;
@end
