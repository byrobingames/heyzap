#ifndef HEYZAPEX_H
#define HEYZAPEX_H


namespace heyzap {
	
	
	void init(const char *HeyzapID);
    void fetchInterstitial();
	void showInterstitial();
    void fetchVideo();
    void showVideo();
    void fetchRewardedVideo();
    void showRewardedVideo();
    void presentMediationDebug();
    void showBanner();
    void hideBanner();
    void setBannerPosition(const char *gravityMode);
    bool bannerLoaded();
    bool bannerFailToLoaded();
    bool adLoaded();
    bool adFailToLoad();
    bool adClosed();
    bool adIsClicked();
    bool adShows();
    bool rewardedadLoaded();
    bool rewardedadFailToLoad();
    bool rewardedadClosed();
    bool rewardedadIsClicked();
    bool rewardedadShows();
    bool completeRewardedVideo();
    bool failToCompleteRewardedVideo();
    
}


#endif
