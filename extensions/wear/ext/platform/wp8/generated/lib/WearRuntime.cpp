// WearRuntime.cpp
#include "WearRuntime.h"
#include "WearFactory.h"

using namespace Platform;
using namespace rho::apiGenerator;

using namespace rho;

namespace rhoruntime
{

WearRuntimeComponent::WearRuntimeComponent(IWearImpl^ impl):
    _impl(impl)
{
    // TODO: implement runtime component constructor
}

WearSingletonComponent::WearSingletonComponent(IWearSingletonImpl^ impl):
    _impl(impl)
{
    // TODO: implement singleton component constructor
}

void WearRuntimeComponent::getSimpleStringProperty(IMethodResult^ oResult)
{
    _impl->getSimpleStringProperty(oResult);
}

void WearRuntimeComponent::setSimpleStringProperty(Platform::String^ simpleStringProperty, IMethodResult^ oResult)
{
    _impl->setSimpleStringProperty(simpleStringProperty, oResult);
}

void WearSingletonComponent::enumerate(IMethodResult^ oResult)
{
    _impl->enumerate(oResult);
}

void WearRuntimeComponent::getPlatformName(IMethodResult^ oResult)
{
    _impl->getPlatformName(oResult);
}

void WearRuntimeComponent::calcSumm(int a, int b, IMethodResult^ oResult)
{
    _impl->calcSumm(a, b, oResult);
}

void WearRuntimeComponent::joinStrings(Platform::String^ a, Platform::String^ b, IMethodResult^ oResult)
{
    _impl->joinStrings(a, b, oResult);
}

void WearRuntimeComponent::getProperty(Platform::String^ propertyName, IMethodResult^ oResult)
{
    _impl->getProperty(propertyName, oResult);
}

void WearRuntimeComponent::getProperties(Windows::Foundation::Collections::IVectorView<Platform::String^>^ arrayofNames, IMethodResult^ oResult)
{
    _impl->getProperties(arrayofNames, oResult);
}

void WearRuntimeComponent::getAllProperties(IMethodResult^ oResult)
{
    _impl->getAllProperties(oResult);
}

void WearRuntimeComponent::setProperty(Platform::String^ propertyName, Platform::String^ propertyValue, IMethodResult^ oResult)
{
    _impl->setProperty(propertyName, propertyValue, oResult);
}

void WearRuntimeComponent::setProperties(Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ propertyMap, IMethodResult^ oResult)
{
    _impl->setProperties(propertyMap, oResult);
}

void WearFactoryComponent::setImpl(IWearFactoryImpl^ impl)
{
    CWearFactory::setImpl(impl);
}

}