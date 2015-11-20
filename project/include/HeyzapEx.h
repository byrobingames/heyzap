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
    bool adLoaded();
    bool adFailToLoad();
    bool adClosed();
    bool adIsClicked();
    bool adShows();
    bool videoadLoaded();
    bool videoadFailToLoad();
    bool videoadClosed();
    bool videoadIsClicked();
    bool videoadShows();
    bool rewardedadLoaded();
    bool rewardedadFailToLoad();
    bool rewardedadClosed();
    bool rewardedadIsClicked();
    bool rewardedadShows();
    bool completeRewardedVideo();
    bool failToCompleteRewardedVideo();
    
}


#endif