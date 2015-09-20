/*
 *
 * Created by Robin Schaafsma
 * www.byrobingames.com
 *
 */

#include <HeyzapEx.h>
#import <UIKit/UIKit.h>
#import <HeyzapAds/HeyzapAds.h>
#import <HeyzapAds/HZInterstitialAd.h>
#import <HeyzapAds/HZVideoAd.h>
#import <HeyzapAds/HZShowOptions.h>

using namespace heyzap;

extern "C" void nme_app_set_active(bool inActive);

@interface HeyzapController : UIViewController <HZAdsDelegate, HZIncentivizedAdDelegate>
{
    UIViewController *root;
    
    BOOL adLoaded;
    BOOL adFailToLoad;
    BOOL adClosed;
    BOOL adClicked;
    BOOL completeRewardedVideo;
    BOOL failToCompleteRewardedVideo;
}

@property (nonatomic, assign) BOOL adLoaded;
@property (nonatomic, assign) BOOL adFailToLoad;
@property (nonatomic, assign) BOOL adClosed;
@property (nonatomic, assign) BOOL adIsClicked;
@property (nonatomic, assign) BOOL completeRewardedVideo;
@property (nonatomic, assign) BOOL failToCompleteRewardedVideo;
@end

@implementation HeyzapController

@synthesize adLoaded;
@synthesize adFailToLoad;
@synthesize adClosed;
@synthesize adIsClicked;
@synthesize completeRewardedVideo;
@synthesize failToCompleteRewardedVideo;

- (id)initWithID:(NSString*)ID
{
    self = [super init];
    if(!self) return nil;
    
    [HeyzapAds startWithPublisherID:ID];
    
    // Interstitial Ads Delegate
    [HZInterstitialAd setDelegate: self];
    
    // Video Ads Delegate
    [HZVideoAd setDelegate:self];
    
    //Incentivized Ads Delegate
    [HZIncentivizedAd setDelegate:self];
   
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}


- (void)showInterstitialAd
{
    
    if ([HZInterstitialAd isAvailable])
    {

        [HZInterstitialAd show];
    }
}

- (void)fetchVideoAd
{
    [HZVideoAd fetch];
}

- (void)showVideoAd
{
    [HZVideoAd show];
}

- (void)fetchRewardedVideoAd
{
    [HZIncentivizedAd fetch];
}

- (void)showRewardedVideoAd
{
    [HZIncentivizedAd show];
}


// Sent when an ad has been loaded and is ready to be displayed.
- (void) didReceiveAdWithTag:(NSString *)tag
{
    adLoaded = YES;
    adFailToLoad = NO;
}

 // Sent when an ad has failed to load.
- (void) didFailToReceiveAdWithTag: (NSString *)tag
{
    adFailToLoad = YES;
    adLoaded = NO;
    
}

// Sent when an ad has been removed from view.
- (void) didHideAdWithTag:(NSString *)tag
{
    
    adClosed = YES;

}


- (void) didShowAdWithTag:(NSString *)tag {
        // Sent when an ad has been displayed.
}
    
- (void) didFailToShowAdWithTag:(NSString *)tag andError:(NSError *)error
{
        // Sent when you call `showAd`, but there isn't an ad to be shown.
        // Includes an NSError object describing the reason why.
    
}
    
// Sent when an ad has been clicked.
- (void) didClickAdWithTag:(NSString *)tag
{
    adIsClicked = YES;
}

- (void) didCompleteAdWithTag: (NSString *)tag
{
    // When an incentivized video ad has been fully watched
    
    completeRewardedVideo = YES;
}

- (void) didFailToCompleteAdWithTag: (NSString *)tag
{
    // When user fails to watch the incentivized video all the way through
    
    failToCompleteRewardedVideo = YES;
}



@end

namespace heyzap {
	
	static HeyzapController *adController;
    static NSString *heyzapID;
    
	void init(const char *HeyzapID){
        
        if(adController == NULL)
        {
            adController = [[HeyzapController alloc] init];
        }
        
        heyzapID = [NSString stringWithUTF8String:HeyzapID];
        
        [adController initWithID:heyzapID];
    }
    
    void showInterstitial()
    {
        if(adController!=NULL)
        {
            [adController showInterstitialAd];
        }
    }
    
    void fetchVideo()
    {
        if(adController!=NULL)
        {
            [adController fetchVideoAd];
        }
    }
    
    void showVideo()
    {
        if(adController!=NULL)
        {
            [adController showVideoAd];
        }
    }
    
    void fetchRewardedVideo()
    {
        if(adController!=NULL)
        {
            [adController fetchRewardedVideoAd];
        }
    }
    
    void showRewardedVideo()
    {
        if(adController!=NULL)
        {
            [adController showRewardedVideoAd];
        }
    }
    
//Callbacks
    
    bool adLoaded()
    {
        if(adController != NULL)
        {
            if (adController.adLoaded)
            {
                adController.adLoaded = NO;
                return true;
            }
        }
        return false;
    }
    
    bool adFailToLoad()
    {
        if(adController != NULL)
        {
            if (adController.adFailToLoad)
            {
                adController.adFailToLoad = NO;
                return true;
            }
        }
        return false;
    }

    bool adClosed()
    {
        if(adController != NULL)
        {
            if (adController.adClosed)
            {
                adController.adClosed = NO;
                return true;
            }
        }
        return false;
    }
    
    bool adIsClicked()
    {
        if(adController != NULL)
        {
            if (adController.adIsClicked)
            {
                adController.adIsClicked = NO;
                return true;
            }
        }
        return false;
    }
    
    bool completeRewardedVideo()
    {
        if(adController != NULL)
        {
            if (adController.completeRewardedVideo)
            {
                adController.completeRewardedVideo = NO;
                return true;
            }
        }
        return false;
    }
    
    bool failToCompleteRewardedVideo()
    {
        if(adController != NULL)
        {
            if (adController.failToCompleteRewardedVideo)
            {
                adController.failToCompleteRewardedVideo = NO;
                return true;
            }
        }
        return false;
    }

    
}
