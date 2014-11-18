#pragma once

#include "../../../../shared/generated/cpp/WearBase.h"
#include "WearRuntime.h"


namespace rho {
class CWearFactory: public CWearFactoryBase
{
private:
    static rhoruntime::IWearFactoryImpl^ _impl;
public:
    static void setImpl(rhoruntime::IWearFactoryImpl^ impl) { _impl = impl; }
    ~CWearFactory(){}
    virtual IWearSingleton* createModuleSingleton();
    virtual IWear* createModuleByID(const rho::String& strID);
};

}
