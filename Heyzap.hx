package;

import openfl.Lib;
import com.stencyl.behavior.Script;

class Heyzap {

	private static var initialized:Bool=false;

	////////////////////////////////////////////////////////////////////////////
	
	private static var __init:String->Void = function(heyzapId:String){};
	private static var __showInterstitial:Void->Void = function(){};
	private static var __fetchVideo:Void->Void = function(){};
	private static var __showVideo:Void->Void = function(){};
	private static var __fetchRewardedVideo:Void->Void = function(){};
	private static var __showRewardedVideo:Void->Void = function(){};
	private static var __presentMediationDebug:Void->Void = function(){};
	
	private static var __adLoaded:Dynamic;
	private static var __adFailedToLoad:Dynamic;
	private static var __adClosed:Dynamic;
	private static var __adClicked:Dynamic;
	private static var __rewardedVideoComplete:Dynamic;
	private static var __rewardedVideoFailToComplete:Dynamic;


	////////////////////////////////////////////////////////////////////////////

	private static var lastTimeInterstitial:Int = -60*1000;
	private static var displayCallsCounter:Int = 0;
	
	////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////

	public static function showInterstitial(minInterval:Int=60, minCallsBeforeDisplay:Int=0) {
		displayCallsCounter++;
		if( (Lib.getTimer()-lastTimeInterstitial)<(minInterval*1000) ) return;
		if( minCallsBeforeDisplay > displayCallsCounter ) return;
		displayCallsCounter = 0;
		lastTimeInterstitial = Lib.getTimer();
		try{
			__showInterstitial();
		}catch(e:Dynamic){
			trace("ShowInterstitial Exception: "+e);
		}
	}
	
	public static function fetchVideo() 
	{	
			__fetchVideo();
	}
	
	public static function showVideo() 
	{	
			__showVideo();
	}
	
	public static function fetchRewardedVideo() 
	{	
			__fetchRewardedVideo();
	}
	
	public static function showRewardedVideo() 
	{	
			__showRewardedVideo();
	}
	
	public static function presentMediationDebug() 
	{	
			__presentMediationDebug();
	}
	
	
	public static function init(heyzapId:String){
	
		#if ios
		if(initialized) return;
		initialized = true;
		try{
			// CPP METHOD LINKING
			__init = cpp.Lib.load("heyzap","heyzap_init",1);
			__showInterstitial = cpp.Lib.load("heyzap","heyzap_interstitial_show",0);
			__fetchVideo = cpp.Lib.load("heyzap","heyzap_video_fetch",0);
			__showVideo = cpp.Lib.load("heyzap","heyzap_video_show",0);
			__fetchRewardedVideo = cpp.Lib.load("heyzap","heyzap_rewardedvideo_fetch",0);
			__showRewardedVideo = cpp.Lib.load("heyzap","heyzap_rewardedvideo_show",0);
			__presentMediationDebug = cpp.Lib.load("heyzap","heyzap_presentmediation_debug",0);
			__adLoaded = cpp.Lib.load("heyzap","heyzap_ad_loaded",0);
			__adFailedToLoad = cpp.Lib.load("heyzap","heyzap_ad_failed",0);
			__adClosed = cpp.Lib.load("heyzap","heyzap_ad_closed",0);
			__adClicked = cpp.Lib.load("heyzap","heyzap_ad_clicked",0);
			__rewardedVideoComplete = cpp.Lib.load("heyzap","heyzap_rewardedvideo_complete",0);
			__rewardedVideoFailToComplete = cpp.Lib.load("heyzap","heyzap_rewardedvideo_failtocomplete",0);

			__init(heyzapId);
		}catch(e:Dynamic){
			trace("iOS INIT Exception: "+e);
		}
		#end
		
		#if android
		if(initialized) return;
		initialized = true;
		try{
			// JNI METHOD LINKING
			__init = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "init", "(Ljava/lang/String;)V");
			__showInterstitial = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "showInterstitial", "()V");
			__fetchVideo = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "fetchVideo", "()V");
			__showVideo = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "showVideo", "()V");
			__fetchRewardedVideo = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "fetchRewardedVideo", "()V");
			__showRewardedVideo = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "showRewardedVideo", "()V");
			__presentMediationDebug = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "presentMediationDebug", "()V");

			__init(heyzapId);
		}catch(e:Dynamic){
			trace("Android INIT Exception: "+e);
		}
		#end
	}
	
	public static function getAdInfo(info:Int):Bool{
        if (info == 0)
        {
			#if ios
           	 return __adLoaded();
            #end
			
			#if android
            	if (__adLoaded == null)
            	{
                	__adLoaded = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "adIsLoaded", "()Z", true);
            	}
            	return __adLoaded();
            #end			
	
        }
        else if (info == 1)
        {
			#if ios
           		return __adFailedToLoad();
            #end
			
			#if android
            	if (__adFailedToLoad == null)
            	{
                	__adFailedToLoad = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "adFailedToLoad", "()Z", true);
            	}
            	return __adFailedToLoad();
            #end
				
        }else if (info == 2)
        {
			#if ios
           		return __adClosed();
            #end
			
			#if android
            	if (__adClosed == null)
            	{
                	__adClosed = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "adClosed", "()Z", true);
            	}
            	return __adClosed();
            #end
		}
        else
        {
			#if ios
           		return __adClicked();
            #end
			
			#if android
            	if (__adClicked == null)
            	{
                	__adClicked = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "adClicked", "()Z", true);
            	}
            	return __adClicked();
            #end
		}

        return false;
    }
	
	public static function getRewardedVideoInfo(info:Int):Bool{
        if (info == 0)
        {
			#if ios
           	 return __rewardedVideoComplete();
            #end
			
			#if android
            	if (__rewardedVideoComplete == null)
            	{
                	__rewardedVideoComplete = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedVideoComplete", "()Z", true);
            	}
            	return __rewardedVideoComplete();
            #end			
	
        }
        else if (info == 1)
        {
			#if ios
           		return __rewardedVideoFailToComplete();
            #end
			
			#if android
            	if (__rewardedVideoFailToComplete == null)
            	{
                	__rewardedVideoFailToComplete = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedVideoFailToComplete", "()Z", true);
            	}
            	return __rewardedVideoFailToComplete();
            #end
				
        }
        return false;
    }		
}