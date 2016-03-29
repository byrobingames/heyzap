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

@interface HeyzapController : NSObject <HZAdsDelegate, HZIncentivizedAdDelegate>
{    
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

- (id)initWithID:(NSString*)ID;
- (void)fetchInterstitialAd;
- (void)showInterstitialAd;
- (void)fetchVideoAd;
- (void)showVideoAd;
- (void)fetchRewardedVideoAd;
- (void)showRewardedVideoAd;
- (void)showMediationDebugController;

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
    if ([HZVideoAd isAvailableForTag:@"video"])
    {
        [HZVideoAd showForTag:@"video"];
    }
}

- (void)fetchRewardedVideoAd
{
    [HZIncentivizedAd fetchForTag:@"rewarded"];
}

- (void)showRewardedVideoAd
{
    if ([HZIncentivizedAd isAvailableForTag:@"rewarded"])
    {
        [HZIncentivizedAd showForTag:@"rewarded"];
    }
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
	
	static HeyzapController *heyzapController;
    static NSString *heyzapID;
    
	void init(const char *HeyzapID){
        
        if(heyzapController == NULL)
        {
            heyzapController = [[HeyzapController alloc] init];
            
        }
        
        heyzapID = [NSString stringWithUTF8String:HeyzapID];
        
        [heyzapController initWithID:heyzapID];
    }
    
    void fetchInterstitial()
    {
        if(heyzapController!=NULL)
        {
            [heyzapController fetchInterstitialAd];
        }
    }
    
    void showInterstitial()
    {
        if(heyzapController!=NULL)
        {
            [heyzapController showInterstitialAd];
        }
    }
    
    void fetchVideo()
    {
        if(heyzapController!=NULL)
        {
            [heyzapController fetchVideoAd];
        }
    }
    
    void showVideo()
    {
        if(heyzapController!=NULL)
        {
            [heyzapController showVideoAd];
        }
    }
    
    void fetchRewardedVideo()
    {
        if(heyzapController!=NULL)
        {
            [heyzapController fetchRewardedVideoAd];
        }
    }
    
    void showRewardedVideo()
    {
        if(heyzapController!=NULL)
        {
            [heyzapController showRewardedVideoAd];
        }
    }
    
    void presentMediationDebug()
    {
        if(heyzapController!=NULL)
        {
            [heyzapController showMediationDebugController];
        }
    }
    
//Callbacks Interstitial
    
    bool adLoaded()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.adLoaded)
            {
                heyzapController.adLoaded = NO;
                return true;
            }
        }
        return false;
    }
    
    bool adFailToLoad()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.adFailToLoad)
            {
                heyzapController.adFailToLoad = NO;
                return true;
            }
        }
        return false;
    }

    bool adClosed()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.adClosed)
            {
                heyzapController.adClosed = NO;
                return true;
            }
        }
        return false;
    }
    
    bool adIsClicked()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.adIsClicked)
            {
                heyzapController.adIsClicked = NO;
                return true;
            }
        }
        return false;
    }
    
    bool adShows()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.adShows)
            {
                heyzapController.adShows = NO;
                return true;
            }
        }
        return false;
    }

    //Callbacks Video
    
    bool videoadLoaded()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.videoadLoaded)
            {
                heyzapController.videoadLoaded = NO;
                return true;
            }
        }
        return false;
    }
    
    bool videoadFailToLoad()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.videoadFailToLoad)
            {
                heyzapController.videoadFailToLoad = NO;
                return true;
            }
        }
        return false;
    }
    
    bool videoadClosed()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.videoadClosed)
            {
                heyzapController.videoadClosed = NO;
                return true;
            }
        }
        return false;
    }
    
    bool videoadIsClicked()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.videoadIsClicked)
            {
                heyzapController.videoadIsClicked = NO;
                return true;
            }
        }
        return false;
    }
    
    bool videoadShows()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.videoadShows)
            {
                heyzapController.videoadShows = NO;
                return true;
            }
        }
        return false;
    }
    
    //Callbacks Rewarded Video
    
    bool rewardedadLoaded()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.rewardedadLoaded)
            {
                heyzapController.rewardedadLoaded = NO;
                return true;
            }
        }
        return false;
    }
    
    bool rewardedadFailToLoad()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.rewardedadFailToLoad)
            {
                heyzapController.rewardedadFailToLoad = NO;
                return true;
            }
        }
        return false;
    }
    
    bool rewardedadClosed()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.rewardedadClosed)
            {
                heyzapController.rewardedadClosed = NO;
                return true;
            }
        }
        return false;
    }
    
    bool rewardedadIsClicked()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.rewardedadIsClicked)
            {
                heyzapController.rewardedadIsClicked = NO;
                return true;
            }
        }
        return false;
    }
    
    bool rewardedadShows()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.rewardedadShows)
            {
                heyzapController.rewardedadShows = NO;
                return true;
            }
        }
        return false;
    }
    
    bool completeRewardedVideo()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.completeRewardedVideo)
            {
                heyzapController.completeRewardedVideo = NO;
                return true;
            }
        }
        return false;
    }
    
    bool failToCompleteRewardedVideo()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.failToCompleteRewardedVideo)
            {
                heyzapController.failToCompleteRewardedVideo = NO;
                return true;
            }
        }
        return false;
    }

    
}
