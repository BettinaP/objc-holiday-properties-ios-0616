//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    return [self.database[season] allKeys];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSMutableArray *supplies =[self.database[season][holiday] mutableCopy];
    
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    BOOL holidayIsInSeason = NO;
    
    NSArray *holidays =[self.database[season] allKeys];
    
    if([holidays containsObject:holiday]){
        return YES;}
    
    return holidayIsInSeason;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    BOOL supplyIsInHoliday = NO;
    
    if ([self.database[season][holiday] containsObject:supply]){
        return YES;
    };
    
    return supplyIsInHoliday;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    self.database[season][holiday]=[[NSMutableArray alloc]init];
    
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season][holiday] addObject:supply];
    
    // no return
}

@end
