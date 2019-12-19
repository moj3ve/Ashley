#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <Cephei/HBPreferences.h>

// Utils
HBPreferences *pfs;

// Thanks to Nepeta for the DRM
BOOL dpkgInvalid = NO;

// Option Switches
BOOL enabled = YES;
BOOL swipeUpToUnlockReminderSwitch = YES;
BOOL noOlderNotifsTextReminderSwitch = NO;
BOOL TouchIDorPasscodeSwitch = NO;
BOOL shakeGestureSwitch = YES;
BOOL gestureEverywhereSwitch = NO;
BOOL gestureOnlyLockscreenSwitch = YES;
BOOL allowAshleyToTalkSwitch = YES;
BOOL disableHelloPhraseSwitch = NO;
BOOL disableCancelPhraseSwitch = NO;
BOOL disableConfirmPhraseSwitch = NO;

int phraseNumber;
int min;
int max;
int randomNum;

NSString* ashleyText;

// Taptic Engine Feedback generator
UIImpactFeedbackGenerator *gen;

BOOL enableHapticsSwitch = YES;
BOOL enableHapticsAnimationSwitch = YES;
NSString* hapticLevel = @"0";

// Interfaces
@interface SBUICallToActionLabel : NSObject
@property (nonatomic, copy, readwrite) NSString *text;
@end

@interface SBUILegibilityLabel : UIView
@property (nonatomic, copy, readwrite) NSString *string;
@property (assign,nonatomic) long long textAlignment;
@end

@interface SBCoverSheetPrimarySlidingViewController : UIViewController
- (void)viewDidDisappear:(BOOL)arg1;
@end

@interface SBIconController : UIViewController
@end