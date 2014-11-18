#include "api_generator/js_helpers.h"
#include "api_generator/Api.h"

#include "logging/RhoLog.h"
#undef DEFAULT_LOGCATEGORY
#define DEFAULT_LOGCATEGORY "Wear"




rho::String js_Wear_getSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_def_getSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_Wear_setSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_def_setSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_Wear_enumerate(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_Wear_getPlatformName(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_def_getPlatformName(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_Wear_calcSumm(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_def_calcSumm(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_Wear_joinStrings(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_def_joinStrings(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_Wear_getProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_def_getProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_Wear_getProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_def_getProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_Wear_getAllProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_def_getAllProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_Wear_setProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_def_setProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_Wear_setProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_def_setProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);



rho::String js_s_Wear_getDefaultID(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_getDefault(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_Wear_setDefaultID(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);



namespace {
  using namespace rho::apiGenerator;
  class WearDispatcher : public ApiHandler<Func_JS>
  {
  public:
    WearDispatcher() : ApiHandler("Rho:Wear") {}
    virtual ~WearDispatcher() {}
    virtual void initialize();
  };
  
  void WearDispatcher::initialize()
  {
    ApiHandler<Func_JS>::initialize();
    
    RAWTRACE("Initializing Rho:Wear API...");


    defineInstanceMethod("simpleStringProperty", js_Wear_getSimpleStringProperty);
    //  should define static method !     defineStaticMethod("def_simpleStringProperty", js_s_Wear_def_getSimpleStringProperty);;


    defineInstanceMethod("simpleStringProperty=", js_Wear_setSimpleStringProperty);
    //  should define static method !     defineStaticMethod("def_simpleStringProperty=", js_s_Wear_def_setSimpleStringProperty);;


    defineStaticMethod("enumerate", js_s_Wear_enumerate);


    defineInstanceMethod("getPlatformName", js_Wear_getPlatformName);
    //  should define static method !     defineStaticMethod("def_getPlatformName", js_s_Wear_def_getPlatformName);;


    defineInstanceMethod("calcSumm", js_Wear_calcSumm);
    //  should define static method !     defineStaticMethod("def_calcSumm", js_s_Wear_def_calcSumm);;


    defineInstanceMethod("joinStrings", js_Wear_joinStrings);
    //  should define static method !     defineStaticMethod("def_joinStrings", js_s_Wear_def_joinStrings);;


    defineInstanceMethod("getProperty", js_Wear_getProperty);
    //  should define static method !     defineStaticMethod("def_getProperty", js_s_Wear_def_getProperty);;


    defineInstanceMethod("getProperties", js_Wear_getProperties);
    //  should define static method !     defineStaticMethod("def_getProperties", js_s_Wear_def_getProperties);;


    defineInstanceMethod("getAllProperties", js_Wear_getAllProperties);
    //  should define static method !     defineStaticMethod("def_getAllProperties", js_s_Wear_def_getAllProperties);;


    defineInstanceMethod("setProperty", js_Wear_setProperty);
    //  should define static method !     defineStaticMethod("def_setProperty", js_s_Wear_def_setProperty);;


    defineInstanceMethod("setProperties", js_Wear_setProperties);
    //  should define static method !     defineStaticMethod("def_setProperties", js_s_Wear_def_setProperties);;


    defineStaticMethod("getDefaultID", js_s_Wear_getDefaultID);
    defineStaticMethod("getDefault", js_s_Wear_getDefault);
    defineStaticMethod("setDefaultID", js_s_Wear_setDefaultID);

    RAWTRACE("Rho:Wear API - done");
  }
}

extern "C" void Init_JSAPI_Wear(void)
{
  rho::apiGenerator::defineJSApiModule(new WearDispatcher);
}
