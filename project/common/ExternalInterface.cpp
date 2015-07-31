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

//callbacks
static value heyzap_interstitial_loaded()
{
    if (heyzap::interstitialLoaded())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_interstitial_loaded, 0);

static value heyzap_interstitial_failed()
{
    if (heyzap::interstitialFailToLoad())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_interstitial_failed, 0);

static value heyzap_interstitial_closed()
{
    if (heyzap::interstitialClosed())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_interstitial_closed, 0);

static value heyzap_interstitial_clicked()
{
    if (heyzap::interstitialIsClicked())
        return val_true;
    return val_false;
}
DEFINE_PRIM(heyzap_interstitial_clicked, 0);


extern "C" void heyzap_main()
{
}
DEFINE_ENTRY_POINT(heyzap_main);

extern "C" int heyzap_register_prims()
{
    return 0;
}


//extern "C" int heyzapex_register_prims () { return 0; }
