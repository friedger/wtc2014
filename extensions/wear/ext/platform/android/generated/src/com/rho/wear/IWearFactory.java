package com.rho.wear;

import com.rhomobile.rhodes.api.IRhoApiFactory;
import com.rhomobile.rhodes.api.IRhoApiSingletonFactory;

public interface IWearFactory
    extends IRhoApiFactory<IWear>,
            IRhoApiSingletonFactory<IWearSingleton> {

    @Override
    IWearSingleton getApiSingleton();

    @Override
    IWear getApiObject(String id);

}
