package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#else
import openfl.Lib;
#end

#if android
#if openfl_legacy
import openfl.utils.JNI;
#else
import lime.system.JNI;
#end
#end

import openfl.events.FocusEvent;
import com.stencyl.behavior.Script;

import scripts.ByRobinAssets;

class Heyzap {

	private static var initialized:Bool=false;
	private static var gravityMode:String;

	////////////////////////////////////////////////////////////////////////////
	
	private static var __init:String->Void = function(heyzapId:String){};
	private static var __fetchInterstitial:Void->Void = function(){};
	private static var __showInterstitial:Void->Void = function(){};
	private static var __fetchVideo:Void->Void = function(){};
	private static var __showVideo:Void->Void = function(){};
	private static var __fetchRewardedVideo:Void->Void = function(){};
	private static var __showRewardedVideo:Void->Void = function(){};
	private static var __presentMediationDebug:Void->Void = function(){};
	private static var __showBanner:Void->Void = function(){};
	private static var __hideBanner:Void->Void = function(){};
	private static var __setBannerPosition:String->Void = function(gravityMode:String){};
	private static var __setConsent:Bool->Void = function(isGranted:Bool){};
	private static var __getConsent:Void->Bool = function(){return false;};
	
	private static var __bannerLoaded:Dynamic;
	private static var __bannerFailedToLoad:Dynamic;
	private static var __adLoaded:Dynamic;
	private static var __adFailedToLoad:Dynamic;
	private static var __adClosed:Dynamic;
	private static var __adClicked:Dynamic;
	private static var __adShows:Dynamic;
	private static var __videoadLoaded:Dynamic;
	private static var __videoadFailedToLoad:Dynamic;
	private static var __videoadClosed:Dynamic;
	private static var __videoadClicked:Dynamic;
	private static var __videoadShows:Dynamic;
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
		if (!initialized){
			trace("Call init Hezyap first");
			return;
		}
		if (type == 0)
		{
			__fetchInterstitial();
		}
		else if (type == 1)
		{
			__showInterstitial();
		}
	}
	
	public static function videoAd(type:Int) 
	{
		if (!initialized){
			trace("Call init Hezyap first");
			return;
		}
		if (type == 0)
		{
			__fetchVideo();
		}
		else if (type == 1)
		{
			__showVideo();
		}	
	}
	
	public static function rewardedVideoAd(type:Int) 
	{	
		if (!initialized){
			trace("Call init Hezyap first");
			return;
		}
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
		if (!initialized){
			trace("Call init Hezyap first");
			return;
		}
		__presentMediationDebug();
	}
	
	public static function bannerAd(type:Int) 
	{	
		if (!initialized){
			trace("Call init Hezyap first");
			return;
		}
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
		
		if (!initialized){
			trace("Call init Hezyap first");
			return;
		}
		
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

	public static function setConsent(isGranted:Bool) {
		try {
			__setConsent(isGranted);
		} catch(e:Dynamic) {
			trace("SetConsent Exception: "+e);
		}
	}

	public static function getConsent():Bool {

		return __getConsent();
	}
		
	public static function init(){
		
		var heyzapId:String = ByRobinAssets.HZPublisherID;
	
		#if ios
		if(initialized) return;
		initialized = true;
		try{
			// CPP METHOD LINKING
			__init = cpp.Lib.load("heyzap","heyzap_init",1);
			__fetchInterstitial = cpp.Lib.load("heyzap","heyzap_interstitial_fetch",0);
			__showInterstitial = cpp.Lib.load("heyzap","heyzap_interstitial_show",0);
			__fetchVideo = cpp.Lib.load("heyzap","heyzap_video_fetch",0);
			__showVideo = cpp.Lib.load("heyzap","heyzap_video_show",0);
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
			__videoadLoaded = cpp.Lib.load("heyzap","heyzap_videoad_loaded",0);
			__videoadFailedToLoad = cpp.Lib.load("heyzap","heyzap_videoad_failed",0);
			__videoadClosed = cpp.Lib.load("heyzap","heyzap_videoad_closed",0);
			__videoadClicked = cpp.Lib.load("heyzap","heyzap_videoad_clicked",0);
			__videoadShows = cpp.Lib.load("heyzap","heyzap_videoad_shows",0);
			__rewardedadLoaded = cpp.Lib.load("heyzap","heyzap_rewardedad_loaded",0);
			__rewardedadFailedToLoad = cpp.Lib.load("heyzap","heyzap_rewardedad_failed",0);
			__rewardedadClosed = cpp.Lib.load("heyzap","heyzap_rewardedad_closed",0);
			__rewardedadClicked = cpp.Lib.load("heyzap","heyzap_rewardedad_clicked",0);
			__rewardedadShows = cpp.Lib.load("heyzap","heyzap_rewardedad_shows",0);
			__rewardedVideoComplete = cpp.Lib.load("heyzap","heyzap_rewardedvideo_complete",0);
			__rewardedVideoFailToComplete = cpp.Lib.load("heyzap","heyzap_rewardedvideo_failtocomplete",0);
			__setConsent = cpp.Lib.load("heyzap","heyzap_setconsent",1);
			__getConsent = cpp.Lib.load("heyzap","heyzap_getconsent",0);

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
			__init = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "init", "(Ljava/lang/String;)V");
			__fetchInterstitial = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "fetchInterstitial", "()V");
			__showInterstitial = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "showInterstitial", "()V");
			__fetchVideo = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "fetchVideo", "()V");
			__showVideo = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "showVideo", "()V");
			__fetchRewardedVideo = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "fetchRewardedVideo", "()V");
			__showRewardedVideo = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "showRewardedVideo", "()V");
			__presentMediationDebug = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "presentMediationDebug", "()V");
			__showBanner = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "showBanner", "()V");
			__hideBanner = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "hideBanner", "()V");
			__setBannerPosition = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "setBannerPosition", "(Ljava/lang/String;)V");
			__setConsent = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "setUsersConsent", "(Z)V");
			__getConsent = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "getUsersConsent", "()Z");

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
                	__bannerLoaded = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "bannerIsLoaded", "()Z", true);
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
                	__bannerFailedToLoad = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "bannerHasFailedToLoad", "()Z", true);
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
                	__adLoaded = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "adIsLoaded", "()Z", true);
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
                	__adFailedToLoad = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "adFailedToLoad", "()Z", true);
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
                	__adClosed = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "adClosed", "()Z", true);
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
                	__adClicked = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "adClicked", "()Z", true);
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
                	__adShows = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "adShows", "()Z", true);
            	}
            	return __adShows();
            #end
		
		}

        return false;
    }
	
	/////////////////////////////////////////////////////////////////////////////
	
	public static function getVideoAdInfo(info:Int):Bool{
        if (info == 0)
        {
			#if ios
           	 return __videoadLoaded();
            #end
			
			#if android
            	if (__videoadLoaded == null)
            	{
                	__videoadLoaded = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "videoadIsLoaded", "()Z", true);
            	}
            	return __videoadLoaded();
            #end			
	
        }
        else if (info == 1)
        {
			#if ios
           		return __videoadFailedToLoad();
            #end
			
			#if android
            	if (__videoadFailedToLoad == null)
            	{
                	__videoadFailedToLoad = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "videoadFailedToLoad", "()Z", true);
            	}
            	return __videoadFailedToLoad();
            #end
				
        }
		else if (info == 2)
        {
			#if ios
           		return __videoadClosed();
            #end
			
			#if android
            	if (__videoadClosed == null)
            	{
                	__videoadClosed = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "videoadClosed", "()Z", true);
            	}
            	return __videoadClosed();
            #end
		}
        else if (info == 3)
        {
			#if ios
           		return __videoadClicked();
            #end
			
			#if android
            	if (__videoadClicked == null)
            	{
                	__videoadClicked = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "videoadClicked", "()Z", true);
            	}
            	return __videoadClicked();
            #end
		}
		else
		{
			#if ios
           		return __videoadShows();
            #end
			
			#if android
            	if (__videoadShows == null)
            	{
                	__videoadShows = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "videoadShows", "()Z", true);
            	}
            	return __videoadShows();
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
                	__rewardedadLoaded = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedadIsLoaded", "()Z", true);
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
                	__rewardedadFailedToLoad = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedadFailedToLoad", "()Z", true);
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
                	__rewardedadClosed = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedadClosed", "()Z", true);
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
                	__rewardedadClicked = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedadClicked", "()Z", true);
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
                	__rewardedadShows = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedadShows", "()Z", true);
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
                	__rewardedVideoComplete = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedVideoComplete", "()Z", true);
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
                	__rewardedVideoFailToComplete = JNI.createStaticMethod("com/byrobin/heyzap/HeyzapEx", "rewardedVideoFailToComplete", "()Z", true);
            	}
            	return __rewardedVideoFailToComplete();
            #end
				
        }
        return false;
    }
		
}