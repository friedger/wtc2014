
(function ($, rho, rhoUtil) {
    'use strict';

    var moduleNS = 'Rho.Wear';
    var apiReq = rhoUtil.apiReqFor(moduleNS);


    // === Wear class definition ===

    function Wear() {
        var id = null;
        this.getId = function () {return id;};

        if (1 == arguments.length && arguments[0][rhoUtil.rhoIdParam()]) {
            if (moduleNS != arguments[0][rhoUtil.rhoClassParam()]) {
                throw "Wrong class instantiation!";
            }
            id = arguments[0][rhoUtil.rhoIdParam()];
        } else {
            id = rhoUtil.nextId();
            // constructor methods are following:
            
        }
    };

    // === Wear instance properties ===

    rhoUtil.createPropsProxy(Wear.prototype, [
        { propName: 'simpleStringProperty', propAccess: 'rw' }
    ], apiReq, function(){ return this.getId(); });

    // === Wear instance methods ===

    rhoUtil.createMethodsProxy(Wear.prototype, [
    
          // function(/* optional function */ oResult)
          { methodName: 'getPlatformName', nativeName: 'getPlatformName', valueCallbackIndex: 0 }
    
          // function(/* int */ a, /* int */ b, /* optional function */ oResult)
        , { methodName: 'calcSumm', nativeName: 'calcSumm', valueCallbackIndex: 2 }
    
          // function(/* const rho::String& */ a, /* const rho::String& */ b, /* optional function */ oResult)
        , { methodName: 'joinStrings', nativeName: 'joinStrings', valueCallbackIndex: 2 }
    
          // function(/* const rho::String& */ propertyName, /* optional function */ oResult)
        , { methodName: 'getProperty', nativeName: 'getProperty', persistentCallbackIndex: 1, valueCallbackIndex: 3 }
    
          // function(/* const rho::Vector<rho::String>& */ arrayofNames, /* optional function */ oResult)
        , { methodName: 'getProperties', nativeName: 'getProperties', persistentCallbackIndex: 1, valueCallbackIndex: 3 }
    
          // function(/* optional function */ oResult)
        , { methodName: 'getAllProperties', nativeName: 'getAllProperties', persistentCallbackIndex: 0, valueCallbackIndex: 2 }
    
          // function(/* const rho::String& */ propertyName, /* const rho::String& */ propertyValue, /* optional function */ oResult)
        , { methodName: 'setProperty', nativeName: 'setProperty', valueCallbackIndex: 2 }
    
          // function(/* const rho::Hashtable<rho::String, rho::String>& */ propertyMap, /* optional function */ oResult)
        , { methodName: 'setProperties', nativeName: 'setProperties', valueCallbackIndex: 1 }
    
    ], apiReq, function(){ return this.getId(); });

    

    rhoUtil.createRawPropsProxy(Wear.prototype, [
    ]);

    // === Wear constants ===

    



    // === Wear static properties ===

    rhoUtil.createPropsProxy(Wear, [
    ], apiReq);

    // === Wear static methods ===

    rhoUtil.createMethodsProxy(Wear, [
    
          // function(/* optional function */ oResult)
          { methodName: 'enumerate', nativeName: 'enumerate', persistentCallbackIndex: 0, valueCallbackIndex: 2 }
    
    ], apiReq);

    // === Wear default instance support ===
    

        rhoUtil.createPropsProxy(Wear, [
            { propName: 'defaultInstance:getDefault:setDefault', propAccess: 'rw', customSet: function(obj) { if(!obj || 'function' != typeof obj.getId){ throw 'Default object should provide getId method!' }; Wear.setDefaultID(obj.getId()); } }
          , { propName: 'defaultID:getDefaultID:setDefaultID', propAccess: 'rw' }
        ], apiReq);

        Wear.getId = function() {
            return Wear.getDefaultID();
        }

        // === Wear default instance properties ===

        rhoUtil.createPropsProxy(Wear, [
            { propName: 'simpleStringProperty', propAccess: 'rw' }
        ], apiReq, function(){ return this.getId(); });

        // === Wear default instance methods ===

        rhoUtil.createMethodsProxy(Wear, [
        
              // function(/* optional function */ oResult)
              { methodName: 'getPlatformName', nativeName: 'getPlatformName', valueCallbackIndex: 0 }
        
              // function(/* int */ a, /* int */ b, /* optional function */ oResult)
            , { methodName: 'calcSumm', nativeName: 'calcSumm', valueCallbackIndex: 2 }
        
              // function(/* const rho::String& */ a, /* const rho::String& */ b, /* optional function */ oResult)
            , { methodName: 'joinStrings', nativeName: 'joinStrings', valueCallbackIndex: 2 }
        
              // function(/* const rho::String& */ propertyName, /* optional function */ oResult)
            , { methodName: 'getProperty', nativeName: 'getProperty', persistentCallbackIndex: 1, valueCallbackIndex: 3 }
        
              // function(/* const rho::Vector<rho::String>& */ arrayofNames, /* optional function */ oResult)
            , { methodName: 'getProperties', nativeName: 'getProperties', persistentCallbackIndex: 1, valueCallbackIndex: 3 }
        
              // function(/* optional function */ oResult)
            , { methodName: 'getAllProperties', nativeName: 'getAllProperties', persistentCallbackIndex: 0, valueCallbackIndex: 2 }
        
              // function(/* const rho::String& */ propertyName, /* const rho::String& */ propertyValue, /* optional function */ oResult)
            , { methodName: 'setProperty', nativeName: 'setProperty', valueCallbackIndex: 2 }
        
              // function(/* const rho::Hashtable<rho::String, rho::String>& */ propertyMap, /* optional function */ oResult)
            , { methodName: 'setProperties', nativeName: 'setProperties', valueCallbackIndex: 1 }
        
        ], apiReq, function(){ return this.getId(); });

        // will reuse already defined methods
        rhoUtil.createRawPropsProxy(Wear, [
        ]);

    

    rhoUtil.namespace(moduleNS, Wear);

    

    

})(Rho.jQuery, Rho, Rho.util);
