
#import "WearFactoryBase.h"
#import "Wear.h"
#import "WearSingleton.h"



@implementation WearFactoryBase

-(id)init {
    self = [super init];
    mWearInstances = [[NSMutableDictionary dictionaryWithCapacity:4] retain];
    mWearSingleton = nil;
    return self;
}

-(id<IWear>) getWearByID:(NSString*)ID {
    id<IWear> obj = (Wear*)[mWearInstances objectForKey:ID];
    if (obj == nil) {
        obj = [self createWearByID:ID];
        [mWearInstances setObject:obj forKey:ID];
    }
    return obj;
}

-(void) destroyObjectByID:(NSString*)ID {
    Wear* obj = [mWearInstances objectForKey:ID];
    if (obj != nil) {
        [mWearInstances removeObjectForKey:ID];
    }
}


-(id<IWear>)createWearByID:(NSString*)ID {
    Wear* obj = [[Wear alloc] init];

    [obj setProperty:@"ID" propertyValue:ID methodResult:nil];

    return obj;
}


-(id<IWearSingleton>) getWearSingleton {
    if (mWearSingleton == nil) {
        mWearSingleton = [[WearSingleton alloc] init];
    }
    return mWearSingleton;
}

-(NSArray*) enumerateWearInstances {
    return [mWearInstances allKeys];
}

-(void)dealloc {
    [mWearInstances release];
    [super dealloc];
}


@end