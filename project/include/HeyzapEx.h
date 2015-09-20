#ifndef HEYZAPEX_H
#define HEYZAPEX_H


namespace heyzap {
	
	
	void init(const char *HeyzapID);
	void showInterstitial();
    void fetchVideo();
    void showVideo();
    void fetchRewardedVideo();
    void showRewardedVideo();
    bool adLoaded();
    bool adFailToLoad();
    bool adClosed();
    bool adIsClicked();
    bool completeRewardedVideo();
    bool failToCompleteRewardedVideo();
    
}


#endif