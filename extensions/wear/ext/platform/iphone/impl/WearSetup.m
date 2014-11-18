#import <Foundation/Foundation.h>
#include "common/app_build_capabilities.h"

extern void Init_Wear_API();

void Init_Wear_extension()
{
    Init_Wear_API();
}