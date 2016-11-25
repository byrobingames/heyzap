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

static value heyzap_interstitial_fetch(){
    fetchInterstitial();
    return alloc_null();
}
DEFINE_PRIM(heyzap_interstitial_fetch,0);

static value heyzap_interstitial_show(){
	showInterstitial();
	return alloc_null();
}
DEFINE_PRIM(heyzap_interstitial_show,0);

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

static value heyzap_show_banner(){
    showBanner();
    return alloc_null();
}
DEFINE_PRIM(heyzap_show_banner,0);

static value heyzap_hide_banner(){
    hideBanner();
    return alloc_null();
}
DEFINE_PRIM(heyzap_hide_banner,0);

static value heyzap_banner_move(value gravity_mode){
    setBannerPosition(val_string(gravity_mode));
    return alloc_null();
}
DEFINE_PRIM(heyzap_banner_move,1);

//callbacks banner
static value heyzap_banner_loaded()
{
    if (heyzap::bannerLoaded())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_banner_loaded, 0);

static value heyzap_banner_failed()
{
    if (heyzap::bannerFailToLoaded())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_banner_failed, 0);

//callbacks interstitial
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

static value heyzap_ad_shows()
{
    if (heyzap::adShows())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_ad_shows, 0);


//Callbacks rewarded video
static value heyzap_rewardedad_loaded()
{
    if (heyzap::rewardedadLoaded())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_rewardedad_loaded, 0);

static value heyzap_rewardedad_failed()
{
    if (heyzap::rewardedadFailToLoad())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_rewardedad_failed, 0);

static value heyzap_rewardedad_closed()
{
    if (heyzap::rewardedadClosed())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_rewardedad_closed, 0);

static value heyzap_rewardedad_clicked()
{
    if (heyzap::rewardedadIsClicked())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_rewardedad_clicked, 0);

static value heyzap_rewardedad_shows()
{
    if (heyzap::rewardedadShows())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_rewardedad_shows, 0);

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


//end callbacks


extern "C" void heyzap_main()
{
}
DEFINE_ENTRY_POINT(heyzap_main);

extern "C" int heyzap_register_prims()
{
    return 0;
}

