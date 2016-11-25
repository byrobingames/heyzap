/*
 *
 * Created by Robin Schaafsma
 * www.byrobingames.com
 *
 */

#include <HeyzapEx.h>
#import <UIKit/UIKit.h>
#import <HeyzapAds/HeyzapAds.h>

using namespace heyzap;

@interface HeyzapController : NSObject <HZAdsDelegate, HZIncentivizedAdDelegate, HZBannerAdDelegate>
{
    UIViewController *root;
    UIView *bannerView;
    NSString *_tag;
    BOOL adLoaded;
    BOOL adFailToLoad;
    BOOL adClosed;
    BOOL adClicked;
    BOOL adShows;
    BOOL rewardedadLoaded;
    BOOL rewardedadFailToLoad;
    BOOL rewardedadClosed;
    BOOL rewardedadClicked;
    BOOL rewardedadShows;
    BOOL completeRewardedVideo;
    BOOL failToCompleteRewardedVideo;
    
    BOOL bannerInitialize;
    BOOL bannerLoaded;
    BOOL bannerFailToLoad;
}

- (id)initWithID:(NSString*)ID;
- (void)fetchInterstitialAd;
- (void)showInterstitialAd;
- (void)fetchRewardedVideoAd;
- (void)showRewardedVideoAd;
- (void)showMediationDebugController;
- (void)showBannerAd;
- (void)hideBannerAd;
-(void)setPosition:(NSString*)position;

@property (nonatomic, assign) BOOL adLoaded;
@property (nonatomic, assign) BOOL adFailToLoad;
@property (nonatomic, assign) BOOL adClosed;
@property (nonatomic, assign) BOOL adIsClicked;
@property (nonatomic, assign) BOOL adShows;
@property (nonatomic, assign) BOOL rewardedadLoaded;
@property (nonatomic, assign) BOOL rewardedadFailToLoad;
@property (nonatomic, assign) BOOL rewardedadClosed;
@property (nonatomic, assign) BOOL rewardedadIsClicked;
@property (nonatomic, assign) BOOL rewardedadShows;
@property (nonatomic, assign) BOOL completeRewardedVideo;
@property (nonatomic, assign) BOOL failToCompleteRewardedVideo;
@property (nonatomic, assign) BOOL bannerInitialize;
@property (nonatomic, assign) BOOL bannerLoaded;
@property (nonatomic, assign) BOOL bannerFailToLoad;
@end

@implementation HeyzapController

@synthesize adLoaded;
@synthesize adFailToLoad;
@synthesize adClosed;
@synthesize adIsClicked;
@synthesize adShows;
@synthesize rewardedadLoaded;
@synthesize rewardedadFailToLoad;
@synthesize rewardedadClosed;
@synthesize rewardedadIsClicked;
@synthesize rewardedadShows;
@synthesize completeRewardedVideo;
@synthesize failToCompleteRewardedVideo;
@synthesize bannerInitialize;
@synthesize bannerLoaded;
@synthesize bannerFailToLoad;

- (id)initWithID:(NSString*)ID
{
    self = [super init];
    if(!self) return nil;
    
    [HeyzapAds startWithPublisherID:ID andOptions: HZAdOptionsDisableAutoPrefetching];
    
    // Interstitial Ads Delegate
    [HZInterstitialAd setDelegate: self];
    
    //Incentivized Ads Delegate
    [HZIncentivizedAd setDelegate:self];
    
    bannerInitialize = NO;

    return self;
}

- (void)fetchInterstitialAd
{

    _tag = @"interstitial";
    [HZInterstitialAd fetch];
}


- (void)showInterstitialAd
{
    
    [HZInterstitialAd show];

}


- (void)fetchRewardedVideoAd
{
    _tag = @"rewarded";
    [HZIncentivizedAd fetch];
}

- (void)showRewardedVideoAd
{
    
     [HZIncentivizedAd show];
}

- (void)showBannerAd
{
    if(bannerInitialize){
        [[HZBannerAdController sharedInstance].bannerView setHidden: NO];
    }else{
        root = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        
        HZBannerAdOptions *bannerOpts = [[HZBannerAdOptions alloc] init];
        bannerOpts.presentingViewController = root;
        if( [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft ||
           [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight )
        {
            bannerOpts.admobBannerSize = HZAdMobBannerSizeFlexibleWidthLandscape;
        }
        
        //[[HZBannerAdController sharedInstance] placeBannerAtPosition:HZBannerPositionBottom options:bannerOpts success:^(UIView *banner) {
        [[HZBannerAdController sharedInstance] requestBannerWithOptions:bannerOpts success:^(UIView *banner) {
            bannerView = banner;
            [root.view addSubview:bannerView];
            [self setPosition:@"BOTTOM"];
            NSLog(@"Showed banner");
            bannerInitialize = YES;
            bannerLoaded = YES;
            bannerFailToLoad = NO;
            [[HZBannerAdController sharedInstance].bannerView setHidden: NO];
        } failure:^(NSError *error) {
            NSLog(@"Error showing banner: %@",error);
            bannerInitialize = NO;
            bannerLoaded = NO;
            bannerFailToLoad = YES;
        }];
    }
 
}

- (void)hideBannerAd
{
    [[HZBannerAdController sharedInstance].bannerView setHidden: YES];
}

-(void)setPosition:(NSString*)position
{
    if(bannerView != NULL){
    
        BOOL bottom=[position isEqualToString:@"BOTTOM"];
    
        if (bottom) // Reposition the adView to the bottom of the screen
        {
            CGRect frame = bannerView.frame;
            frame.origin.y = root.view.bounds.size.height - frame.size.height;
            frame.origin.x = 0;
            bannerView.frame=frame;
        
        }else // Reposition the adView to the top of the screen
        {
            CGRect frame = bannerView.frame;
            frame.origin.y = 0;
            frame.origin.x = 0;
            bannerView.frame=frame;
        }
    }
}


- (void)showMediationDebugController
{
    [HeyzapAds presentMediationDebugViewController];
}


// Sent when an ad has been loaded and is ready to be displayed.
- (void) didReceiveAdWithTag:(NSString *)tag
{
    NSLog(@"HeyzapEx ReceiveAd with tag: %@", tag);
    
    if ([_tag isEqualToString:@"interstitial"])
    {
        adLoaded = YES;
        adFailToLoad = NO;
    }

    if ([_tag isEqualToString:@"rewarded"])
    {
        rewardedadLoaded = YES;
        rewardedadFailToLoad = NO;
    }
}

 // Sent when an ad has failed to load.
- (void) didFailToReceiveAdWithTag: (NSString *)tag
{
    
    if ([_tag isEqualToString:@"interstitial"])
    {
        adFailToLoad = YES;
        adLoaded = NO;
    }

    if ([_tag isEqualToString:@"rewarded"])
    {
        rewardedadFailToLoad = YES;
        rewardedadLoaded = NO;
    }
    
}

// Sent when an ad has been removed from view.
- (void) didHideAdWithTag:(NSString *)tag
{
    
    if ([_tag isEqualToString:@"interstitial"])
    {
        adClosed = YES;
    }
   
    if ([_tag isEqualToString:@"rewarded"])
    {
        rewardedadClosed = YES;
    }

    
}


- (void) didShowAdWithTag:(NSString *)tag {
        // Sent when an ad has been displayed.
    if ([_tag isEqualToString:@"interstitial"])
    {
        adShows = YES;
    }
    
    if ([_tag isEqualToString:@"rewarded"])
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
    if ([_tag isEqualToString:@"interstitial"])
    {
        adIsClicked = YES;
    }
    
    if ([_tag isEqualToString:@"rewarded"])
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

//bannerdelegate

- (void)bannerDidReceiveAd:(HZBannerAdController *)banner
{
    NSLog(@"HeyzapEx Banner received ad.");
}
- (void)bannerDidFailToReceiveAd:(HZBannerAdController *)banner error:(NSError *)error
{
     NSLog(@"HeyzapEx Banner Fail to receive ad.");
}
- (void)bannerWasClicked:(HZBannerAdController *)banner
{
     NSLog(@"HeyzapEx Banner was clicked.");
}
- (void)bannerWillPresentModalView:(HZBannerAdController *)banner
{
     NSLog(@"HeyzapEx Banner will present.");
}
- (void)bannerDidDismissModalView:(HZBannerAdController *)banner
{
     NSLog(@"HeyzapEx Banner did dismiss.");
}
- (void)bannerWillLeaveApplication:(HZBannerAdController *)banner
{
     NSLog(@"HeyzapEx Banner will leave app.");
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
    
    void showBanner()
    {
        if(heyzapController!=NULL)
        {
            [heyzapController showBannerAd];
        }
    }
    
    void hideBanner()
    {
        if(heyzapController!=NULL)
        {
            [heyzapController hideBannerAd];
        }
    }
    
    void setBannerPosition(const char *gravityMode)
    {
        if(heyzapController != NULL)
        {
            NSString *GMODE = [NSString stringWithUTF8String:gravityMode];
            
            [heyzapController setPosition:GMODE];
        }
    }
    
    void presentMediationDebug()
    {
        if(heyzapController!=NULL)
        {
            [heyzapController showMediationDebugController];
        }
    }
    
//callbacks banner
    
    bool bannerLoaded()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.bannerLoaded)
            {
                heyzapController.bannerLoaded = NO;
                return true;
            }
        }
        return false;
    }
    
    bool bannerFailToLoaded()
    {
        if(heyzapController != NULL)
        {
            if (heyzapController.bannerFailToLoad)
            {
                heyzapController.bannerFailToLoad = NO;
                return true;
            }
        }
        return false;
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
