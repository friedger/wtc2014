
#import <Foundation/Foundation.h>

#import "api_generator/iphone/IMethodResult.h"


// hash keys used in properties and parameters

#define PROPERTY_SIMPLE_STRING_PROPERTY @"simpleStringProperty"


@protocol IWear <NSObject>


/* getter for "simpleStringProperty" property */
-(void) getSimpleStringProperty:(id<IMethodResult>)methodResult;

/* setter for "simpleStringProperty" property */
-(void) setSimpleStringProperty:(NSString*)simpleStringProperty methodResult:(id<IMethodResult>)methodResult;

/* return string with platform */
-(void) getPlatformName:(id<IMethodResult>)methodResult;

/* return summ of two params: a+b */
-(void) calcSumm:(int)a b:(int)b methodResult:(id<IMethodResult>)methodResult;

/* return join of two strings: a+b */
-(void) joinStrings:(NSString*)a b:(NSString*)b methodResult:(id<IMethodResult>)methodResult;

/* This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class. */
-(void) getProperty:(NSString*)propertyName methodResult:(id<IMethodResult>)methodResult;

/* This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class. */
-(void) getProperties:(NSArray*)arrayofNames methodResult:(id<IMethodResult>)methodResult;

/* This method will return all of object/value pairs for the propertyNames of the API class. */
-(void) getAllProperties:(id<IMethodResult>)methodResult;

/* This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only. */
-(void) setProperty:(NSString*)propertyName propertyValue:(NSString*)propertyValue methodResult:(id<IMethodResult>)methodResult;

/* This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only. */
-(void) setProperties:(NSDictionary*)propertyMap methodResult:(id<IMethodResult>)methodResult;


// NOTE: if you want to hold methodResult(for example periodically call callbacks) you should release it manually when you stop using it!
@end


@protocol IWearSingleton <NSObject>


-(NSString*) getDefaultID;
-(void) setDefaultID:(NSString*)defaultID;
-(NSString*)getInitialDefaultID;
    


-(void) enumerate:(id<IMethodResult>)methodResult;


@end


@protocol IWearFactory <NSObject>
-(id<IWearSingleton>) getWearSingleton;
-(id<IWear>) getWearByID:(NSString*)ID;
-(void) destroyObjectByID:(NSString*)ID;
-(NSArray*) enumerateWearInstances;
@end


@interface WearFactorySingleton : NSObject {
}
+(id<IWearFactory>) getWearFactoryInstance;
@end


