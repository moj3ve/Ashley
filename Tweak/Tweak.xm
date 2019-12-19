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
  randomNum = min + arc4random() % (max - min); // I duplicated every file because the chance is bigger to get a different file on every call, big brain

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

%group Ashley

  %hook CSTeachableMomentsContainerView

    - (void)_layoutCallToActionLabel {

      %orig;
      if (enabled && swipeUpToUnlockReminderSwitch) {
        SBUILegibilityLabel *label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel"); // Invented By MrGcGamer
        label.string = ashleyText;

      }

    }
  %end
    // iPhone <=8 Interface Text
  %hook SBUICallToActionLabel

    - (void)layoutSubViews { // Before recognized with touch id

      %orig;
      if (enabled && swipeUpToUnlockReminderSwitch) {
        self.text = ashleyText;

      }
    }

    - (void)_updateLabelTextWithLanguage:(id)arg1 { // After recognized with touch id

      %orig;
      if (enabled && swipeUpToUnlockReminderSwitch) {
        self.text = ashleyText;

      }
    }

  %end

  // No older notifications text
  %hook NCNotificationListSectionRevealHintView

    - (void)layoutSubviews {

      %orig;
      if (enabled && noOlderNotifsTextReminderSwitch) {
        SBUILegibilityLabel *label = MSHookIvar<SBUILegibilityLabel *>(self, "_revealHintTitle");
        label.textAlignment = NSTextAlignmentCenter;
        label.string = ashleyText;

      }

    }
  %end

  // TouchID or Enter Passcode text
  %hook SBUIPasscodeLockViewWithKeypad

    - (void)setStatusTitleView:(UILabel *)arg1 {

      %orig;
      if (enabled && TouchIDorPasscodeSwitch) {
        arg1.text = ashleyText;

      }

    }
  %end

  // Listen for motion shakes
  %hook SBIconController

    - (BOOL)canBecomeFirstResponder {

      return YES;

    }

    - (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
      
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

  %end

  %hook SBCoverSheetPrimarySlidingViewController

    - (BOOL)canBecomeFirstResponder {

      return YES;

    }

    - (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {

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

%end

%end

%group AshleyIntegrityFail

%hook SBCoverSheetPrimarySlidingViewController

- (void)viewDidDisappear:(BOOL)arg1 {

    %orig; //  Thanks to Nepeta for the DRM
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

%end

%end

%ctor {
  
    // Thanks To Nepeta For The DRM
    dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/me.shymemoriees.ashley.list"];

    if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/me.shymemoriees.ashley.md5sums"];

    if (dpkgInvalid) {
        %init(AshleyIntegrityFail);
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
            %init(Ashley);
            return;
        } else {
            dpkgInvalid = YES;
        }
    }
}
