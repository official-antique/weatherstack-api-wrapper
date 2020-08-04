#import "WeatherAPI.h"

@interface ViewController : UIViewController
@end

@implementation ViewController
-(void) viewDidLoad {
  [super viewDidLoad];

  [[WeatherAPI sharedInstance] fetchWeatherForLocation:/* CLLocation */ completion:^(WeatherData *weatherData) {
    NSLog(@"temp = %@", weatherData.temperature);
  } failure:^(NSError *) {
    NSLog(@"error = %@", error.localizedDescription);
  }];
}
@end
