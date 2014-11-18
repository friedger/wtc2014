#include "common/RhodesApp.h"
#include "../../wp8/rhoruntime/common/RhoConvertWP8.h"
//#include "../../../../shared/generated/cpp/WearBase.h"
#include "WearFactory.h"
#include "api_generator/wp8/MethodResultImpl.h"

using namespace rho::apiGenerator;
using namespace rhoruntime;

namespace rho {

class CWearImpl: public CWearBase
{
private:
    IWearImpl^ _runtime;
public:
    CWearImpl(const rho::String& strID, IWearImpl^ runtime): CWearBase(), _runtime(runtime) {}

    virtual void getSimpleStringProperty(CMethodResult& oResult)
    {
        try {
            _runtime->getSimpleStringProperty(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setSimpleStringProperty(const rho::String& simpleStringProperty, CMethodResult& oResult)
    {
        Platform::String^ _simpleStringProperty = rho::common::convertStringToWP8(simpleStringProperty);
        try {
            _runtime->setSimpleStringProperty(_simpleStringProperty, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getPlatformName(CMethodResult& oResult)
    {
        try {
            _runtime->getPlatformName(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void calcSumm(int a, int b, CMethodResult& oResult)
    {
        try {
            _runtime->calcSumm(a, b, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void joinStrings(const rho::String& a, const rho::String& b, CMethodResult& oResult)
    {
        Platform::String^ _a = rho::common::convertStringToWP8(a);
        Platform::String^ _b = rho::common::convertStringToWP8(b);
        try {
            _runtime->joinStrings(_a, _b, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getProperty(const rho::String& propertyName, CMethodResult& oResult)
    {
        Platform::String^ _propertyName = rho::common::convertStringToWP8(propertyName);
        try {
            _runtime->getProperty(_propertyName, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getProperties(const rho::Vector<rho::String>& arrayofNames, CMethodResult& oResult)
    {
        Windows::Foundation::Collections::IVectorView<Platform::String^>^ _arrayofNames = rho::common::convertArrayToWP8(arrayofNames);
        try {
            _runtime->getProperties(_arrayofNames, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getAllProperties(CMethodResult& oResult)
    {
        try {
            _runtime->getAllProperties(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setProperty(const rho::String& propertyName, const rho::String& propertyValue, CMethodResult& oResult)
    {
        Platform::String^ _propertyName = rho::common::convertStringToWP8(propertyName);
        Platform::String^ _propertyValue = rho::common::convertStringToWP8(propertyValue);
        try {
            _runtime->setProperty(_propertyName, _propertyValue, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setProperties(const rho::Hashtable<rho::String, rho::String>& propertyMap, CMethodResult& oResult)
    {
        Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ _propertyMap = rho::common::convertHashToWP8(propertyMap);
        try {
            _runtime->setProperties(_propertyMap, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }
};

class CWearSingleton: public CWearSingletonBase
{
private:
    IWearSingletonImpl^ _runtime;
public:
    CWearSingleton(IWearSingletonImpl^ runtime): CWearSingletonBase(), _runtime(runtime) {}
    ~CWearSingleton(){}

    virtual void enumerate(CMethodResult& oResult)
    {
        try {
            _runtime->enumerate(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }


    virtual rho::String getDefaultID(){return "1";} // TODO: implement getDefaultID
    virtual rho::String getInitialDefaultID(){return "1";} // TODO: implement getInitialDefaultID
    virtual void setDefaultID(const rho::String& strID){} // TODO: implement setDefaultID
    virtual void addCommandToQueue(rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor){} // TODO: implement addCommandToQueue
    virtual void callCommandInThread(rho::common::IRhoRunnable* pFunctor){} // TODO: implement callCommandInThread
};

IWearFactoryImpl^ CWearFactory::_impl;

IWear* CWearFactory::createModuleByID(const rho::String& strID)
{
    return new CWearImpl(strID, _impl->getImpl());
}

IWearSingleton* CWearFactory::createModuleSingleton()
{
    return new CWearSingleton(_impl->getSingletonImpl());
}

}

extern "C" void Init_Wear_extension()
{
    rho::CWearFactory::setInstance( new rho::CWearFactory() );
    rho::Init_Wear_API();

    RHODESAPP().getExtManager().requireRubyFile("RhoWearApi");
}
