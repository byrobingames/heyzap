#ifndef HEYZAPEX_H
#define HEYZAPEX_H


namespace heyzap {
	
	
	void init(const char *HeyzapID);
	void showInterstitial();
    bool interstitialLoaded();
    bool interstitialFailToLoad();
    bool interstitialClosed();
    bool interstitialIsClicked();
    
}


#endif