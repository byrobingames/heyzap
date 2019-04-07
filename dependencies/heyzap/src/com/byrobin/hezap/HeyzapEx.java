/*
 *
 * Created by Robin Schaafsma
 * www.byrobingames.com
 *
 */

package com.byrobin.heyzap;

import com.heyzap.sdk.ads.HeyzapAds;
import com.heyzap.sdk.ads.IncentivizedAd;
import com.heyzap.sdk.ads.InterstitialAd;
import com.heyzap.sdk.ads.VideoAd;
import com.heyzap.sdk.ads.BannerAdView;
import com.heyzap.sdk.ads.HeyzapAds.BannerListener;
import com.heyzap.sdk.ads.HeyzapAds.BannerError;


import android.annotation.TargetApi;
import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Toast;
import android.util.Log;
import android.content.*;
import android.content.Context;
import android.content.SharedPreferences;

import android.view.Gravity;
import android.view.animation.Animation;
import android.view.animation.AlphaAnimation;
import android.view.ViewGroup.LayoutParams;
import android.widget.LinearLayout;
import android.view.ViewGroup;

import org.haxe.extension.Extension;

public class HeyzapEx extends Extension {


	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
    private static boolean heyzapInitialized = false;
    private static boolean adLoaded = false;
    private static boolean adFailedToLoad = false;
    private static boolean adClicked =false;
    private static boolean adClosed =false;
    private static boolean adShows =false;
    private static boolean videoadLoaded = false;
    private static boolean videoadFailedToLoad = false;
    private static boolean videoadClicked =false;
    private static boolean videoadClosed =false;
    private static boolean videoadShows =false;
    private static boolean rewardedadLoaded = false;
    private static boolean rewardedadFailedToLoad = false;
    private static boolean rewardedadClicked =false;
    private static boolean rewardedadClosed =false;
    private static boolean rewardedadShows =false;
    private static boolean completeRewardedVideo =false;
    private static boolean failToCompleteRewardedVideo =false;
	private static String HeyzapId=null;

    private static BannerAdView banner;
    private static LinearLayout layout;
    private static boolean bannerInitialize = false;
    private static boolean bannerLoaded = false;
    private static boolean bannerFailedToLoad = false;
    private static int gravity=Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;

	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////

	static public void init(final String HeyzapId){
		HeyzapEx.HeyzapId=HeyzapId;
		
		Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run() 
			{ 
			
                            Log.d("HeyzapEx","Init Heyzap");
                            HeyzapAds.start(HeyzapId,Extension.mainActivity, HeyzapAds.DISABLE_AUTOMATIC_FETCH);

                            setupCallbacks();

                            heyzapInitialized = true;
                
			}
		});	
	}
    
    static public void showBanner() {
        Log.d("HeyzapEx","showbanner Begin");
        if(HeyzapId=="") return;
        if(!heyzapInitialized){
            Log.d("HeyzapEx","Heyzap not started, call init first");
            return;
        }
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {
                if(bannerInitialize)
                {
                    layout.setVisibility(View.VISIBLE);
                    
                    Animation animation1 = new AlphaAnimation(0.0f, 1.0f);
                    animation1.setDuration(1000);
                    layout.startAnimation(animation1);
                    
                }else{
                    initBanner();
                }
            }
        });
        Log.d("HeyzapEx","showbanner End");
    }
    
    static public void hideBanner() {
        Log.d("HeyzapEx","Hide banner Begin");
        if(HeyzapId=="") return;
        if(!heyzapInitialized){
            Log.d("HeyzapEx","Heyzap not started, call init first");
            return;
        }
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {
                if(bannerInitialize)
                {
                    Animation animation1 = new AlphaAnimation(1.0f, 0.0f);
                    animation1.setDuration(1000);
                    layout.startAnimation(animation1);
                    
                    final Handler handler = new Handler();
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            layout.setVisibility(View.GONE);
                        }
                    }, 1000);
                    
                }else{
                    initBanner();
                }
            }
        });
        Log.d("HeyzapEx","Hide Banner End");
    }
    
    static public void setBannerPosition(final String gravityMode)
    {
        if(!heyzapInitialized){
            Log.d("HeyzapEx","Heyzap not started, call init first");
            return;
        }
        mainActivity.runOnUiThread(new Runnable()
                                   {
            public void run()
            {
                
                if(gravityMode.equals("TOP"))
                {
                    if(banner==null)
                    {
                        gravity=Gravity.TOP | Gravity.CENTER_HORIZONTAL;
                    }else
                    {
                        gravity=Gravity.TOP | Gravity.CENTER_HORIZONTAL;
                        layout.setGravity(gravity);
                    }
                }else
                {
                    if(banner==null)
                    {
                        gravity=Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
                    }else
                    {
                        gravity=Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
                        layout.setGravity(gravity);
                    }
                }
            }
        });
    }

    static public void fetchInterstitial() {
        Log.d("HeyzapEx","Fetch Interstitial Begin");
        if(HeyzapId=="") return;
        if(!heyzapInitialized){
            Log.d("HeyzapEx","Heyzap not started, call init first");
            return;
        }
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {
                InterstitialAd.fetch("interstitial");
            }
        });
        Log.d("HeyzapEx","Fetch Interstitial End");
    }
    
	static public void showInterstitial() {
        Log.d("HeyzapEx","Show Interstitial Begin");
		if(HeyzapId=="") return;
                if(!heyzapInitialized){
                    Log.d("HeyzapEx","Heyzap not started, call init first");
                    return;
                }
		Extension.mainActivity.runOnUiThread(new Runnable() {
			public void run()
            {
                
                if(InterstitialAd.isAvailable("interstitial"))
                {
                    InterstitialAd.display(Extension.mainActivity, "interstitial");
                }
                
            }
		});
		Log.d("HeyzapEx","Show Interstitial End");
	}
    
    static public void fetchVideo() {
        Log.d("HeyzapEx","Fetch Video Begin");
        if(HeyzapId=="") return;
        if(!heyzapInitialized){
            Log.d("HeyzapEx","Heyzap not started, call init first");
            return;
        }
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {
                VideoAd.fetch("video");
            }
        });
        Log.d("HeyzapEx","Fetch Video End");
    }
    
    static public void showVideo() {
        Log.d("HeyzapEx","Show Video Begin");
        if(HeyzapId=="") return;
        if(!heyzapInitialized){
            Log.d("HeyzapEx","Heyzap not started, call init first");
            return;
        }
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {
                
                if(VideoAd.isAvailable("video"))
                {
                    VideoAd.display(Extension.mainActivity, "video");
                }
                
            }
        });
        Log.d("HeyzapEx","Show Video End");
    }

    
	
    static public void fetchRewardedVideo() {
        Log.d("HeyzapEx","Fetch Rewarded Video Begin");
        if(HeyzapId=="") return;
        if(!heyzapInitialized){
            Log.d("HeyzapEx","Heyzap not started, call init first");
            return;
        }
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {
                IncentivizedAd.fetch("rewarded");
            }
        });
        Log.d("HeyzapEx","Fetch Rewarded Video End");
    }
    
    static public void showRewardedVideo() {
        Log.d("HeyzapEx","Show Rewarded Video Begin");
        if(HeyzapId=="") return;
        if(!heyzapInitialized){
            Log.d("HeyzapEx","Heyzap not started, call init first");
            return;
        }
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {
                
                if(IncentivizedAd.isAvailable("rewarded"))
                {
                    IncentivizedAd.display(Extension.mainActivity, "rewarded");
                }
                
            }
        });
        Log.d("HeyzapEx","Show Rewarded Video End");
    }
    
    static public void presentMediationDebug(){
        if(!heyzapInitialized){
            Log.d("HeyzapEx","Heyzap not started, call init first");
            return;
        }
        Log.d("HeyzapEx","Show presentMediationDebug Begin");

        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {

                    HeyzapAds.startTestActivity(Extension.mainActivity);
                
            }
        });
        Log.d("HeyzapEx","Show presentMediationDebug End");
        
    }
    
    static public void initBanner(){
        if(!heyzapInitialized){
            Log.d("HeyzapEx","Heyzap not started, call init first");
            return;
        }
        if(bannerInitialize) return;
        if(banner==null){ // if this is the first time we call this function
            layout = new LinearLayout(mainActivity);
            layout.setGravity(gravity);
        } else {
            ViewGroup parent = (ViewGroup) layout.getParent();
            parent.removeView(layout);
            layout.removeView(banner);
            banner.destroy();
        }
        
        banner = new BannerAdView(mainActivity);
        banner.setBannerListener(new BannerListener() {
            @Override
            public void onAdClicked(BannerAdView b) {
                // The ad has been clicked by the user.
            }
            @Override
            public void onAdLoaded(BannerAdView b) {
                // The ad has been loaded.
                bannerInitialize = true;
                bannerLoaded = true;
                bannerFailedToLoad = false;
            }
            @Override
            public void onAdError(BannerAdView b, BannerError bannerError) {
                // There was an error loading the ad.
                bannerInitialize = false;
                bannerLoaded = false;
                bannerFailedToLoad = true;
            }
        });
        
        mainActivity.addContentView(layout, new LayoutParams(LayoutParams.FILL_PARENT, LayoutParams.FILL_PARENT));
        layout.addView(banner);
        layout.bringToFront();
        
        banner.load();
    }

    static public void setUsersConsent(final boolean isGranted){


        HeyzapAds.setGdprConsent(isGranted, mainContext);

        SharedPreferences.Editor editor = mainActivity.getPreferences(Context.MODE_PRIVATE).edit();
        if(editor == null) {
                Log.d("HezapEx", "HezapEx Failed to write user consent to preferences");
                return;
        }

        editor.putBoolean("gdpr_consent_heyzap", isGranted);
        boolean committed = editor.commit();

        if(!committed) {
                Log.d("HezapEx", "HezapEx Failed to write user consent to preferences");
        }
    }

    public static boolean getUsersConsent(){

        SharedPreferences prefs = mainActivity.getPreferences(Context.MODE_PRIVATE);
        if(prefs == null) {
                Log.i("HezapEx", "HezapEx Failed to read user conent preference data");
        }

        final Boolean isGranted = prefs.getBoolean("gdpr_consent_heyzap", false);

        Log.d("HezapEx","HezapEx get userConsent is: " + isGranted);

        return isGranted;
    }

//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////


    
	//////////////////////////////////////////////////////////////////////////////////////////////////
    
    //callback banner
    static public boolean bannerIsLoaded()
    {
        if (bannerLoaded)
        {
            bannerLoaded = false;
            return true;
        }
        return false;
    }
    
    static public boolean bannerHasFailedToLoad()
    {
        if (bannerFailedToLoad)
        {
            bannerFailedToLoad = false;
            return true;
        }
        return false;
    }
    
	//callback insterstitial
    static public boolean adIsLoaded()
    {
        if (adLoaded)
        {
            adLoaded = false;
            return true;
        }
        return false;
    }
    
    static public boolean adFailedToLoad()
    {
        if (adFailedToLoad)
        {
            adFailedToLoad = false;
            return true;
        }
        return false;
    }
    
    static public boolean adClosed()
    {
        if (adClosed)
        {
            adClosed = false;
            return true;
        }
        return false;
    }
    
    
    static public boolean adClicked()
    {
        if (adClicked)
        {
            adClicked = false;
            return true;
        }
        return false;
    }
    
    static public boolean adShows()
    {
        if (adShows)
        {
            adShows = false;
            return true;
        }
        return false;
    }
    
    //callback video
    static public boolean videoadIsLoaded()
    {
        if (videoadLoaded)
        {
            videoadLoaded = false;
            return true;
        }
        return false;
    }
    
    static public boolean videoadFailedToLoad()
    {
        if (videoadFailedToLoad)
        {
            videoadFailedToLoad = false;
            return true;
        }
        return false;
    }
    
    static public boolean videoadClosed()
    {
        if (videoadClosed)
        {
            videoadClosed = false;
            return true;
        }
        return false;
    }
    
    
    static public boolean videoadClicked()
    {
        if (videoadClicked)
        {
            videoadClicked = false;
            return true;
        }
        return false;
    }
    
    static public boolean videoadShows()
    {
        if (videoadShows)
        {
            videoadShows = false;
            return true;
        }
        return false;
    }
    
    
    //callback rewarded video
    static public boolean rewardedadIsLoaded()
    {
        if (rewardedadLoaded)
        {
            rewardedadLoaded = false;
            return true;
        }
        return false;
    }
    
    static public boolean rewardedadFailedToLoad()
    {
        if (rewardedadFailedToLoad)
        {
            rewardedadFailedToLoad = false;
            return true;
        }
        return false;
    }
    
    static public boolean rewardedadClosed()
    {
        if (rewardedadClosed)
        {
            rewardedadClosed = false;
            return true;
        }
        return false;
    }
    
    
    static public boolean rewardedadClicked()
    {
        if (rewardedadClicked)
        {
            rewardedadClicked = false;
            return true;
        }
        return false;
    }
    
    static public boolean rewardedadShows()
    {
        if (rewardedadShows)
        {
            rewardedadShows = false;
            return true;
        }
        return false;
    }
    
    static public boolean rewardedVideoComplete()
    {
        if (completeRewardedVideo)
        {
            completeRewardedVideo = false;
            return true;
        }
        return false;
    }
    
    static public boolean rewardedVideoFailToComplete()
    {
        if (failToCompleteRewardedVideo)
        {
            failToCompleteRewardedVideo = false;
            return true;
        }
        return false;
    }
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
    
    static public void setupCallbacks() {
        
        /* STATUS CALLBACKS
         * OnStatusListener callbacks apply to the general lifecycle of an ad.
         */
        HeyzapAds.OnStatusListener statusListener = new HeyzapAds.OnStatusListener() {
            
            @Override
            public void onAvailable(String tag) {
                /* An ad you fetched is now available.
                 * */
                if(tag.equals("interstitial"))
                {
                    adLoaded = true;
                    adFailedToLoad = false;
                } else if(tag.equals("video"))
                {
                    videoadLoaded = true;
                    videoadFailedToLoad = false;
                }else if(tag.equals("rewarded"))
                {
                    rewardedadLoaded = true;
                    rewardedadFailedToLoad = false;
                }
                Log.d("HeyzapEx","Received ad with Tag:" + tag);
                
            }
            
            @Override
            public void onShow(String tag) {
                /* An ad has been successfully shown to the user.
                 * */
                if(tag.equals("interstitial"))
                {
                    adShows = true;
                } else if(tag.equals("video"))
                {
                    videoadShows = true;
                }else if(tag.equals("rewarded"))
                {
                    rewardedadShows = true;
                }
                
            }
            
            @Override
            public void onClick(String tag) {
                /* Somebody clicked on an ad. Note: when an ad is clicked on, the user will temporarily leave your app to
                 * go to the play store.
                 * */
                if(tag.equals("interstitial"))
                {
                    adClicked = true;
                } else if(tag.equals("video"))
                {
                    videoadClicked= true;
                }else if(tag.equals("rewarded"))
                {
                    rewardedadClicked = true;
                }
            }
            
            @Override
            public void onHide(String tag) {
                /* The user has hidden the ad and has been returned to your app.
                 * */
                if(tag.equals("interstitial"))
                {
                    adClosed = true;
                } else if(tag.equals("video"))
                {
                    videoadClosed = true;
                }else if(tag.equals("rewarded"))
                {
                    rewardedadClosed = true;
                }
                
            }
            
            @Override
            public void onFailedToFetch(String tag) {
                /* Uh oh! The fetch did not work. This is usually for one of three reasons:
                 * a) your internet connection is not working
                 * b) your app has not been added to Heyzap's database yet (contact sales or add your game from the dashboard).
                 * c) the ad server could not find a good enough ad
                 * */
                if(tag.equals("interstitial"))
                {
                    adFailedToLoad = true;
                    adLoaded = false;
                } else if(tag.equals("video"))
                {
                    videoadFailedToLoad = true;
                    videoadLoaded = false;
                }else if(tag.equals("rewarded"))
                {
                    rewardedadFailedToLoad = true;
                    rewardedadLoaded = false;
                }
                Log.d("HeyzapEx","Fail to get Interstitial tag: " + tag);
                
            }
            
            @Override
            public void onFailedToShow(String tag) {
                /* Oops! You attempted to show an ad when none had been successfully fetched yet.
                 * */
                //InterstitialAd.fetch();
                
            }
            
            @Override
            public void onAudioStarted() {
                /*
                 * When sound will play from an ad (such as a video), this method will be called. It is recommended to turn off any audio playing
                 * in the app.
                 */
            }
            
            @Override
            public void onAudioFinished() {
                /*
                 * When the audio from an ad has finished, this method will be called. At this point, it is safe to resume any audio
                 * the app may have been playing.
                 */
            }
            
        };
        
        
        HeyzapAds.OnIncentiveResultListener incentiveListener = new HeyzapAds.OnIncentiveResultListener() {
            @Override
            public void onComplete(String tag) {
                // Give the player their reward
                
                completeRewardedVideo = true;
            }
            
            @Override
            public void onIncomplete(String tag) {
                // Don't give the player their reward, and tell them why
                
                failToCompleteRewardedVideo = true;
            }
        };
        
        // Intertitial Ad listener
        InterstitialAd.setOnStatusListener(statusListener);
        
        // Video Ad listener
        VideoAd.setOnStatusListener(statusListener);
        
        // IncentivizedAd listener
        IncentivizedAd.setOnStatusListener(statusListener);
        IncentivizedAd.setOnIncentiveResultListener(incentiveListener);
        
    }

    @Override
    public void onDestroy() {
        if(banner != null){
             banner.destroy();
            }
      super.onDestroy();
    }
    
}
