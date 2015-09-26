#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "HeyzapEx.h"

using namespace heyzap;


static value heyzap_init(value heyzap_id){
	init(val_string(heyzap_id));
	return alloc_null();
}
DEFINE_PRIM(heyzap_init,1);

//extern "C" void heyzap_main () {
//	val_int(0); // Fix Neko init
	
//}
//DEFINE_ENTRY_POINT (heyzap_main);

static value heyzap_interstitial_show(){
	showInterstitial();
	return alloc_null();
}
DEFINE_PRIM(heyzap_interstitial_show,0);

static value heyzap_video_fetch(){
    fetchVideo();
    return alloc_null();
}
DEFINE_PRIM(heyzap_video_fetch,0);

static value heyzap_video_show(){
    showVideo();
    return alloc_null();
}
DEFINE_PRIM(heyzap_video_show,0);

static value heyzap_rewardedvideo_fetch(){
    fetchRewardedVideo();
    return alloc_null();
}
DEFINE_PRIM(heyzap_rewardedvideo_fetch,0);

static value heyzap_rewardedvideo_show(){
    showRewardedVideo();
    return alloc_null();
}
DEFINE_PRIM(heyzap_rewardedvideo_show,0);

static value heyzap_presentmediation_debug(){
    presentMediationDebug();
    return alloc_null();
}
DEFINE_PRIM(heyzap_presentmediation_debug,0);

//callbacks
static value heyzap_ad_loaded()
{
    if (heyzap::adLoaded())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_ad_loaded, 0);

static value heyzap_ad_failed()
{
    if (heyzap::adFailToLoad())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_ad_failed, 0);

static value heyzap_ad_closed()
{
    if (heyzap::adClosed())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_ad_closed, 0);

static value heyzap_ad_clicked()
{
    if (heyzap::adIsClicked())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_ad_clicked, 0);

static value heyzap_rewardedvideo_complete()
{
    if (heyzap::completeRewardedVideo())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_rewardedvideo_complete, 0);

static value heyzap_rewardedvideo_failtocomplete()
{
    if (heyzap::failToCompleteRewardedVideo())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_rewardedvideo_failtocomplete, 0);


extern "C" void heyzap_main()
{
}
DEFINE_ENTRY_POINT(heyzap_main);

extern "C" int heyzap_register_prims()
{
    return 0;
}


//extern "C" int heyzapex_register_prims () { return 0; }
