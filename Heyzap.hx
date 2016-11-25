package;

import openfl.Lib;
import openfl.events.FocusEvent;
import com.stencyl.behavior.Script;

class Heyzap {

	private static var initialized:Bool=false;
	private static var gravityMode:String;

	////////////////////////////////////////////////////////////////////////////
	
	private static var __init:String->Void = function(heyzapId:String){};
	private static var __fetchInterstitial:Void->Void = function(){};
	private static var __showInterstitial:Void->Void = function(){};
	private static var __fetchRewardedVideo:Void->Void = function(){};
	private static var __showRewardedVideo:Void->Void = function(){};
	private static var __presentMediationDebug:Void->Void = function(){};
	private static var __showBanner:Void->Void = function(){};
	private static var __hideBanner:Void->Void = function(){};
	private static var __setBannerPosition:String->Void = function(gravityMode:String){};
	
	private static var __bannerLoaded:Dynamic;
	private static var __bannerFailedToLoad:Dynamic;
	private static var __adLoaded:Dynamic;
	private static var __adFailedToLoad:Dynamic;
	private static var __adClosed:Dynamic;
	private static var __adClicked:Dynamic;
	private static var __adShows:Dynamic;
	private static var __rewardedadLoaded:Dynamic;
	private static var __rewardedadFailedToLoad:Dynamic;
	private static var __rewardedadClosed:Dynamic;
	private static var __rewardedadClicked:Dynamic;
	private static var __rewardedadShows:Dynamic;
	private static var __rewardedVideoComplete:Dynamic;
	private static var __rewardedVideoFailToComplete:Dynamic;

	////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////

	public static function interstitialAd(type:Int) 
	{
		if (type == 0)
		{
			__fetchInterstitial();
		}
		else if (type == 1)
		{
			__showInterstitial();
		}
	}
	
	public static function rewardedVideoAd(type:Int) 
	{	
		if (type == 0)
		{
			__fetchRewardedVideo();
		}
		else if (type == 1)
		{
			__showRewardedVideo();
		}	
	}
	
	public static function presentMediationDebug() 
	{
		__presentMediationDebug();
	}
	
	public static function bannerAd(type:Int) 
	{	
		if (type == 0)
		{
			__showBanner();
		}
		else if (type == 1)
		{
			__hideBanner();
		}	
	}
	
	public static function setBannerPosition(position:Int) {
	
		if(position == 1)
		{
			gravityMode = "TOP";
		}else
		{
			gravityMode = "BOTTOM";
		}
		
		try{
			__setBannerPosition(gravityMode);
		}catch(e:Dynamic){
			trace("setBannerPosition Exception: "+e);
		}
	}
	
	
	public static function init(heyzapId:String){
	
		#if ios
		if(initialized) return;
		initialized = true;
		try{
			// CPP METHOD LINKING
			__init = cpp.Lib.load("heyzap","heyzap_init",1);
			__fetchInterstitial = cpp.Lib.load("heyzap","heyzap_interstitial_fetch",0);
			__showInterstitial = cpp.Lib.load("heyzap","heyzap_interstitial_show",0);
			__fetchRewardedVideo = cpp.Lib.load("heyzap","heyzap_rewardedvideo_fetch",0);
			__showRewardedVideo = cpp.Lib.load("heyzap","heyzap_rewardedvideo_show",0);
			__presentMediationDebug = cpp.Lib.load("heyzap","heyzap_presentmediation_debug",0);
			__showBanner = cpp.Lib.load("heyzap","heyzap_show_banner",0);
			__hideBanner = cpp.Lib.load("heyzap","heyzap_hide_banner",0);
			__setBannerPosition = cpp.Lib.load("heyzap","heyzap_banner_move",1);
			__bannerLoaded = cpp.Lib.load("heyzap","heyzap_banner_loaded",0);
			__bannerFailedToLoad = cpp.Lib.load("heyzap","heyzap_banner_failed",0);
			__adLoaded = cpp.Lib.load("heyzap","heyzap_ad_loaded",0);
			__adFailedToLoad = cpp.Lib.load("heyzap","heyzap_ad_failed",0);
			__adClosed = cpp.Lib.load("heyzap","heyzap_ad_closed",0);
			__adClicked = cpp.Lib.load("heyzap","heyzap_ad_clicked",0);
			__adShows = cpp.Lib.load("heyzap","heyzap_ad_shows",0);
			__rewardedadLoaded = cpp.Lib.load("heyzap","heyzap_rewardedad_loaded",0);
			__rewardedadFailedToLoad = cpp.Lib.load("heyzap","heyzap_rewardedad_failed",0);
			__rewardedadClosed = cpp.Lib.load("heyzap","heyzap_rewardedad_closed",0);
			__rewardedadClicked = cpp.Lib.load("heyzap","heyzap_rewardedad_clicked",0);
			__rewardedadShows = cpp.Lib.load("heyzap","heyzap_rewardedad_shows",0);
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
			__fetchInterstitial = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "fetchInterstitial", "()V");
			__showInterstitial = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "showInterstitial", "()V");
			__fetchRewardedVideo = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "fetchRewardedVideo", "()V");
			__showRewardedVideo = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "showRewardedVideo", "()V");
			__presentMediationDebug = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "presentMediationDebug", "()V");
			__showBanner = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "showBanner", "()V");
			__hideBanner = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "hideBanner", "()V");
			__setBannerPosition = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "setBannerPosition", "(Ljava/lang/String;)V");

			__init(heyzapId);
		}catch(e:Dynamic){
			trace("Android INIT Exception: "+e);
		}
		#end
	}
	
	/////////////////////////////////////////////////////////////////////////////
	
	public static function getBannerInfo(info:Int):Bool{
		if (info == 0)
        {
			#if ios
           	 return __bannerLoaded();
            #end
			
			#if android
            	if (__bannerLoaded == null)
            	{
                	__bannerLoaded = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "bannerIsLoaded", "()Z", true);
            	}
            	return __bannerLoaded();
            #end			
	
        }
        else if (info == 1)
        {
			#if ios
           		return __bannerFailedToLoad();
            #end
			
			#if android
            	if (__bannerFailedToLoad == null)
            	{
                	__bannerFailedToLoad = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "bannerHasFailedToLoad", "()Z", true);
            	}
            	return __bannerFailedToLoad();
            #end
				
        }
		 return false;
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
				
        }
		else if (info == 2)
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
        else if (info == 3)
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
		else
		{
			#if ios
           		return __adShows();
            #end
			
			#if android
            	if (__adShows == null)
            	{
                	__adShows = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "adShows", "()Z", true);
            	}
            	return __adShows();
            #end
		
		}

        return false;
    }
	
	///////////////////////////////////////////////////////////////////////////////
	
	public static function getRewardedVideoInfo(info:Int):Bool{
        
		if (info == 0)
        {
			#if ios
           	 return __rewardedadLoaded();
            #end
			
			#if android
            	if (__rewardedadLoaded == null)
            	{
                	__rewardedadLoaded = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedadIsLoaded", "()Z", true);
            	}
            	return __rewardedadLoaded();
            #end			
	
        }
        else if (info == 1)
        {
			#if ios
           		return __rewardedadFailedToLoad();
            #end
			
			#if android
            	if (__rewardedadFailedToLoad == null)
            	{
                	__rewardedadFailedToLoad = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedadFailedToLoad", "()Z", true);
            	}
            	return __rewardedadFailedToLoad();
            #end
				
        }
		else if (info == 2)
        {
			#if ios
           		return __rewardedadClosed();
            #end
			
			#if android
            	if (__rewardedadClosed == null)
            	{
                	__rewardedadClosed = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedadClosed", "()Z", true);
            	}
            	return __rewardedadClosed();
            #end
		}
        else if (info == 3)
        {
			#if ios
           		return __rewardedadClicked();
            #end
			
			#if android
            	if (__rewardedadClicked == null)
            	{
                	__rewardedadClicked = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedadClicked", "()Z", true);
            	}
            	return __rewardedadClicked();
            #end
		}
		else if (info == 4)
		{
			#if ios
           		return __rewardedadShows();
            #end
			
			#if android
            	if (__rewardedadShows == null)
            	{
                	__rewardedadShows = openfl.utils.JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedadShows", "()Z", true);
            	}
            	return __rewardedadShows();
            #end
		
		}
		else if (info == 5)
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
        else
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