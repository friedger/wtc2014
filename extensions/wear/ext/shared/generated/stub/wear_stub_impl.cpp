//
//  WearImpl.cpp
#include "generated/cpp/WearBase.h"
#include "common/RhoStd.h"
#include "common/AutoPointer.h"
#include "common/RhodesApp.h"
#include "common/RhoConf.h"
#include "logging/RhoLog.h"

namespace rho {
    
    using namespace apiGenerator;
    using namespace common;
    
    class CWearSingletonImpl: public CWearSingletonBase
    {
    public:
        
        CWearSingletonImpl(): CWearSingletonBase(){}
        
        //methods
        // enumerate  
        virtual void enumerate(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("enumerate","Wear");
            
        } 

    };
    
    class CWearImpl : public CWearBase
    {
    public:
        virtual ~CWearImpl() {}

        //methods

        virtual void getSimpleStringProperty(rho::apiGenerator::CMethodResult& oResult) {

        } 

        virtual void setSimpleStringProperty( const rho::String& simpleStringProperty, rho::apiGenerator::CMethodResult& oResult) {

        } 

        virtual void getPlatformName(rho::apiGenerator::CMethodResult& oResult) {

        } 

        virtual void calcSumm( int a,  int b, rho::apiGenerator::CMethodResult& oResult) {

        } 

        virtual void joinStrings( const rho::String& a,  const rho::String& b, rho::apiGenerator::CMethodResult& oResult) {

        } 

        virtual void getProperty( const rho::String& propertyName, rho::apiGenerator::CMethodResult& oResult) {

        } 

        virtual void getProperties( const rho::Vector<rho::String>& arrayofNames, rho::apiGenerator::CMethodResult& oResult) {

        } 

        virtual void getAllProperties(rho::apiGenerator::CMethodResult& oResult) {

        } 

        virtual void setProperty( const rho::String& propertyName,  const rho::String& propertyValue, rho::apiGenerator::CMethodResult& oResult) {

        } 

        virtual void setProperties( const rho::Hashtable<rho::String, rho::String>& propertyMap, rho::apiGenerator::CMethodResult& oResult) {

        } 

    };
    
    ////////////////////////////////////////////////////////////////////////
    
    class CWearFactory: public CWearFactoryBase    {
    public:
        CWearFactory(){}
        
        IWearSingleton* createModuleSingleton()
        { 
            return new CWearSingletonImpl();
        }
        
        virtual IWear* createModuleByID(const rho::String& strID){ return new CWearImpl(); };
        
    };
    
}

extern "C" void Init_Wear_extension()
{
    rho::CWearFactory::setInstance( new rho::CWearFactory() );
    rho::Init_Wear_API();
    
}