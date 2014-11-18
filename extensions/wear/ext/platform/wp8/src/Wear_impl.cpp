#include "../../../shared/generated/cpp/WearBase.h"

namespace rho {

using namespace apiGenerator;

class CWearImpl: public CWearBase
{
public:
    CWearImpl(const rho::String& strID): CWearBase()
    {
    }

    virtual void enable( const rho::Hashtable<rho::String, rho::String>& propertyMap, CMethodResult& oResult){}
    virtual void start(CMethodResult& oResult){}
    virtual void stop(CMethodResult& oResult){}
    virtual void disable(CMethodResult& oResult){}
    virtual void take( const rho::Hashtable<rho::String, rho::String>& propertyMap, CMethodResult& oResult){}

};

class CWearSingleton: public CWearSingletonBase
{
    ~CWearSingleton(){}
    virtual rho::String getInitialDefaultID();
    virtual void enumerate(CMethodResult& oResult);
};

class CWearFactory: public CWearFactoryBase
{
    ~CWearFactory(){}
    virtual IWearSingleton* createModuleSingleton();
    virtual IWear* createModuleByID(const rho::String& strID);
};

extern "C" void Init_Wear_extension()
{
    CWearFactory::setInstance( new CWearFactory() );
    Init_Wear_API();
}

IWear* CWearFactory::createModuleByID(const rho::String& strID)
{
    return new CWearImpl(strID);
}

IWearSingleton* CWearFactory::createModuleSingleton()
{
    return new CWearSingleton();
}

void CWearSingleton::enumerate(CMethodResult& oResult)
{
    rho::Vector<rho::String> arIDs;
    arIDs.addElement("SC1");
    arIDs.addElement("SC2");

    oResult.set(arIDs);
}

rho::String CWearSingleton::getInitialDefaultID()
{
    CMethodResult oRes;
    enumerate(oRes);

    rho::Vector<rho::String>& arIDs = oRes.getStringArray();
        
    return arIDs[0];
}

}