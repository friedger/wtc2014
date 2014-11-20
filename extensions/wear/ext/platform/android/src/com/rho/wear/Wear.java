package com.rho.wear;

import java.util.Map;

import com.rhomobile.rhodes.api.IMethodResult;
import com.rhomobile.rhodes.api.MethodResult;

public class Wear extends WearBase implements IWear {
    
    public Wear(String id) {
        super(id);
    }


    @Override
    public void getPlatformName(IMethodResult result) {
          result.set("Android");	
    }


    @Override
    public void calcSumm(int a, int b, IMethodResult result) {
          result.set(a+b);
    }

    @Override
    public void joinStrings(String a, String b, IMethodResult result) {
          result.set(a+b);
    }

    public void notify(NotificationDetails details, IMethodResult result){
//    	NotificationMangerCompat notificationManager = NotificationManagerCompat.from(RhoService.getContext());
//    	Notification notification = buildNotification(details);
//    	noficationManger.notify(notification);
    }
    
//    public Notification buildNotification(NotificationDetails details){
//    	WearExtender extender = new WearExtender();
//    	
//    	Builder builder = new NotificationCompat.Builder()
//    	  .setSmallIcon()
//    	  .extend(extender);    	  
//    }
    
    public static class NotificationDetails {
    	public String title;
    	public String message;
    	public boolean vibrate;
    }    
}