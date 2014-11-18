package com.rho.wear;

import java.util.List;
import java.util.Map;

import com.rhomobile.rhodes.api.IMethodResult;

import com.rhomobile.rhodes.api.RhoApiDefaultId;

public abstract class WearSingletonBase 
    extends RhoApiDefaultId<IWear, IWearFactory>  {

    public WearSingletonBase(IWearFactory factory) {
        super(factory);
    } 

    public static class enumerateTask implements Runnable {
        private IWearSingleton mApiSingleton; 
        private IMethodResult mResult;

        public enumerateTask(IWearSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.enumerate( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    
}
