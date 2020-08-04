@interface WeatherData : NSObject
// REQUEST
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *query;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *unit;

// LOCATION
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) NSString *timezone_id;
@property (nonatomic, strong) NSString *localtime;
@property (nonatomic, strong) NSString *localtime_epoch;
@property (nonatomic, strong) NSString *utc_offset;

// CURRENT
@property (nonatomic, strong) NSString *observation_time;
@property (nonatomic, strong) NSString *temperature;
@property (nonatomic, strong) NSString *weather_code;
@property (nonatomic, strong) NSArray <NSString *> *weather_icons;
@property (nonatomic, strong) NSArray <NSString *> *weather_descriptions;

@property (nonatomic, strong) NSNumber *wind_speed;
@property (nonatomic, strong) NSNumber *wind_degree;
@property (nonatomic, strong) NSNumber *wind_dir;
@property (nonatomic, strong) NSNumber *pressure;
@property (nonatomic, strong) NSNumber *precip;
@property (nonatomic, strong) NSNumber *humidity;
@property (nonatomic, strong) NSNumber *cloudcover;
@property (nonatomic, strong) NSNumber *feelslike;
@property (nonatomic, strong) NSNumber *uv_index;
@property (nonatomic, strong) NSNumber *visibility;

@property (nonatomic, assign) BOOL is_day;

-(id) initWithJSON:(NSData *)json;
@end
