
#import "IWear.h"
#import "WearFactoryBase.h"

static WearFactoryBase* ourWearFactory = nil;

@implementation WearFactorySingleton

+(id<IWearFactory>) getWearFactoryInstance {
    if (ourWearFactory == nil) {
        ourWearFactory = [[WearFactoryBase alloc] init];
    }
    return ourWearFactory;
}

@end