
#import "IWear.h"

@interface WearFactoryBase : NSObject<IWearFactory> {
    NSMutableDictionary* mWearInstances;
    id<IWearSingleton> mWearSingleton;
}

-(id)init;

-(id<IWearSingleton>) getWearSingleton;
-(id<IWear>) getWearByID:(NSString*)ID;

-(void) destroyObjectByID:(NSString*)ID;

-(id<IWear>)createWearByID:(NSString*)ID;

-(NSArray*) enumerateWearInstances;

-(void)dealloc;

@end