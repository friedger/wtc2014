package com.rho.wear;

public class WearFactorySingleton {
    private static IWearFactory mFactory;
    public static void setInstance(IWearFactory factory) {
        mFactory = factory;
    }
    public static IWearFactory getInstance() {
        return mFactory;
    }
}
