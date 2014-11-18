#pragma once

#include "../../../../shared/generated/cpp/IWear.h"
#include "api_generator/wp8/IMethodResult.h"

namespace rhoruntime
{
    public interface class IWearImpl
    {
    public:
        void getSimpleStringProperty(IMethodResult^ oResult);
        void setSimpleStringProperty(Platform::String^ simpleStringProperty, IMethodResult^ oResult);
        void getPlatformName(IMethodResult^ oResult);
        void calcSumm(int a, int b, IMethodResult^ oResult);
        void joinStrings(Platform::String^ a, Platform::String^ b, IMethodResult^ oResult);
        void getProperty(Platform::String^ propertyName, IMethodResult^ oResult);
        void getProperties(Windows::Foundation::Collections::IVectorView<Platform::String^>^ arrayofNames, IMethodResult^ oResult);
        void getAllProperties(IMethodResult^ oResult);
        void setProperty(Platform::String^ propertyName, Platform::String^ propertyValue, IMethodResult^ oResult);
        void setProperties(Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ propertyMap, IMethodResult^ oResult);
    };

    public interface class IWearSingletonImpl
    {
    public:
        void enumerate(IMethodResult^ oResult);
    };
    public interface class IWearFactoryImpl
    {
    public:
        IWearImpl^ getImpl();
        IWearSingletonImpl^ getSingletonImpl();
    };

    public ref class WearRuntimeComponent sealed: public IWearImpl
    {
    public:
        WearRuntimeComponent(IWearImpl^ impl);
        virtual void getSimpleStringProperty(IMethodResult^ oResult);
        virtual void setSimpleStringProperty(Platform::String^ simpleStringProperty, IMethodResult^ oResult);
        virtual void getPlatformName(IMethodResult^ oResult);
        virtual void calcSumm(int a, int b, IMethodResult^ oResult);
        virtual void joinStrings(Platform::String^ a, Platform::String^ b, IMethodResult^ oResult);
        virtual void getProperty(Platform::String^ propertyName, IMethodResult^ oResult);
        virtual void getProperties(Windows::Foundation::Collections::IVectorView<Platform::String^>^ arrayofNames, IMethodResult^ oResult);
        virtual void getAllProperties(IMethodResult^ oResult);
        virtual void setProperty(Platform::String^ propertyName, Platform::String^ propertyValue, IMethodResult^ oResult);
        virtual void setProperties(Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ propertyMap, IMethodResult^ oResult);
    private:
        IWearImpl^ _impl;
    };

    public ref class WearSingletonComponent sealed: public IWearSingletonImpl
    {
    public:
        WearSingletonComponent(IWearSingletonImpl^ impl);
        virtual void enumerate(IMethodResult^ oResult);
    private:
        IWearSingletonImpl^ _impl;
    };

    public ref class WearFactoryComponent sealed
    {
    public:
        static void setImpl(IWearFactoryImpl^ impl);
    };
}
