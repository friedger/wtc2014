package com.rho.wear;

import com.rhomobile.rhodes.api.RhoApiFactory;

public class WearFactory
        extends RhoApiFactory< Wear, WearSingleton>
        implements IWearFactory {

    @Override
    protected WearSingleton createSingleton() {
        return new WearSingleton(this);
    }

    @Override
    protected Wear createApiObject(String id) {
        return new Wear(id);
    }
}
