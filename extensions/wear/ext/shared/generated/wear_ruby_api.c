#include "ruby.h"

static VALUE rb_api_mParent;
static VALUE rb_api_mWear;

VALUE rb_Wear_getSimpleStringProperty(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_Wear_def_getSimpleStringProperty(int argc, VALUE *argv);
VALUE rb_Wear_setSimpleStringProperty(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_Wear_def_setSimpleStringProperty(int argc, VALUE *argv);
VALUE rb_s_Wear_enumerate(int argc, VALUE *argv);
VALUE rb_Wear_getPlatformName(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_Wear_def_getPlatformName(int argc, VALUE *argv);
VALUE rb_Wear_calcSumm(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_Wear_def_calcSumm(int argc, VALUE *argv);
VALUE rb_Wear_joinStrings(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_Wear_def_joinStrings(int argc, VALUE *argv);
VALUE rb_Wear_getProperty(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_Wear_def_getProperty(int argc, VALUE *argv);
VALUE rb_Wear_getProperties(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_Wear_def_getProperties(int argc, VALUE *argv);
VALUE rb_Wear_getAllProperties(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_Wear_def_getAllProperties(int argc, VALUE *argv);
VALUE rb_Wear_setProperty(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_Wear_def_setProperty(int argc, VALUE *argv);
VALUE rb_Wear_setProperties(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_Wear_def_setProperties(int argc, VALUE *argv);



VALUE rb_Wear_s_default(VALUE klass);
VALUE rb_Wear_s_setDefault(VALUE klass, VALUE obj);


VALUE getRuby_Wear_Module(){ return rb_api_mWear; }



static void _free_class_object(void *p)
{
    ruby_xfree(p);
}

static VALUE _allocate_class_object(VALUE klass)
{
    VALUE valObj = 0;
    char ** ppString = NULL;
    void* pData = ALLOC(void*);
    memset( pData, 0, sizeof(pData) );
    
	valObj = Data_Wrap_Struct(klass, 0, _free_class_object, pData);

    Data_Get_Struct(valObj, char *, ppString);
    *ppString = xmalloc(10);
    sprintf(*ppString, "%X", valObj);

    return valObj;
}

void Init_RubyAPI_Wear(void)
{

    VALUE tmpParent = Qnil;
    rb_api_mParent = rb_define_module("Rho");
    

	rb_api_mWear = rb_define_class_under(rb_api_mParent, "Wear", rb_cObject);

	rb_define_alloc_func(rb_api_mWear, _allocate_class_object);
    //Constructor should be not available in case of static members
    //rb_undef_alloc_func(rb_api_mWear);

    rb_define_method(rb_api_mWear, "simpleStringProperty", rb_Wear_getSimpleStringProperty, -1);
    rb_define_singleton_method(rb_api_mWear, "simpleStringProperty", rb_s_Wear_def_getSimpleStringProperty, -1);
    rb_define_method(rb_api_mWear, "simpleStringProperty=", rb_Wear_setSimpleStringProperty, -1);
    rb_define_singleton_method(rb_api_mWear, "simpleStringProperty=", rb_s_Wear_def_setSimpleStringProperty, -1);
    rb_define_singleton_method(rb_api_mWear, "enumerate", rb_s_Wear_enumerate, -1);
    rb_define_method(rb_api_mWear, "getPlatformName", rb_Wear_getPlatformName, -1);
    rb_define_singleton_method(rb_api_mWear, "getPlatformName", rb_s_Wear_def_getPlatformName, -1);
    rb_define_method(rb_api_mWear, "calcSumm", rb_Wear_calcSumm, -1);
    rb_define_singleton_method(rb_api_mWear, "calcSumm", rb_s_Wear_def_calcSumm, -1);
    rb_define_method(rb_api_mWear, "joinStrings", rb_Wear_joinStrings, -1);
    rb_define_singleton_method(rb_api_mWear, "joinStrings", rb_s_Wear_def_joinStrings, -1);
    rb_define_method(rb_api_mWear, "getProperty", rb_Wear_getProperty, -1);
    rb_define_singleton_method(rb_api_mWear, "getProperty", rb_s_Wear_def_getProperty, -1);
    rb_define_method(rb_api_mWear, "getProperties", rb_Wear_getProperties, -1);
    rb_define_singleton_method(rb_api_mWear, "getProperties", rb_s_Wear_def_getProperties, -1);
    rb_define_method(rb_api_mWear, "getAllProperties", rb_Wear_getAllProperties, -1);
    rb_define_singleton_method(rb_api_mWear, "getAllProperties", rb_s_Wear_def_getAllProperties, -1);
    rb_define_method(rb_api_mWear, "setProperty", rb_Wear_setProperty, -1);
    rb_define_singleton_method(rb_api_mWear, "setProperty", rb_s_Wear_def_setProperty, -1);
    rb_define_method(rb_api_mWear, "setProperties", rb_Wear_setProperties, -1);
    rb_define_singleton_method(rb_api_mWear, "setProperties", rb_s_Wear_def_setProperties, -1);



    rb_define_singleton_method(rb_api_mWear, "getDefault", rb_Wear_s_default, 0);
    rb_define_singleton_method(rb_api_mWear, "setDefault", rb_Wear_s_setDefault, 1);






}

