
#import "IWear.h"
#import "WearSingletonBase.h"

@interface WearSingleton : WearSingletonBase<IWearSingleton> {
}


-(NSString*)getInitialDefaultID;


-(void) enumerate:(id<IMethodResult>)methodResult;




@end