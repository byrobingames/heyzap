## Stencyl Heyzap Advertising Extension (Openfl)

For Stencyl 3.3 and above

Stencyl extension for "Heyzap" (http://www.heyzap.com) on iOS and Android. This extension allows you to easily integrate Heyzap on your Stencyl game / application. (http://www.stencyl.com)

### Important!!

This extension is using a custum "PROJ.xcodeproj" file to load some bundle files automatically in your IOS game. It wil no harm for your game.

Does not work with the following extensions:
- Tapdaq Extension

If you want to create a game with this and with above extension, you can ask me and i make it happen for your. Not for FREE.

**TODO**
- Banner support (Admob, iAd, Facebook Audience Network)


## Main Features

  * Interstitial Support.
  * Video Support
  * Rewarded Video Support.
  * Allows you to specify min amount of time between interstitial displays (to avoid annoying your users).
  * Allows you to specify min amount of calls to interstitial before it actually gets displayed (to avoid annoying your users).
  * Included SDK's: Heyzap SDK,AppLovin, HyprMX, Unityads, Vungle,
  * Enable the extension to support the SDK's for that Network: AdColony, AdMob, Chartboost, Facebook ads, Leadbolt,   

Supported Networks | IOS SDK version | Android SDK version | Notes
--- | --- | --- | ---
[**AdMob**](http://community.stencyl.com/index.php/topic,41376.0.html) | See extension | See extension | Enable Admob extension in Stencyl
[**AdColony**](http://community.stencyl.com/index.php/topic,40370.0.html) | See extension | See extension |  Enable AdColony extension in Stencyl
**AppLovin** | v3.1.5  | v6.1.4 | Included in Heyzap extension
[**Chartboost**](http://community.stencyl.com/index.php/topic,25006.0.html) | See extension | See extension | Enable Chartboost extension in Stencyl
[**Facebook Ads**](http://community.stencyl.com/index.php/topic,41144.0.html) | See extension | See extension | Enable Facebook Ads extension in Stencyl
[**Heyzap**](http://community.stencyl.com/index.php/topic,45095.0.html) | v9.2.7  | v9.2.7  | Enable Heyzap extension in Stencyl
**HyprMX** | v68 | v17 | Included in Heyzap extension 
**iAds (IOS only)** | - | - | Included in Stencyl
[**Leadbolt**](http://community.stencyl.com/index.php/topic,45093.0.html) | See extension | See extension |  Enable Leadbolt extension in Stencyl
**MdotM** | - | - | Non SDK needed
**UnityAds** | v1.5.2 | v1.4.7 | Included in Heyzap extension
**Vungle** | v3.2.0 | v3.3.2 | Included in Heyzap extension

## How to Install
Download zip file on the right of the screen. ![download](http://www.byrobingames.com/stencyl/heyzap/download.png) on this page https://github.com/byrobingames/heyzap<br />

Install the zip file Go to : http://community.stencyl.com/index.php/topic,30432.0.html

## Documentation and Blocks Example
[Heyzap WIKI](https://github.com/byrobingames/heyzap/wiki)

### Error on compiling

If you get this error on compiling go to: https://github.com/byrobingames/heyzap/wiki/4.-Error-on-Compiling to resolve this<br/>

    [openfl] Undefined symbols for architecture arm64:
    [openfl]     _OBJC_CLASS_$_HZShowOptions", referenced from:
    [openfl]        objc-class-ref in libheyzap.a(054f34a9_HeyzapEx.o)
    [openfl]   "_OBJC_CLASS_$_HZInterstitialAd", referenced from:
    [openfl]        objc-class-ref in libheyzap.a(054f34a9_HeyzapEx.o)
    [openfl]    "_OBJC_CLASS_$_HeyzapAds", referenced from:
    [openfl]      objc-class-ref in libheyzap.a(054f34a9_HeyzapEx.o)
    [openfl]  ld: symbol(s) not found for architecture arm64
    [openfl] clang: error: linker command failed with exit code 1 (use -v to see invocation)

## Donate

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=HKLGFCAGKBMFL)<br />

## Privacy Policy

https://www.heyzap.com/legal/privacy

## License

The MIT License (MIT) - LICENSE.md

Copyright © 2014 byRobinGames (http://www.byrobingames.com)

Author: Robin Schaafsma
