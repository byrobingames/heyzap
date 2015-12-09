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

@interface HeyzapController : UIViewController <HZAdsDelegate, HZIncentivizedAdDelegate>
{
    UIWindow* window;
    UIViewController *viewController;
    
    BOOL adLoaded;
    BOOL adFailToLoad;
    BOOL adClosed;
    BOOL adClicked;
    BOOL adShows;
    BOOL videoadLoaded;
    BOOL videoadFailToLoad;
    BOOL videoadClosed;
    BOOL videoadClicked;
    BOOL videoadShows;
    BOOL rewardedadLoaded;
    BOOL rewardedadFailToLoad;
    BOOL rewardedadClosed;
    BOOL rewardedadClicked;
    BOOL rewardedadShows;
    BOOL completeRewardedVideo;
    BOOL failToCompleteRewardedVideo;
}

@property (nonatomic, assign) BOOL adLoaded;
@property (nonatomic, assign) BOOL adFailToLoad;
@property (nonatomic, assign) BOOL adClosed;
@property (nonatomic, assign) BOOL adIsClicked;
@property (nonatomic, assign) BOOL adShows;
@property (nonatomic, assign) BOOL videoadLoaded;
@property (nonatomic, assign) BOOL videoadFailToLoad;
@property (nonatomic, assign) BOOL videoadClosed;
@property (nonatomic, assign) BOOL videoadIsClicked;
@property (nonatomic, assign) BOOL videoadShows;
@property (nonatomic, assign) BOOL rewardedadLoaded;
@property (nonatomic, assign) BOOL rewardedadFailToLoad;
@property (nonatomic, assign) BOOL rewardedadClosed;
@property (nonatomic, assign) BOOL rewardedadIsClicked;
@property (nonatomic, assign) BOOL rewardedadShows;
@property (nonatomic, assign) BOOL completeRewardedVideo;
@property (nonatomic, assign) BOOL failToCompleteRewardedVideo;
@end

@implementation HeyzapController

@synthesize adLoaded;
@synthesize adFailToLoad;
@synthesize adClosed;
@synthesize adIsClicked;
@synthesize adShows;
@synthesize videoadLoaded;
@synthesize videoadFailToLoad;
@synthesize videoadClosed;
@synthesize videoadIsClicked;
@synthesize videoadShows;
@synthesize rewardedadLoaded;
@synthesize rewardedadFailToLoad;
@synthesize rewardedadClosed;
@synthesize rewardedadIsClicked;
@synthesize rewardedadShows;
@synthesize completeRewardedVideo;
@synthesize failToCompleteRewardedVideo;

- (id)initWithID:(NSString*)ID
{
    self = [super init];
    if(!self) return nil;
    
    [HeyzapAds startWithPublisherID:ID andOptions: HZAdOptionsDisableAutoPrefetching];
    
    // Interstitial Ads Delegate
    [HZInterstitialAd setDelegate: self];
    
    // Video Ads Delegate
    [HZVideoAd setDelegate:self];
    
    //Incentivized Ads Delegate
    [HZIncentivizedAd setDelegate:self];

    return self;
}

- (void)fetchInterstitialAd
{
    
    [HZInterstitialAd fetchForTag: @"interstitial"];
}


- (void)showInterstitialAd
{
    
    if ([HZInterstitialAd isAvailableForTag:@"interstitial"])
    {
        
        [HZInterstitialAd showForTag:@"interstitial"];
    }
}

- (void)fetchVideoAd
{
    [HZVideoAd fetchForTag:@"video"];
}

- (void)showVideoAd
{
    [HZVideoAd showForTag:@"video"];
}

- (void)fetchRewardedVideoAd
{
    [HZIncentivizedAd fetchForTag:@"rewarded"];
}

- (void)showRewardedVideoAd
{
    [HZIncentivizedAd showForTag:@"rewarded"];
}

- (void)showMediationDebugController
{
    [HeyzapAds presentMediationDebugViewController];
}


// Sent when an ad has been loaded and is ready to be displayed.
- (void) didReceiveAdWithTag:(NSString *)tag
{
    if ([tag isEqualToString:@"interstitial"])
    {
        adLoaded = YES;
        adFailToLoad = NO;
    }
    if ([tag isEqualToString:@"video"])
    {
        videoadLoaded = YES;
        videoadFailToLoad = NO;
    }
    if ([tag isEqualToString:@"rewarded"])
    {
        rewardedadLoaded = YES;
        rewardedadFailToLoad = NO;
    }
}

 // Sent when an ad has failed to load.
- (void) didFailToReceiveAdWithTag: (NSString *)tag
{
    
    if ([tag isEqualToString:@"interstitial"])
    {
        adFailToLoad = YES;
        adLoaded = NO;
    }
    if ([tag isEqualToString:@"video"])
    {
        videoadFailToLoad = YES;
        videoadLoaded = NO;
    }
    if ([tag isEqualToString:@"rewarded"])
    {
        rewardedadFailToLoad = YES;
        rewardedadLoaded = NO;
    }
    
}

// Sent when an ad has been removed from view.
- (void) didHideAdWithTag:(NSString *)tag
{
    
    if ([tag isEqualToString:@"interstitial"])
    {
        adClosed = YES;
    }
    if ([tag isEqualToString:@"video"])
    {
        videoadClosed = YES;
    }
    if ([tag isEqualToString:@"rewarded"])
    {
        rewardedadClosed = YES;
    }

}


- (void) didShowAdWithTag:(NSString *)tag {
        // Sent when an ad has been displayed.
    if ([tag isEqualToString:@"interstitial"])
    {
        adShows = YES;
    }
    if ([tag isEqualToString:@"video"])
    {
        videoadShows = YES;
    }
    if ([tag isEqualToString:@"rewarded"])
    {
        rewardedadShows = YES;
    }
}

- (void) didFailToShowAdWithTag:(NSString *)tag andError:(NSError *)error
{
        // Sent when you call `showAd`, but there isn't an ad to be shown.
        // Includes an NSError object describing the reason why.
    
}
    
// Sent when an ad has been clicked.
- (void) didClickAdWithTag:(NSString *)tag
{
    if ([tag isEqualToString:@"interstitial"])
    {
        adIsClicked = YES;
    }
    if ([tag isEqualToString:@"video"])
    {
        videoadIsClicked = YES;
    }
    if ([tag isEqualToString:@"rewarded"])
    {
        rewardedadIsClicked = YES;
    }
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
    
    void fetchInterstitial()
    {
        if(adController!=NULL)
        {
            [adController fetchInterstitialAd];
        }
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
    
    void presentMediationDebug()
    {
        if(adController!=NULL)
        {
            [adController showMediationDebugController];
        }
    }
    
//Callbacks Interstitial
    
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
    
    bool adShows()
    {
        if(adController != NULL)
        {
            if (adController.adShows)
            {
                adController.adShows = NO;
                return true;
            }
        }
        return false;
    }

    //Callbacks Video
    
    bool videoadLoaded()
    {
        if(adController != NULL)
        {
            if (adController.videoadLoaded)
            {
                adController.videoadLoaded = NO;
                return true;
            }
        }
        return false;
    }
    
    bool videoadFailToLoad()
    {
        if(adController != NULL)
        {
            if (adController.videoadFailToLoad)
            {
                adController.videoadFailToLoad = NO;
                return true;
            }
        }
        return false;
    }
    
    bool videoadClosed()
    {
        if(adController != NULL)
        {
            if (adController.videoadClosed)
            {
                adController.videoadClosed = NO;
                return true;
            }
        }
        return false;
    }
    
    bool videoadIsClicked()
    {
        if(adController != NULL)
        {
            if (adController.videoadIsClicked)
            {
                adController.videoadIsClicked = NO;
                return true;
            }
        }
        return false;
    }
    
    bool videoadShows()
    {
        if(adController != NULL)
        {
            if (adController.videoadShows)
            {
                adController.videoadShows = NO;
                return true;
            }
        }
        return false;
    }
    
    //Callbacks Rewarded Video
    
    bool rewardedadLoaded()
    {
        if(adController != NULL)
        {
            if (adController.rewardedadLoaded)
            {
                adController.rewardedadLoaded = NO;
                return true;
            }
        }
        return false;
    }
    
    bool rewardedadFailToLoad()
    {
        if(adController != NULL)
        {
            if (adController.rewardedadFailToLoad)
            {
                adController.rewardedadFailToLoad = NO;
                return true;
            }
        }
        return false;
    }
    
    bool rewardedadClosed()
    {
        if(adController != NULL)
        {
            if (adController.rewardedadClosed)
            {
                adController.rewardedadClosed = NO;
                return true;
            }
        }
        return false;
    }
    
    bool rewardedadIsClicked()
    {
        if(adController != NULL)
        {
            if (adController.rewardedadIsClicked)
            {
                adController.rewardedadIsClicked = NO;
                return true;
            }
        }
        return false;
    }
    
    bool rewardedadShows()
    {
        if(adController != NULL)
        {
            if (adController.rewardedadShows)
            {
                adController.rewardedadShows = NO;
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
