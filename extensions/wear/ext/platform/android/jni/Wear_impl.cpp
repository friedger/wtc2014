#include "rhodes.h"
#include "Wear.h"

#include "logging/RhoLog.h"
#undef DEFAULT_LOGCATEGORY
#define DEFAULT_LOGCATEGORY "Wear_impl"

#define WEAR_FACTORY_CLASS "com.rho.wear.WearFactory"

extern "C" void Init_Wear_API(void);

extern "C" void Init_Wear(void)
{
    RAWTRACE(__FUNCTION__);

    JNIEnv *env = jnienv();
    if(env)
    {
        jclass cls = rho_find_class(env, WEAR_FACTORY_CLASS);
        if(!cls)
        {
            RAWLOG_ERROR1("Failed to find java class: %s", WEAR_FACTORY_CLASS);
            return;
        }
        jmethodID midFactory = env->GetMethodID(cls, "<init>", "()V");
        if(!midFactory)
        {
            RAWLOG_ERROR1("Failed to get constructor for java class %s", WEAR_FACTORY_CLASS);
            return;
        }
        jobject jFactory = env->NewObject(cls, midFactory);
        if(env->IsSameObject(jFactory, NULL))
        {
            RAWLOG_ERROR1("Failed to create %s instance", WEAR_FACTORY_CLASS);
            return;
        }
        
        RAWTRACE("Initializing Java factory");

        rho::CWearBase::setJavaFactory(env, jFactory);

        RAWTRACE("Deleting JNI reference");

        env->DeleteLocalRef(jFactory);

        RAWTRACE("Initializing API");

        Init_Wear_API();

        RAWTRACE("Init_Wear succeeded");
    }
    else
    {
        RAWLOG_ERROR("Failed to initialize Wear API: jnienv() is failed");
    }

}

extern "C" void Init_Wear_extension() {
    Init_Wear();
}
