#line 1 "Tweak.xm"
#import "Ashley.h"

void triggerHaptics() {

  int hapticStrength = [hapticLevel intValue];

  if (enabled && enableHapticsSwitch && enableHapticsAnimationSwitch) {
    AudioServicesPlaySystemSound(1519);

		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

			AudioServicesPlaySystemSound(1520);

		});

    dispatch_time_t popTime2 = dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC);
		dispatch_after(popTime2, dispatch_get_main_queue(), ^(void){

			AudioServicesPlaySystemSound(1519);

		});

  } else if (!enableHapticsAnimationSwitch && hapticStrength == 1) {
      AudioServicesPlaySystemSound(1519);

    } else if (!enableHapticsAnimationSwitch && hapticStrength == 2) {
      AudioServicesPlaySystemSound(1520);
      
    } else if (!enableHapticsAnimationSwitch && hapticStrength == 3) {
      AudioServicesPlaySystemSound(1521);

    } else if (!enableHapticsAnimationSwitch && hapticStrength == 4) {
      [gen prepare];
      gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
      [gen impactOccurred];

    } else if (!enableHapticsAnimationSwitch && hapticStrength == 5) {
      [gen prepare];
      gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
      [gen impactOccurred];

    } else if (!enableHapticsAnimationSwitch && hapticStrength == 6) {
      [gen prepare];
      gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
      [gen impactOccurred];

    } else if (!enableHapticsAnimationSwitch && hapticStrength == 7) {
      [gen prepare];
      gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft];
      [gen impactOccurred];

    } else if (!enableHapticsAnimationSwitch && hapticStrength == 8) {
      [gen prepare];
      gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];
      [gen impactOccurred];

    }

}

void makeAshleyTalk() {

  min = 1;
  max = 6;
  randomNum = min + arc4random() % (max - min); 

if (enabled && allowAshleyToTalkSwitch && !disableHelloPhraseSwitch && phraseNumber == 0) {
  SystemSoundID helloPhrase = 0;
  AudioServicesDisposeSystemSoundID(helloPhrase);
  NSString *pathForhelloPhrase = [NSString stringWithFormat:@"/Library/Ashley/helloPhrase%d.caf",randomNum];
  AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:pathForhelloPhrase]), &helloPhrase);
  AudioServicesPlaySystemSound((SystemSoundID)helloPhrase);

} else if (enabled && allowAshleyToTalkSwitch && !disableCancelPhraseSwitch && phraseNumber == 1) {
  SystemSoundID cancelPhrase = 0;
  AudioServicesDisposeSystemSoundID(cancelPhrase);
  NSString *pathForcancelPhrase = [NSString stringWithFormat:@"/Library/Ashley/cancelPhrase%d.caf",randomNum];
  AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:pathForcancelPhrase]), &cancelPhrase);
  AudioServicesPlaySystemSound((SystemSoundID)cancelPhrase);

} else if (enabled && allowAshleyToTalkSwitch && !disableConfirmPhraseSwitch && phraseNumber == 2) {
  SystemSoundID confirmPhrase = 0;
  AudioServicesDisposeSystemSoundID(confirmPhrase);
  NSString *pathForconfirmPhrase = [NSString stringWithFormat:@"/Library/Ashley/confirmPhrase%d.caf",randomNum];
  AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:pathForconfirmPhrase]), &confirmPhrase);
  AudioServicesPlaySystemSound((SystemSoundID)confirmPhrase);

}

}


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBUIPasscodeLockViewWithKeypad; @class SBCoverSheetPrimarySlidingViewController; @class CSTeachableMomentsContainerView; @class SBUICallToActionLabel; @class NCNotificationListSectionRevealHintView; @class SBIconController; 


#line 93 "Tweak.xm"
static void (*_logos_orig$Ashley$CSTeachableMomentsContainerView$_layoutCallToActionLabel)(_LOGOS_SELF_TYPE_NORMAL CSTeachableMomentsContainerView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Ashley$CSTeachableMomentsContainerView$_layoutCallToActionLabel(_LOGOS_SELF_TYPE_NORMAL CSTeachableMomentsContainerView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Ashley$SBUICallToActionLabel$layoutSubViews)(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST, SEL); static void _logos_method$Ashley$SBUICallToActionLabel$layoutSubViews(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Ashley$SBUICallToActionLabel$_updateLabelTextWithLanguage$)(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Ashley$SBUICallToActionLabel$_updateLabelTextWithLanguage$(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Ashley$NCNotificationListSectionRevealHintView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Ashley$NCNotificationListSectionRevealHintView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Ashley$SBUIPasscodeLockViewWithKeypad$setStatusTitleView$)(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewWithKeypad* _LOGOS_SELF_CONST, SEL, UILabel *); static void _logos_method$Ashley$SBUIPasscodeLockViewWithKeypad$setStatusTitleView$(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewWithKeypad* _LOGOS_SELF_CONST, SEL, UILabel *); static BOOL (*_logos_orig$Ashley$SBIconController$canBecomeFirstResponder)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Ashley$SBIconController$canBecomeFirstResponder(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Ashley$SBIconController$motionBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, UIEventSubtype, UIEvent *); static void _logos_method$Ashley$SBIconController$motionBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, UIEventSubtype, UIEvent *); static BOOL (*_logos_orig$Ashley$SBCoverSheetPrimarySlidingViewController$canBecomeFirstResponder)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Ashley$SBCoverSheetPrimarySlidingViewController$canBecomeFirstResponder(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Ashley$SBCoverSheetPrimarySlidingViewController$motionBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, UIEventSubtype, UIEvent *); static void _logos_method$Ashley$SBCoverSheetPrimarySlidingViewController$motionBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, UIEventSubtype, UIEvent *); 

  

    static void _logos_method$Ashley$CSTeachableMomentsContainerView$_layoutCallToActionLabel(_LOGOS_SELF_TYPE_NORMAL CSTeachableMomentsContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

      _logos_orig$Ashley$CSTeachableMomentsContainerView$_layoutCallToActionLabel(self, _cmd);
      if (enabled && swipeUpToUnlockReminderSwitch) {
        SBUILegibilityLabel *label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel"); 
        label.string = ashleyText;

      }

    }
  
    
  

    static void _logos_method$Ashley$SBUICallToActionLabel$layoutSubViews(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

      _logos_orig$Ashley$SBUICallToActionLabel$layoutSubViews(self, _cmd);
      if (enabled && swipeUpToUnlockReminderSwitch) {
        self.text = ashleyText;

      }
    }

    static void _logos_method$Ashley$SBUICallToActionLabel$_updateLabelTextWithLanguage$(_LOGOS_SELF_TYPE_NORMAL SBUICallToActionLabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) { 

      _logos_orig$Ashley$SBUICallToActionLabel$_updateLabelTextWithLanguage$(self, _cmd, arg1);
      if (enabled && swipeUpToUnlockReminderSwitch) {
        self.text = ashleyText;

      }
    }

  

  
  

    static void _logos_method$Ashley$NCNotificationListSectionRevealHintView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

      _logos_orig$Ashley$NCNotificationListSectionRevealHintView$layoutSubviews(self, _cmd);
      if (enabled && noOlderNotifsTextReminderSwitch) {
        SBUILegibilityLabel *label = MSHookIvar<SBUILegibilityLabel *>(self, "_revealHintTitle");
        label.textAlignment = NSTextAlignmentCenter;
        label.string = ashleyText;

      }

    }
  

  
  

    static void _logos_method$Ashley$SBUIPasscodeLockViewWithKeypad$setStatusTitleView$(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewWithKeypad* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILabel * arg1) {

      _logos_orig$Ashley$SBUIPasscodeLockViewWithKeypad$setStatusTitleView$(self, _cmd, arg1);
      if (enabled && TouchIDorPasscodeSwitch) {
        arg1.text = ashleyText;

      }

    }
  

  
  

    static BOOL _logos_method$Ashley$SBIconController$canBecomeFirstResponder(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

      return YES;

    }

    static void _logos_method$Ashley$SBIconController$motionBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIEventSubtype motion, UIEvent * event) {
      
      if (event.type == UIEventSubtypeMotionShake) {
        if (enabled && shakeGestureSwitch && gestureEverywhereSwitch && !gestureOnlyLockscreenSwitch) {
          UIAlertController *ashley = [UIAlertController alertControllerWithTitle:@"Hiii, Ashley here 🤗"
          message:@"What Can I Do For You? 🦋\nReminders Are Always Something I Use To Not Forget Something, So Give It A Try 😊"
          preferredStyle:UIAlertControllerStyleAlert];
          phraseNumber = 0;

          [ashley addTextFieldWithConfigurationHandler:^(UITextField *textField) {textField.placeholder = @"Example: Buy Flowers";}];
          UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Remind Me" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * action ) {
            UITextField *textField = ashley.textFields.firstObject;
            [pfs setObject:textField.text forKey:@"Text"];
            [self dismissViewControllerAnimated:YES completion:NULL];
            phraseNumber = 2;
            makeAshleyTalk();
           }];
          UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Forget It" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:NULL];
            phraseNumber = 1;
            makeAshleyTalk();
           }];

           [ashley addAction:confirmAction];
           [ashley addAction:cancelAction];
           [self presentViewController:ashley animated:YES completion:nil];

           triggerHaptics();
           makeAshleyTalk();

        }

      }

    }

  

  

    static BOOL _logos_method$Ashley$SBCoverSheetPrimarySlidingViewController$canBecomeFirstResponder(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

      return YES;

    }

    static void _logos_method$Ashley$SBCoverSheetPrimarySlidingViewController$motionBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIEventSubtype motion, UIEvent * event) {

      if (event.type == UIEventSubtypeMotionShake) {
        if (enabled && shakeGestureSwitch && gestureOnlyLockscreenSwitch && !gestureEverywhereSwitch) {
          UIAlertController *ashley = [UIAlertController alertControllerWithTitle:@"Hiii, Ashley here 🤗"
          message:@"What Can I Do For You? 🦋\nReminders Are Always Something I Use To Not Forget Something, So Give It A Try 😊"
          preferredStyle:UIAlertControllerStyleAlert];
          phraseNumber = 0;

          [ashley addTextFieldWithConfigurationHandler:^(UITextField *textField) {textField.placeholder = @"Example: Buy Flowers";}];
          UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Remind Me" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * action ) {
            UITextField *textField = ashley.textFields.firstObject;
            [pfs setObject:textField.text forKey:@"Text"];
            [self dismissViewControllerAnimated:YES completion:NULL];
            phraseNumber = 2;
            makeAshleyTalk();
           }];
          UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Forget It" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:NULL];
            phraseNumber = 1;
            makeAshleyTalk();
           }];

           [ashley addAction:confirmAction];
           [ashley addAction:cancelAction];
           [self presentViewController:ashley animated:YES completion:nil];

           triggerHaptics();
           makeAshleyTalk();

        }

        if (enabled && shakeGestureSwitch && gestureEverywhereSwitch && !gestureOnlyLockscreenSwitch) {
          UIAlertController *ashley = [UIAlertController alertControllerWithTitle:@"Hiii, Ashley here 🤗"
          message:@"What Can I Do For You? 🦋\nReminders Are Always Something I Use To Not Forget Something, So Give It A Try 😊"
          preferredStyle:UIAlertControllerStyleAlert];
          phraseNumber = 0;

          [ashley addTextFieldWithConfigurationHandler:^(UITextField *textField) {textField.placeholder = @"Example: Buy Flowers";}];
          UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Remind Me" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * action ) {
            UITextField *textField = ashley.textFields.firstObject;
            [pfs setObject:textField.text forKey:@"Text"];
            [self dismissViewControllerAnimated:YES completion:NULL];
            phraseNumber = 2;
            makeAshleyTalk();
           }];
          UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Forget It" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:NULL];
            phraseNumber = 1;
            makeAshleyTalk();
           }];

           [ashley addAction:confirmAction];
           [ashley addAction:cancelAction];
           [self presentViewController:ashley animated:YES completion:nil];

           triggerHaptics();
           makeAshleyTalk();

        }

      }

    }





static void (*_logos_orig$AshleyIntegrityFail$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$AshleyIntegrityFail$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); 



static void _logos_method$AshleyIntegrityFail$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

    _logos_orig$AshleyIntegrityFail$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$(self, _cmd, arg1); 
    if (!dpkgInvalid) return;
		UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ashley"
		message:@"Seriously? Pirating a free Tweak is awful!\nPiracy repo's Tweaks could contain Malware if you didn't know that, so go ahead and get Ashley from the official Source https://repo.shymemoriees.me/.\nIf you're seeing this but you got it from the official source then make sure to add https://repo.shymemoriees.me to Cydia or Sileo."
		preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Aww man" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

			UIApplication *application = [UIApplication sharedApplication];
			[application openURL:[NSURL URLWithString:@"https://repo.shymemoriees.me/"] options:@{} completionHandler:nil];

	}];

		[alertController addAction:cancelAction];

		[self presentViewController:alertController animated:YES completion:nil];

}





static __attribute__((constructor)) void _logosLocalCtor_f0aea7b3(int __unused argc, char __unused **argv, char __unused **envp) {
  
    
    dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/me.shymemoriees.ashley.list"];

    if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/me.shymemoriees.ashley.md5sums"];

    if (dpkgInvalid) {
        {Class _logos_class$AshleyIntegrityFail$SBCoverSheetPrimarySlidingViewController = objc_getClass("SBCoverSheetPrimarySlidingViewController"); MSHookMessageEx(_logos_class$AshleyIntegrityFail$SBCoverSheetPrimarySlidingViewController, @selector(viewDidDisappear:), (IMP)&_logos_method$AshleyIntegrityFail$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$, (IMP*)&_logos_orig$AshleyIntegrityFail$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$);}
        return;
    }

  pfs = [[HBPreferences alloc] initWithIdentifier:@"me.shymemoriees.ashleypreferences"];

  [pfs registerBool:&enabled default:YES forKey:@"Enabled"];
  [pfs registerBool:&swipeUpToUnlockReminderSwitch default:YES forKey:@"swipeUpToUnlockReminder"];
  [pfs registerBool:&noOlderNotifsTextReminderSwitch default:NO forKey:@"noOlderNotifsTextReminder"];
  [pfs registerBool:&TouchIDorPasscodeSwitch default:NO forKey:@"TouchIDorPasscode"];
  [pfs registerObject:&ashleyText default:@"Hiii, Ashley here" forKey:@"Text"];
  [pfs registerBool:&shakeGestureSwitch default:YES forKey:@"shakeGesture"];
  [pfs registerBool:&gestureEverywhereSwitch default:NO forKey:@"gestureEverywhere"];
  [pfs registerBool:&gestureOnlyLockscreenSwitch default:YES forKey:@"gestureOnlyLockscreen"];
  [pfs registerBool:&enableHapticsSwitch default:YES forKey:@"enableHaptics"];
  [pfs registerBool:&enableHapticsAnimationSwitch default:YES forKey:@"enableHapticsAnimation"];
  [pfs registerObject:&hapticLevel default:@"0" forKey:@"hapticStrength"];
  [pfs registerBool:&allowAshleyToTalkSwitch default:YES forKey:@"allowAshleyToTalk"];
  [pfs registerBool:&disableHelloPhraseSwitch default:NO forKey:@"disableHelloPhrase"];
  [pfs registerBool:&disableCancelPhraseSwitch default:NO forKey:@"disableCancelPhrase"];
  [pfs registerBool:&disableConfirmPhraseSwitch default:NO forKey:@"disableConfirmPhrase"];

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@.ashley.md5sums", @"m", @"e", @".", @"s", @"h", @"y", @"m", @"e", @"m", @"o", @"r", @"i", @"e", @"e", @"s"]]
        );

        if (ok && [@"shymemoriees" isEqualToString:@"shymemoriees"]) {
            {Class _logos_class$Ashley$CSTeachableMomentsContainerView = objc_getClass("CSTeachableMomentsContainerView"); MSHookMessageEx(_logos_class$Ashley$CSTeachableMomentsContainerView, @selector(_layoutCallToActionLabel), (IMP)&_logos_method$Ashley$CSTeachableMomentsContainerView$_layoutCallToActionLabel, (IMP*)&_logos_orig$Ashley$CSTeachableMomentsContainerView$_layoutCallToActionLabel);Class _logos_class$Ashley$SBUICallToActionLabel = objc_getClass("SBUICallToActionLabel"); MSHookMessageEx(_logos_class$Ashley$SBUICallToActionLabel, @selector(layoutSubViews), (IMP)&_logos_method$Ashley$SBUICallToActionLabel$layoutSubViews, (IMP*)&_logos_orig$Ashley$SBUICallToActionLabel$layoutSubViews);MSHookMessageEx(_logos_class$Ashley$SBUICallToActionLabel, @selector(_updateLabelTextWithLanguage:), (IMP)&_logos_method$Ashley$SBUICallToActionLabel$_updateLabelTextWithLanguage$, (IMP*)&_logos_orig$Ashley$SBUICallToActionLabel$_updateLabelTextWithLanguage$);Class _logos_class$Ashley$NCNotificationListSectionRevealHintView = objc_getClass("NCNotificationListSectionRevealHintView"); MSHookMessageEx(_logos_class$Ashley$NCNotificationListSectionRevealHintView, @selector(layoutSubviews), (IMP)&_logos_method$Ashley$NCNotificationListSectionRevealHintView$layoutSubviews, (IMP*)&_logos_orig$Ashley$NCNotificationListSectionRevealHintView$layoutSubviews);Class _logos_class$Ashley$SBUIPasscodeLockViewWithKeypad = objc_getClass("SBUIPasscodeLockViewWithKeypad"); MSHookMessageEx(_logos_class$Ashley$SBUIPasscodeLockViewWithKeypad, @selector(setStatusTitleView:), (IMP)&_logos_method$Ashley$SBUIPasscodeLockViewWithKeypad$setStatusTitleView$, (IMP*)&_logos_orig$Ashley$SBUIPasscodeLockViewWithKeypad$setStatusTitleView$);Class _logos_class$Ashley$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$Ashley$SBIconController, @selector(canBecomeFirstResponder), (IMP)&_logos_method$Ashley$SBIconController$canBecomeFirstResponder, (IMP*)&_logos_orig$Ashley$SBIconController$canBecomeFirstResponder);MSHookMessageEx(_logos_class$Ashley$SBIconController, @selector(motionBegan:withEvent:), (IMP)&_logos_method$Ashley$SBIconController$motionBegan$withEvent$, (IMP*)&_logos_orig$Ashley$SBIconController$motionBegan$withEvent$);Class _logos_class$Ashley$SBCoverSheetPrimarySlidingViewController = objc_getClass("SBCoverSheetPrimarySlidingViewController"); MSHookMessageEx(_logos_class$Ashley$SBCoverSheetPrimarySlidingViewController, @selector(canBecomeFirstResponder), (IMP)&_logos_method$Ashley$SBCoverSheetPrimarySlidingViewController$canBecomeFirstResponder, (IMP*)&_logos_orig$Ashley$SBCoverSheetPrimarySlidingViewController$canBecomeFirstResponder);MSHookMessageEx(_logos_class$Ashley$SBCoverSheetPrimarySlidingViewController, @selector(motionBegan:withEvent:), (IMP)&_logos_method$Ashley$SBCoverSheetPrimarySlidingViewController$motionBegan$withEvent$, (IMP*)&_logos_orig$Ashley$SBCoverSheetPrimarySlidingViewController$motionBegan$withEvent$);}
            return;
        } else {
            dpkgInvalid = YES;
        }
    }
}
