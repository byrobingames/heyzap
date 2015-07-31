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

@interface HeyzapController : UIViewController <HZAdsDelegate>
{
    UIViewController *root;
    
    BOOL interstitialLoaded;
    BOOL interstitialFailToLoad;
    BOOL interstitialClosed;
    BOOL interstitialIsClicked;
}

@property (nonatomic, assign) BOOL interstitialLoaded;
@property (nonatomic, assign) BOOL interstitialFailToLoad;
@property (nonatomic, assign) BOOL interstitialClosed;
@property (nonatomic, assign) BOOL interstitialIsClicked;
@end

@implementation HeyzapController

@synthesize interstitialLoaded;
@synthesize interstitialFailToLoad;
@synthesize interstitialClosed;
@synthesize interstitialIsClicked;

- (id)initWithID:(NSString*)ID
{
    self = [super init];
    if(!self) return nil;
    
    [HeyzapAds startWithPublisherID:ID];
    [HZInterstitialAd setDelegate: self];
   
    
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

       /* root = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        
        HZShowOptions *options = [[HZShowOptions alloc] init];
        
        options.viewController = root;
        
        [HZInterstitialAd showWithOptions:options];*/
        [HZInterstitialAd show];
    }
}

// Sent when an ad has been loaded and is ready to be displayed.
- (void) didReceiveAdWithTag:(NSString *)tag
{
    interstitialLoaded = YES;
    interstitialFailToLoad = NO;
}

 // Sent when an ad has failed to load.
- (void) didFailToReceiveAdWithTag: (NSString *)tag
{
    interstitialFailToLoad = YES;
    interstitialLoaded = NO;
    
}

// Sent when an ad has been removed from view.
- (void) didHideAdWithTag:(NSString *)tag
{
    
    interstitialClosed = YES;

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
    interstitialIsClicked = YES;
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
    
    
//Callbacks
    
    bool interstitialLoaded()
    {
        if(adController != NULL)
        {
            if (adController.interstitialLoaded)
            {
                adController.interstitialLoaded = NO;
                return true;
            }
        }
        return false;
    }
    
    bool interstitialFailToLoad()
    {
        if(adController != NULL)
        {
            if (adController.interstitialFailToLoad)
            {
                adController.interstitialFailToLoad = NO;
                return true;
            }
        }
        return false;
    }

    bool interstitialClosed()
    {
        if(adController != NULL)
        {
            if (adController.interstitialClosed)
            {
                adController.interstitialClosed = NO;
                return true;
            }
        }
        return false;
    }
    
    bool interstitialIsClicked()
    {
        if(adController != NULL)
        {
            if (adController.interstitialIsClicked)
            {
                adController.interstitialIsClicked = NO;
                return true;
            }
        }
        return false;
    }

    
}
