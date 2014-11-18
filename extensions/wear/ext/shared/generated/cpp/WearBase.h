#pragma once

#include "IWear.h"
#include "logging/RhoLog.h"
#include "common/StringConverter.h"
#include "common/ExtManager.h"


namespace rho {

using namespace rho::apiGenerator;
using namespace rho;

// hash keys used in properties and parameters 
namespace wear {

    static const char PROPERTY_SIMPLE_STRING_PROPERTY[] = "simpleStringProperty"; 
 
} 

class CWearFactoryBase : public CModuleFactoryBase<IWear, IWearSingleton, IWearFactory>
{
protected:
    static rho::common::CAutoPtr<CWearFactoryBase> m_pInstance;
    HashtablePtr<rho::String,IWear*> m_hashModules;

public:

    static void setInstance(CWearFactoryBase* pInstance){ m_pInstance = pInstance; }
    static CWearFactoryBase* getInstance(){ return m_pInstance; }

    static IWearSingleton* getWearSingletonS(){ return getInstance()->getModuleSingleton(); }

    virtual IWear* getModuleByID(const rho::String& strID)
    {
        if ( !m_hashModules.containsKey(strID) )
        {
            IWear* pObj = createModuleByID(strID);
            m_hashModules.put(strID, pObj );

            return pObj;
        }

        return m_hashModules[strID];
    }

    virtual IWear* createModuleByID(const rho::String& strID){ return (IWear*)0; };
    virtual void deleteModuleByID(const rho::String& strID)
    {
        m_hashModules.remove(strID);
    }

};

class CWearSingletonBase : public CModuleSingletonBase< IWearSingleton >, public rho::common::IRhoExtension
{
protected:
    DEFINE_LOGCLASS;


    rho::String m_strDefaultID;




public:
    virtual rho::LogCategory getModuleLogCategory(){ return getLogCategory(); }

    CWearSingletonBase();
    ~CWearSingletonBase();




    virtual void setDefaultID(const rho::String& strDefaultID){ m_strDefaultID = strDefaultID; }
    virtual rho::String getDefaultID()
    { 
        if ( m_strDefaultID.length() == 0 )
            setDefaultID(getInitialDefaultID());
        return m_strDefaultID; 
    }

};

class CWearBase: public IWear
{
protected:
    DEFINE_LOGCLASS;


    rho::Hashtable<rho::String, rho::String> m_hashProps;
    rho::Hashtable<rho::String, rho::apiGenerator::CMethodAccessor< IWear > *> m_mapPropAccessors;

public:


    CWearBase();

    virtual void getProperty( const rho::String& propertyName, CMethodResult& oResult);
    virtual void getProperties( const rho::Vector<rho::String>& arrayofNames, CMethodResult& oResult);
    virtual void getAllProperties(CMethodResult& oResult);
    virtual void setProperty( const rho::String& propertyName,  const rho::String& propertyValue, CMethodResult& oResult);
    virtual void setProperties( const rho::Hashtable<rho::String, rho::String>& propertyMap, CMethodResult& oResult);
    virtual void clearAllProperties(CMethodResult& oResult);


    virtual void getSimpleStringProperty(rho::apiGenerator::CMethodResult& oResult);

    virtual void setSimpleStringProperty( const rho::String& simpleStringProperty, rho::apiGenerator::CMethodResult& oResult);


    static CWearBase* getInstance(){ return static_cast< CWearBase* >(CWearFactoryBase::getInstance()->getModuleByID(CWearFactoryBase::getWearSingletonS()->getDefaultID())); }
 

};

extern "C" void Init_Wear_API();


}
