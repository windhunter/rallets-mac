// Generated by json_to_model

#import "Configuration.h"
#import "HttpUtil.h"

@implementation Configuration  {

}

- (id)initWithJSONDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (![dictionary isKindOfClass:[NSDictionary class]])
        return nil;

    if (self) {
        self.current = (dictionary[@"current"] != [NSNull null]) ? [dictionary[@"current"] integerValue] : 0;
  
        self.profiles = [[NSMutableArray alloc] initWithCapacity:16];
        for (NSDictionary* _ in dictionary[@"configs"]) {
            [((NSMutableArray *)self.profiles) addObject:[[Profile alloc] initWithJSONDictionary:_]];
        }
 
    }
    return self;
}

- (id)initWithJSONData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self = [self initWithJSONDictionary:data];
    }
    return self;
}

- (id)setConfigs:(NSArray*)configs {
    [(NSMutableArray *)self.profiles removeAllObjects];
    for (NSDictionary* _ in configs) {
        [((NSMutableArray *)self.profiles) addObject:[[Profile alloc] initWithJSONDictionary:_]];
    }
    return self;
}

- (id)clearConfigs {
    [(NSMutableArray *)self.profiles removeAllObjects];
    return self;
}

- (BOOL) hasConfigs {
    return [self.profiles count] != 0;
}

- (NSDictionary *)JSONDictionary {

    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];

 
    dictionary[@"current"] = @(self.current);
  
    {
        NSMutableArray *_ = [[NSMutableArray alloc] init];
        dictionary[@"configs"] = _;
        
        for (Profile *__ in self.profiles) {
            
                [_ addObject:[__ JSONDictionary]];
            
        }
        
    }
 
    return dictionary;
}

- (NSData *)JSONData {
    NSArray* profiles = self.profiles;
    self.profiles = nil;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self JSONDictionary] options:0 error:&error];
    self.profiles = profiles;
    if (error) {
        @throw error;
    }
    return data;
}


@end