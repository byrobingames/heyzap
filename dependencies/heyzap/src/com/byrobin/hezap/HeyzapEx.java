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

import android.annotation.TargetApi;
import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Toast;
import android.util.Log;

import org.haxe.extension.Extension;


public class HeyzapEx extends Extension {


	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
    
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


	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////

	static public void init(final String HeyzapId){
		HeyzapEx.HeyzapId=HeyzapId;
		
		Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run() 
			{ 
			
				Log.d("HeyzapEx","Init Heyzap");
                HeyzapAds.start(HeyzapId,Extension.mainActivity, HeyzapAds.DISABLE_AUTOMATIC_FETCH);
                
                //setCallbacks
                setupCallbacks();   
                
			}
		});	
	}

    static public void fetchInterstitial() {
        Log.d("HeyzapEx","Fetch Interstitial Begin");
        if(HeyzapId=="") return;
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
        
        Log.d("HeyzapEx","Show presentMediationDebug Begin");

        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {

                    HeyzapAds.startTestActivity(Extension.mainActivity);
                
            }
        });
        Log.d("HeyzapEx","Show presentMediationDebug End");
        
    }

    
	//////////////////////////////////////////////////////////////////////////////////////////////////
    
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
                //Log.d("HeyzapEx","Received Interstitial!");
                
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
                
                Log.d("HeyzapEx","Dismiss Interstitial");
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
                Log.d("HeyzapEx","Fail to get Interstitial");
                
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

}
