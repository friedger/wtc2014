#import "IWear.h"
//#import "api_generator/common/ruby_helpers.h"

#include "api_generator/js_helpers.h"

#import "api_generator/iphone/CMethodResult.h"
#import "api_generator/iphone/CJSConverter.h"

extern VALUE getRuby_Wear_Module();



id<IWear> Wear_makeInstanceByJSObject(rho::String sid) {
    const char* szID = sid.c_str();
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    return [factory getWearByID:[NSString stringWithUTF8String:szID]];
}









@interface Wear_getSimpleStringProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWear> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_getSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_getSimpleStringProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_getSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_getSimpleStringProperty_caller_params* par = [[Wear_getSimpleStringProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_getSimpleStringProperty_caller : NSObject {

}
+(Wear_getSimpleStringProperty_caller*) getSharedInstance;
+(void) getSimpleStringProperty:(Wear_getSimpleStringProperty_caller_params*)caller_params;
+(void) getSimpleStringProperty_in_thread:(Wear_getSimpleStringProperty_caller_params*)caller_params;
+(void) getSimpleStringProperty_in_UI_thread:(Wear_getSimpleStringProperty_caller_params*)caller_params;

@end

static Wear_getSimpleStringProperty_caller* our_Wear_getSimpleStringProperty_caller = nil;

@implementation Wear_getSimpleStringProperty_caller

+(Wear_getSimpleStringProperty_caller*) getSharedInstance {
    if (our_Wear_getSimpleStringProperty_caller == nil) {
        our_Wear_getSimpleStringProperty_caller = [[Wear_getSimpleStringProperty_caller alloc] init];
    }
    return our_Wear_getSimpleStringProperty_caller;
}

-(void) command_getSimpleStringProperty:(Wear_getSimpleStringProperty_caller_params*)caller_params {

    id<IWear> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getSimpleStringProperty:methodResult ];
    [caller_params release];
}


+(void) getSimpleStringProperty:(Wear_getSimpleStringProperty_caller_params*)caller_params {
    [[Wear_getSimpleStringProperty_caller getSharedInstance] command_getSimpleStringProperty:caller_params];
}

+(void) getSimpleStringProperty_in_thread:(Wear_getSimpleStringProperty_caller_params*)caller_params {
    [[Wear_getSimpleStringProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_getSimpleStringProperty:) withObject:caller_params];
}

+(void) getSimpleStringProperty_in_UI_thread:(Wear_getSimpleStringProperty_caller_params*)caller_params {
    [[Wear_getSimpleStringProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getSimpleStringProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_getSimpleStringProperty_Obj(rho::json::CJSONArray& argv, id<IWear>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::simpleStringProperty"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::getSimpleStringProperty parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_getSimpleStringProperty_caller getSimpleStringProperty_in_thread:[Wear_getSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_getSimpleStringProperty_caller getSimpleStringProperty:[Wear_getSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_Wear_getSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWear> item = Wear_makeInstanceByJSObject(strObjID);
    return js_Wear_getSimpleStringProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_Wear_def_getSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWear> item = [factory getWearByID:defID];
    return js_Wear_getSimpleStringProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface Wear_setSimpleStringProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWear> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_setSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_setSimpleStringProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_setSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_setSimpleStringProperty_caller_params* par = [[Wear_setSimpleStringProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_setSimpleStringProperty_caller : NSObject {

}
+(Wear_setSimpleStringProperty_caller*) getSharedInstance;
+(void) setSimpleStringProperty:(Wear_setSimpleStringProperty_caller_params*)caller_params;
+(void) setSimpleStringProperty_in_thread:(Wear_setSimpleStringProperty_caller_params*)caller_params;
+(void) setSimpleStringProperty_in_UI_thread:(Wear_setSimpleStringProperty_caller_params*)caller_params;

@end

static Wear_setSimpleStringProperty_caller* our_Wear_setSimpleStringProperty_caller = nil;

@implementation Wear_setSimpleStringProperty_caller

+(Wear_setSimpleStringProperty_caller*) getSharedInstance {
    if (our_Wear_setSimpleStringProperty_caller == nil) {
        our_Wear_setSimpleStringProperty_caller = [[Wear_setSimpleStringProperty_caller alloc] init];
    }
    return our_Wear_setSimpleStringProperty_caller;
}

-(void) command_setSimpleStringProperty:(Wear_setSimpleStringProperty_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IWear> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setSimpleStringProperty:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}


+(void) setSimpleStringProperty:(Wear_setSimpleStringProperty_caller_params*)caller_params {
    [[Wear_setSimpleStringProperty_caller getSharedInstance] command_setSimpleStringProperty:caller_params];
}

+(void) setSimpleStringProperty_in_thread:(Wear_setSimpleStringProperty_caller_params*)caller_params {
    [[Wear_setSimpleStringProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_setSimpleStringProperty:) withObject:caller_params];
}

+(void) setSimpleStringProperty_in_UI_thread:(Wear_setSimpleStringProperty_caller_params*)caller_params {
    [[Wear_setSimpleStringProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setSimpleStringProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_setSimpleStringProperty_Obj(rho::json::CJSONArray& argv, id<IWear>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::simpleStringProperty="];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "simpleStringProperty", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::setSimpleStringProperty parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_setSimpleStringProperty_caller setSimpleStringProperty_in_thread:[Wear_setSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_setSimpleStringProperty_caller setSimpleStringProperty:[Wear_setSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_Wear_setSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWear> item = Wear_makeInstanceByJSObject(strObjID);
    return js_Wear_setSimpleStringProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_Wear_def_setSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWear> item = [factory getWearByID:defID];
    return js_Wear_setSimpleStringProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface Wear_enumerate_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWearSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_enumerate_caller_params*) makeParams:(NSArray*)_params _item:(id<IWearSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_enumerate_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_enumerate_caller_params*) makeParams:(NSArray*)_params _item:(id<IWearSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_enumerate_caller_params* par = [[Wear_enumerate_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_enumerate_caller : NSObject {

}
+(Wear_enumerate_caller*) getSharedInstance;
+(void) enumerate:(Wear_enumerate_caller_params*)caller_params;
+(void) enumerate_in_thread:(Wear_enumerate_caller_params*)caller_params;
+(void) enumerate_in_UI_thread:(Wear_enumerate_caller_params*)caller_params;

@end

static Wear_enumerate_caller* our_Wear_enumerate_caller = nil;

@implementation Wear_enumerate_caller

+(Wear_enumerate_caller*) getSharedInstance {
    if (our_Wear_enumerate_caller == nil) {
        our_Wear_enumerate_caller = [[Wear_enumerate_caller alloc] init];
    }
    return our_Wear_enumerate_caller;
}

-(void) command_enumerate:(Wear_enumerate_caller_params*)caller_params {

    id<IWearSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem enumerate:methodResult ];
    [caller_params release];
}


+(void) enumerate:(Wear_enumerate_caller_params*)caller_params {
    [[Wear_enumerate_caller getSharedInstance] command_enumerate:caller_params];
}

+(void) enumerate_in_thread:(Wear_enumerate_caller_params*)caller_params {
    [[Wear_enumerate_caller getSharedInstance] performSelectorInBackground:@selector(command_enumerate:) withObject:caller_params];
}

+(void) enumerate_in_UI_thread:(Wear_enumerate_caller_params*)caller_params {
    [[Wear_enumerate_caller getSharedInstance] performSelectorOnMainThread:@selector(command_enumerate:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_enumerate_Obj(rho::json::CJSONArray& argv, id<IWearSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::enumerate"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::enumerate parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    [methodResult enableObjectCreationModeWithJSClassPath:@"Rho.Wear"];

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_enumerate_caller enumerate_in_thread:[Wear_enumerate_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_enumerate_caller enumerate:[Wear_enumerate_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_s_Wear_enumerate(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];
    return js_Wear_enumerate_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface Wear_getPlatformName_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWear> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_getPlatformName_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_getPlatformName_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_getPlatformName_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_getPlatformName_caller_params* par = [[Wear_getPlatformName_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_getPlatformName_caller : NSObject {

}
+(Wear_getPlatformName_caller*) getSharedInstance;
+(void) getPlatformName:(Wear_getPlatformName_caller_params*)caller_params;
+(void) getPlatformName_in_thread:(Wear_getPlatformName_caller_params*)caller_params;
+(void) getPlatformName_in_UI_thread:(Wear_getPlatformName_caller_params*)caller_params;

@end

static Wear_getPlatformName_caller* our_Wear_getPlatformName_caller = nil;

@implementation Wear_getPlatformName_caller

+(Wear_getPlatformName_caller*) getSharedInstance {
    if (our_Wear_getPlatformName_caller == nil) {
        our_Wear_getPlatformName_caller = [[Wear_getPlatformName_caller alloc] init];
    }
    return our_Wear_getPlatformName_caller;
}

-(void) command_getPlatformName:(Wear_getPlatformName_caller_params*)caller_params {

    id<IWear> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getPlatformName:methodResult ];
    [caller_params release];
}


+(void) getPlatformName:(Wear_getPlatformName_caller_params*)caller_params {
    [[Wear_getPlatformName_caller getSharedInstance] command_getPlatformName:caller_params];
}

+(void) getPlatformName_in_thread:(Wear_getPlatformName_caller_params*)caller_params {
    [[Wear_getPlatformName_caller getSharedInstance] performSelectorInBackground:@selector(command_getPlatformName:) withObject:caller_params];
}

+(void) getPlatformName_in_UI_thread:(Wear_getPlatformName_caller_params*)caller_params {
    [[Wear_getPlatformName_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getPlatformName:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_getPlatformName_Obj(rho::json::CJSONArray& argv, id<IWear>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::getPlatformName"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::getPlatformName parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_getPlatformName_caller getPlatformName_in_thread:[Wear_getPlatformName_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_getPlatformName_caller getPlatformName:[Wear_getPlatformName_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_Wear_getPlatformName(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWear> item = Wear_makeInstanceByJSObject(strObjID);
    return js_Wear_getPlatformName_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_Wear_def_getPlatformName(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWear> item = [factory getWearByID:defID];
    return js_Wear_getPlatformName_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface Wear_calcSumm_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWear> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_calcSumm_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_calcSumm_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_calcSumm_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_calcSumm_caller_params* par = [[Wear_calcSumm_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_calcSumm_caller : NSObject {

}
+(Wear_calcSumm_caller*) getSharedInstance;
+(void) calcSumm:(Wear_calcSumm_caller_params*)caller_params;
+(void) calcSumm_in_thread:(Wear_calcSumm_caller_params*)caller_params;
+(void) calcSumm_in_UI_thread:(Wear_calcSumm_caller_params*)caller_params;

@end

static Wear_calcSumm_caller* our_Wear_calcSumm_caller = nil;

@implementation Wear_calcSumm_caller

+(Wear_calcSumm_caller*) getSharedInstance {
    if (our_Wear_calcSumm_caller == nil) {
        our_Wear_calcSumm_caller = [[Wear_calcSumm_caller alloc] init];
    }
    return our_Wear_calcSumm_caller;
}

-(void) command_calcSumm:(Wear_calcSumm_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IWear> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem calcSumm:(int)[((NSNumber*)[params objectAtIndex:0]) intValue] b:(int)[((NSNumber*)[params objectAtIndex:1]) intValue] methodResult:methodResult ];
    [caller_params release];
}


+(void) calcSumm:(Wear_calcSumm_caller_params*)caller_params {
    [[Wear_calcSumm_caller getSharedInstance] command_calcSumm:caller_params];
}

+(void) calcSumm_in_thread:(Wear_calcSumm_caller_params*)caller_params {
    [[Wear_calcSumm_caller getSharedInstance] performSelectorInBackground:@selector(command_calcSumm:) withObject:caller_params];
}

+(void) calcSumm_in_UI_thread:(Wear_calcSumm_caller_params*)caller_params {
    [[Wear_calcSumm_caller getSharedInstance] performSelectorOnMainThread:@selector(command_calcSumm:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_calcSumm_Obj(rho::json::CJSONArray& argv, id<IWear>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[2+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::calcSumm"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_INTEGER, 0, "a", 0, 0 }, {RHO_API_INTEGER, 0, "b", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (2); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (2); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::calcSumm parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(2)];
    for (i = 0 ; i < (2); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_calcSumm_caller calcSumm_in_thread:[Wear_calcSumm_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_calcSumm_caller calcSumm:[Wear_calcSumm_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_Wear_calcSumm(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWear> item = Wear_makeInstanceByJSObject(strObjID);
    return js_Wear_calcSumm_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_Wear_def_calcSumm(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWear> item = [factory getWearByID:defID];
    return js_Wear_calcSumm_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface Wear_joinStrings_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWear> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_joinStrings_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_joinStrings_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_joinStrings_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_joinStrings_caller_params* par = [[Wear_joinStrings_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_joinStrings_caller : NSObject {

}
+(Wear_joinStrings_caller*) getSharedInstance;
+(void) joinStrings:(Wear_joinStrings_caller_params*)caller_params;
+(void) joinStrings_in_thread:(Wear_joinStrings_caller_params*)caller_params;
+(void) joinStrings_in_UI_thread:(Wear_joinStrings_caller_params*)caller_params;

@end

static Wear_joinStrings_caller* our_Wear_joinStrings_caller = nil;

@implementation Wear_joinStrings_caller

+(Wear_joinStrings_caller*) getSharedInstance {
    if (our_Wear_joinStrings_caller == nil) {
        our_Wear_joinStrings_caller = [[Wear_joinStrings_caller alloc] init];
    }
    return our_Wear_joinStrings_caller;
}

-(void) command_joinStrings:(Wear_joinStrings_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IWear> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem joinStrings:(NSString*)[params objectAtIndex:0] b:(NSString*)[params objectAtIndex:1] methodResult:methodResult ];
    [caller_params release];
}


+(void) joinStrings:(Wear_joinStrings_caller_params*)caller_params {
    [[Wear_joinStrings_caller getSharedInstance] command_joinStrings:caller_params];
}

+(void) joinStrings_in_thread:(Wear_joinStrings_caller_params*)caller_params {
    [[Wear_joinStrings_caller getSharedInstance] performSelectorInBackground:@selector(command_joinStrings:) withObject:caller_params];
}

+(void) joinStrings_in_UI_thread:(Wear_joinStrings_caller_params*)caller_params {
    [[Wear_joinStrings_caller getSharedInstance] performSelectorOnMainThread:@selector(command_joinStrings:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_joinStrings_Obj(rho::json::CJSONArray& argv, id<IWear>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[2+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::joinStrings"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "a", 0, 0 }, {RHO_API_STRING, 0, "b", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (2); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (2); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::joinStrings parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(2)];
    for (i = 0 ; i < (2); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_joinStrings_caller joinStrings_in_thread:[Wear_joinStrings_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_joinStrings_caller joinStrings:[Wear_joinStrings_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_Wear_joinStrings(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWear> item = Wear_makeInstanceByJSObject(strObjID);
    return js_Wear_joinStrings_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_Wear_def_joinStrings(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWear> item = [factory getWearByID:defID];
    return js_Wear_joinStrings_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface Wear_getProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWear> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_getProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_getProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_getProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_getProperty_caller_params* par = [[Wear_getProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_getProperty_caller : NSObject {

}
+(Wear_getProperty_caller*) getSharedInstance;
+(void) getProperty:(Wear_getProperty_caller_params*)caller_params;
+(void) getProperty_in_thread:(Wear_getProperty_caller_params*)caller_params;
+(void) getProperty_in_UI_thread:(Wear_getProperty_caller_params*)caller_params;

@end

static Wear_getProperty_caller* our_Wear_getProperty_caller = nil;

@implementation Wear_getProperty_caller

+(Wear_getProperty_caller*) getSharedInstance {
    if (our_Wear_getProperty_caller == nil) {
        our_Wear_getProperty_caller = [[Wear_getProperty_caller alloc] init];
    }
    return our_Wear_getProperty_caller;
}

-(void) command_getProperty:(Wear_getProperty_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IWear> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getProperty:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}


+(void) getProperty:(Wear_getProperty_caller_params*)caller_params {
    [[Wear_getProperty_caller getSharedInstance] command_getProperty:caller_params];
}

+(void) getProperty_in_thread:(Wear_getProperty_caller_params*)caller_params {
    [[Wear_getProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_getProperty:) withObject:caller_params];
}

+(void) getProperty_in_UI_thread:(Wear_getProperty_caller_params*)caller_params {
    [[Wear_getProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_getProperty_Obj(rho::json::CJSONArray& argv, id<IWear>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::getProperty"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "propertyName", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::getProperty parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_getProperty_caller getProperty_in_thread:[Wear_getProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_getProperty_caller getProperty:[Wear_getProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_Wear_getProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWear> item = Wear_makeInstanceByJSObject(strObjID);
    return js_Wear_getProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_Wear_def_getProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWear> item = [factory getWearByID:defID];
    return js_Wear_getProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface Wear_getProperties_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWear> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_getProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_getProperties_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_getProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_getProperties_caller_params* par = [[Wear_getProperties_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_getProperties_caller : NSObject {

}
+(Wear_getProperties_caller*) getSharedInstance;
+(void) getProperties:(Wear_getProperties_caller_params*)caller_params;
+(void) getProperties_in_thread:(Wear_getProperties_caller_params*)caller_params;
+(void) getProperties_in_UI_thread:(Wear_getProperties_caller_params*)caller_params;

@end

static Wear_getProperties_caller* our_Wear_getProperties_caller = nil;

@implementation Wear_getProperties_caller

+(Wear_getProperties_caller*) getSharedInstance {
    if (our_Wear_getProperties_caller == nil) {
        our_Wear_getProperties_caller = [[Wear_getProperties_caller alloc] init];
    }
    return our_Wear_getProperties_caller;
}

-(void) command_getProperties:(Wear_getProperties_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IWear> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getProperties:(NSArray*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}


+(void) getProperties:(Wear_getProperties_caller_params*)caller_params {
    [[Wear_getProperties_caller getSharedInstance] command_getProperties:caller_params];
}

+(void) getProperties_in_thread:(Wear_getProperties_caller_params*)caller_params {
    [[Wear_getProperties_caller getSharedInstance] performSelectorInBackground:@selector(command_getProperties:) withObject:caller_params];
}

+(void) getProperties_in_UI_thread:(Wear_getProperties_caller_params*)caller_params {
    [[Wear_getProperties_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getProperties:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_getProperties_Obj(rho::json::CJSONArray& argv, id<IWear>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::getProperties"];

    
    static RHO_API_PARAM rho_api_params_param0[] = { {RHO_API_STRING, 0, "array_param", 0, 0 } };
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_ARRAY, 0, "arrayofNames", 1, rho_api_params_param0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::getProperties parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_getProperties_caller getProperties_in_thread:[Wear_getProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_getProperties_caller getProperties:[Wear_getProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_Wear_getProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWear> item = Wear_makeInstanceByJSObject(strObjID);
    return js_Wear_getProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_Wear_def_getProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWear> item = [factory getWearByID:defID];
    return js_Wear_getProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface Wear_getAllProperties_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWear> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_getAllProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_getAllProperties_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_getAllProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_getAllProperties_caller_params* par = [[Wear_getAllProperties_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_getAllProperties_caller : NSObject {

}
+(Wear_getAllProperties_caller*) getSharedInstance;
+(void) getAllProperties:(Wear_getAllProperties_caller_params*)caller_params;
+(void) getAllProperties_in_thread:(Wear_getAllProperties_caller_params*)caller_params;
+(void) getAllProperties_in_UI_thread:(Wear_getAllProperties_caller_params*)caller_params;

@end

static Wear_getAllProperties_caller* our_Wear_getAllProperties_caller = nil;

@implementation Wear_getAllProperties_caller

+(Wear_getAllProperties_caller*) getSharedInstance {
    if (our_Wear_getAllProperties_caller == nil) {
        our_Wear_getAllProperties_caller = [[Wear_getAllProperties_caller alloc] init];
    }
    return our_Wear_getAllProperties_caller;
}

-(void) command_getAllProperties:(Wear_getAllProperties_caller_params*)caller_params {

    id<IWear> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getAllProperties:methodResult ];
    [caller_params release];
}


+(void) getAllProperties:(Wear_getAllProperties_caller_params*)caller_params {
    [[Wear_getAllProperties_caller getSharedInstance] command_getAllProperties:caller_params];
}

+(void) getAllProperties_in_thread:(Wear_getAllProperties_caller_params*)caller_params {
    [[Wear_getAllProperties_caller getSharedInstance] performSelectorInBackground:@selector(command_getAllProperties:) withObject:caller_params];
}

+(void) getAllProperties_in_UI_thread:(Wear_getAllProperties_caller_params*)caller_params {
    [[Wear_getAllProperties_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getAllProperties:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_getAllProperties_Obj(rho::json::CJSONArray& argv, id<IWear>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::getAllProperties"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::getAllProperties parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_getAllProperties_caller getAllProperties_in_thread:[Wear_getAllProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_getAllProperties_caller getAllProperties:[Wear_getAllProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_Wear_getAllProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWear> item = Wear_makeInstanceByJSObject(strObjID);
    return js_Wear_getAllProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_Wear_def_getAllProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWear> item = [factory getWearByID:defID];
    return js_Wear_getAllProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface Wear_setProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWear> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_setProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_setProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_setProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_setProperty_caller_params* par = [[Wear_setProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_setProperty_caller : NSObject {

}
+(Wear_setProperty_caller*) getSharedInstance;
+(void) setProperty:(Wear_setProperty_caller_params*)caller_params;
+(void) setProperty_in_thread:(Wear_setProperty_caller_params*)caller_params;
+(void) setProperty_in_UI_thread:(Wear_setProperty_caller_params*)caller_params;

@end

static Wear_setProperty_caller* our_Wear_setProperty_caller = nil;

@implementation Wear_setProperty_caller

+(Wear_setProperty_caller*) getSharedInstance {
    if (our_Wear_setProperty_caller == nil) {
        our_Wear_setProperty_caller = [[Wear_setProperty_caller alloc] init];
    }
    return our_Wear_setProperty_caller;
}

-(void) command_setProperty:(Wear_setProperty_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IWear> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setProperty:(NSString*)[params objectAtIndex:0] propertyValue:(NSString*)[params objectAtIndex:1] methodResult:methodResult ];
    [caller_params release];
}


+(void) setProperty:(Wear_setProperty_caller_params*)caller_params {
    [[Wear_setProperty_caller getSharedInstance] command_setProperty:caller_params];
}

+(void) setProperty_in_thread:(Wear_setProperty_caller_params*)caller_params {
    [[Wear_setProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_setProperty:) withObject:caller_params];
}

+(void) setProperty_in_UI_thread:(Wear_setProperty_caller_params*)caller_params {
    [[Wear_setProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_setProperty_Obj(rho::json::CJSONArray& argv, id<IWear>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[2+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::setProperty"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "propertyName", 0, 0 }, {RHO_API_STRING, 0, "propertyValue", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (2); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (2); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::setProperty parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(2)];
    for (i = 0 ; i < (2); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_setProperty_caller setProperty_in_thread:[Wear_setProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_setProperty_caller setProperty:[Wear_setProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_Wear_setProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWear> item = Wear_makeInstanceByJSObject(strObjID);
    return js_Wear_setProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_Wear_def_setProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWear> item = [factory getWearByID:defID];
    return js_Wear_setProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface Wear_setProperties_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWear> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Wear_setProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Wear_setProperties_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Wear_setProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWear>)_item _methodResult:(CMethodResult*)_methodResult {
    Wear_setProperties_caller_params* par = [[Wear_setProperties_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Wear_setProperties_caller : NSObject {

}
+(Wear_setProperties_caller*) getSharedInstance;
+(void) setProperties:(Wear_setProperties_caller_params*)caller_params;
+(void) setProperties_in_thread:(Wear_setProperties_caller_params*)caller_params;
+(void) setProperties_in_UI_thread:(Wear_setProperties_caller_params*)caller_params;

@end

static Wear_setProperties_caller* our_Wear_setProperties_caller = nil;

@implementation Wear_setProperties_caller

+(Wear_setProperties_caller*) getSharedInstance {
    if (our_Wear_setProperties_caller == nil) {
        our_Wear_setProperties_caller = [[Wear_setProperties_caller alloc] init];
    }
    return our_Wear_setProperties_caller;
}

-(void) command_setProperties:(Wear_setProperties_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IWear> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setProperties:(NSDictionary*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}


+(void) setProperties:(Wear_setProperties_caller_params*)caller_params {
    [[Wear_setProperties_caller getSharedInstance] command_setProperties:caller_params];
}

+(void) setProperties_in_thread:(Wear_setProperties_caller_params*)caller_params {
    [[Wear_setProperties_caller getSharedInstance] performSelectorInBackground:@selector(command_setProperties:) withObject:caller_params];
}

+(void) setProperties_in_UI_thread:(Wear_setProperties_caller_params*)caller_params {
    [[Wear_setProperties_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setProperties:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Wear_setProperties_Obj(rho::json::CJSONArray& argv, id<IWear>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Wear::setProperties"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_HASH, 0, "propertyMap", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = Wear_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Wear::setProperties parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [Wear_setProperties_caller setProperties_in_thread:[Wear_setProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Wear_setProperties_caller setProperties:[Wear_setProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_Wear_setProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWear> item = Wear_makeInstanceByJSObject(strObjID);
    return js_Wear_setProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_Wear_def_setProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWear> item = [factory getWearByID:defID];
    return js_Wear_setProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







rho::String js_s_Wear_getDefaultID(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    rho::String res =  [[CJSConverter convertToJS:defID level:0] UTF8String];

    return res;
}

rho::String js_s_Wear_getDefault(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    NSString* defID = [singleton getDefaultID];

    rho::String res =  [[CJSConverter convertToJS:[CRhoAPIClassInstance rubyClassByName:@"Rho.Wear" instanceID:defID] level:0] UTF8String];

    return res;
}

rho::String js_s_Wear_setDefaultID(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    id<IWearFactory> factory = [WearFactorySingleton getWearFactoryInstance];
    id<IWearSingleton> singleton = [factory getWearSingleton];

    rho::json::CJSONEntry el = argv[0];

    if (el.isString()) {
        NSString* defID = [NSString stringWithUTF8String:(el.getString())];

        [singleton setDefaultID:defID];

        return [[CJSConverter convertToJS:nil level:0] UTF8String];
    }

    return "\"result\":null,\"error\":\"Method parameter should be defined as string!\"";
}



