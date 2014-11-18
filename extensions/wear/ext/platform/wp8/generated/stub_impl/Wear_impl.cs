using System;
using System.Collections.Generic;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using rhoruntime;

namespace rho {

namespace WearImpl
{
    public class Wear : IWearImpl
    {
        public Wear()
        {
            WearRuntimeComponent _runtime = new WearRuntimeComponent(this);
        }

        public void getSimpleStringProperty(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void setSimpleStringProperty(string simpleStringProperty, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void getPlatformName(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void calcSumm(int a, int b, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void joinStrings(string a, string b, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void getProperty(string propertyName, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void getProperties(IReadOnlyList<string> arrayofNames, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void getAllProperties(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void setProperty(string propertyName, string propertyValue, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void setProperties(IReadOnlyDictionary<string, string> propertyMap, IMethodResult oResult)
        {
            // implement this method in C# here
        }
    }

    public class WearSingleton : IWearSingletonImpl
    {
        public WearSingleton()
        {
            WearSingletonComponent _runtime = new WearSingletonComponent(this);
        }

        public void enumerate(IMethodResult oResult)
        {
            // implement this method in C# here
        }
    }

    public class WearFactory : IWearFactoryImpl
    {
        public IWearImpl getImpl() {
            return new Wear();
        }
        public IWearSingletonImpl getSingletonImpl() {
            return new WearSingleton();
        }
    }
}

}
