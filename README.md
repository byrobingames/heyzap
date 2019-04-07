## Stencyl Heyzap Advertising Extension (Openfl)

For Stencyl 3.4 9280 and above

Stencyl extension for "Heyzap" (http://www.heyzap.com) on iOS and Android. This extension allows you to easily integrate Heyzap on your Stencyl game / application. (http://www.stencyl.com)

### Important!!

This Extension Required the Toolset Extension Manager [https://byrobingames.github.io](https://byrobingames.github.io)

![toolsetheyzap](https://byrobingames.github.io/img/heyzap/toolsetheyzap.png)

## Main Features

  * Interstitial/Video Support.
  * Rewarded Video Support.
  * Banner Support 
  * Set / Get users consent
  * Enable the extension to support the SDK's for that Network: Facebook ads,AppLovin, Unityads, Vungle,Leadbolt   

Supported Networks byRobin | IOS SDK version | Android SDK version | Notes
--- | --- | --- | ---
**AdMob** | See Stencyl | See Stencyl |  **Enable Admob in Stencyl Mobile settings**
**AppLovin** | See extension  | See extension | Add your SDKKEY in include file (Enable Extension Version 0.0.4)
[**Facebook Ads**](http://community.stencyl.com/index.php/topic,41144.0.html) | See extension | See extension | Enable Facebook Ads extension version 1.6 in Stencyl
[**Heyzap**](http://community.stencyl.com/index.php/topic,45095.0.html) | 9.54.1  | 9.54.1 | Enable Heyzap extension in Stencyl
**Leadbolt** | See extension | See extension | Enable Leadbolt extension version 1.4 in Stencyl
**UnityAds** | See extension | See extension | Enable UnityAds extension version 0.0.9 in Stencyl
**Vungle** | See extension | See extension | Enable Vungle extension version 0.0.4 in Stencyl

Unsupported Networks byRobin| Notes
--- | ---
**Chartboost** | Chartboost extension need a update or on request.
**AdColony** | AdColony extension need a update or on request.
InMobi | on request.
MdotM | on request.
HyprMX | on request.
Domob | on request.

## How to Install

To install this Engine Extension, go to the toolset (byRobin Extension Mananger) in the Extension menu of your game inside Stencyl.<br/>
![toolsetextensionlocation](https://byrobingames.github.io/img/toolset/toolsetextensionlocation.png)<br/>
Select the Extension from the menu and click on "Download"

If you not have byRobin Extension Mananger installed, install this first.<br/>
Go to: [https://byrobingames.github.io](https://byrobingames.github.io)

## Documentation and Block Examples
[Heyzap WIKI](https://github.com/byrobingames/heyzap/wiki)

### Error on Compile

If you get this error on compiling: iOS (only)

    [openfl] Undefined symbols for architecture arm64:
    [openfl]     _OBJC_CLASS_$_HZShowOptions", referenced from:
    [openfl]        objc-class-ref in libheyzap.a(054f34a9_HeyzapEx.o)
    [openfl]   "_OBJC_CLASS_$_HZInterstitialAd", referenced from:
    [openfl]        objc-class-ref in libheyzap.a(054f34a9_HeyzapEx.o)
    [openfl]    "_OBJC_CLASS_$_HeyzapAds", referenced from:
    [openfl]      objc-class-ref in libheyzap.a(054f34a9_HeyzapEx.o)
    [openfl]  ld: symbol(s) not found for architecture arm64
    [openfl] clang: error: linker command failed with exit code 1 (use -v to see invocation)
    
See [https://github.com/byrobingames/heyzap/wiki/4.-Error-on-Compiling](https://github.com/byrobingames/heyzap/wiki/4.-Error-on-Compiling)

## Version History

- 1.8 (2015-11-08) release
- 1.9 (2015-11-20) major update (added blocks and SDK's see github for all updates
- 2.1 (2016-01-28) update Heyzap SDK for both iOS and Android (9.3.7)
- 2.2 (2016-03-28) update Heyzap SDK for both iOS and Android (9.4.4), remove UnityAds, AppLovin, and Vungle SDK's. There are now own extensions
- 2.3 (2016-04-15) update Heyzap SDK for both iOS and Android (9.5.5), this has fix the crash when click an a Network in Debug.
- 2.4 (2016-05-02) Android: set InMobi activity in comments, this will fix the crash on Android.
- 2.5 (2016-05-11) iOS Fix: Freeze after dismiss ad when using single touch. Now single touch is working
- 2.6 (2016-09-25)SDK Update for iOS and Android to 9.6.8
- 2.7 (2016-11-18) Updated to SDK 10.
- 2.8 (2016-11-25) Added Banner Support and Android Admob support
- 2.9 (2017-03-19)<br />
           - SDK 10 not in develop by Heyzap anymore, back to SDK 9.7.1<br />
           - Android Gradle support for openfl4 update<br />
           - byRobin extension manager 0.1.2 is needed for iOS.<br />
- 2.9.1(2017-05-16) Update SDK to iOS: 9.10.1 Android: 9.10.1, Tested for Stencyl 3.5, Required byRobin Toolset Extension Manager
- 2.9.2(2019-03-24) Update SDK to: 9.54.1; set and get users consent; Required extension manager 0.2.5 >
- 2.9.3(2019-04-07) Minor Android FIX.

## Submitting a Pull Request

This software is opensource.<br/>
If you want to contribute you can make a pull request

Repository: [https://github.com/byrobingames/heyzap](https://github.com/byrobingames/heyzap)

Need help with a pull request?<br/>
[https://help.github.com/articles/creating-a-pull-request/](https://help.github.com/articles/creating-a-pull-request/)

### ANY ISSUES?

Add the issue on GitHub<br/>
Repository: [https://github.com/byrobingames/heyzap/issues](https://github.com/byrobingames/heyzap/issues)

Need help with creating a issue?<br/>
[https://help.github.com/articles/creating-an-issue/](https://help.github.com/articles/creating-an-issue/)

## Donate

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=HKLGFCAGKBMFL)<br />

## Privacy Policy

https://www.heyzap.com/legal/privacy

## License

Author: Robin Schaafsma

The MIT License (MIT)

Copyright (c) 2014 byRobinGames [http://www.byrobin.nl](http://www.byrobin.nl)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
