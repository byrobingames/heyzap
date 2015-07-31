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
    
    private static boolean interstitialLoaded = false;
    private static boolean interstitialFailedToLoad = false;
    private static boolean interstitialClicked =false;
    private static boolean interstitialClosed =false;
	private static String HeyzapId=null;


	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////

	static public void init(final String HeyzapId){
		HeyzapEx.HeyzapId=HeyzapId;
		
		Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run() 
			{ 
			
				Log.d("HeyzapEx","Init Heyzap");
                HeyzapAds.start(HeyzapId,Extension.mainActivity);
                
                //setCallbacks
                setupCallbacks();
                
                
			}
		});	
	}

	static public void showInterstitial() {
        Log.d("HeyzapEx","Show Interstitial Begin");
		if(HeyzapId=="") return;
		Extension.mainActivity.runOnUiThread(new Runnable() {
			public void run()
            {
                
                if(InterstitialAd.isAvailable())
                {
                    InterstitialAd.display(Extension.mainActivity);
                }
                
            }
		});
		Log.d("HeyzapEx","Show Interstitial End");
	}
	
    
	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
	
    static public boolean interstitialIsLoaded()
    {
        if (interstitialLoaded)
        {
            interstitialLoaded = false;
            return true;
        }
        return false;
    }
    
    static public boolean interstitialFailedToLoad()
    {
        if (interstitialFailedToLoad)
        {
            interstitialFailedToLoad = false;
            return true;
        }
        return false;
    }
    
    static public boolean interstitialClosed()
    {
        if (interstitialClosed)
        {
            interstitialClosed = false;
            return true;
        }
        return false;
    }
    
    
    static public boolean interstitialClicked()
    {
        if (interstitialClicked)
        {
            interstitialClicked = false;
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
                interstitialLoaded = true;
                Log.d("HeyzapEx","Received Interstitial!");
                
            }
            
            @Override
            public void onShow(String tag) {
                /* An ad has been successfully shown to the user.
                 * */
                
            }
            
            @Override
            public void onClick(String tag) {
                /* Somebody clicked on an ad. Note: when an ad is clicked on, the user will temporarily leave your app to
                 * go to the play store.
                 * */
                
                interstitialClicked = true;
            }
            
            @Override
            public void onHide(String tag) {
                /* The user has hidden the ad and has been returned to your app.
                 * */
                
                interstitialClosed = true;
                
                Log.d("HeyzapEx","Dismiss Interstitial");
            }
            
            @Override
            public void onFailedToFetch(String tag) {
                /* Uh oh! The fetch did not work. This is usually for one of three reasons:
                 * a) your internet connection is not working
                 * b) your app has not been added to Heyzap's database yet (contact sales or add your game from the dashboard).
                 * c) the ad server could not find a good enough ad
                 * */
                
                interstitialFailedToLoad = true;
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
        
        InterstitialAd.setOnStatusListener(statusListener);
        
    }
    
}
