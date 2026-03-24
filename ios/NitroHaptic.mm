#import "NitroHaptic.h"
#import <UIKit/UIKit.h>

@implementation NitroHaptic

- (void)trigger:(NSString *)type {
  dispatch_async(dispatch_get_main_queue(), ^{
    if ([type isEqualToString:@"tap"]) {
      UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];
      [generator prepare];
      [generator impactOccurred];
    } else if ([type isEqualToString:@"selection"]) {
      UISelectionFeedbackGenerator *generator = [[UISelectionFeedbackGenerator alloc] init];
      [generator prepare];
      [generator selectionChanged];
    } else if ([type isEqualToString:@"soft"]) {
      UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft];
      [generator prepare];
      [generator impactOccurred];
    } else if ([type isEqualToString:@"heavy"]) {
      UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
      [generator prepare];
      [generator impactOccurred];
    } else if ([type isEqualToString:@"success"]) {
      UINotificationFeedbackGenerator *generator = [[UINotificationFeedbackGenerator alloc] init];
      [generator prepare];
      [generator notificationOccurred:UINotificationFeedbackTypeSuccess];
    } else if ([type isEqualToString:@"warning"]) {
      UINotificationFeedbackGenerator *generator = [[UINotificationFeedbackGenerator alloc] init];
      [generator prepare];
      [generator notificationOccurred:UINotificationFeedbackTypeWarning];
    } else if ([type isEqualToString:@"error"]) {
      UINotificationFeedbackGenerator *generator = [[UINotificationFeedbackGenerator alloc] init];
      [generator prepare];
      [generator notificationOccurred:UINotificationFeedbackTypeError];
    } else {
      // Fallback: treat unknown types as a tap
      UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
      [generator prepare];
      [generator impactOccurred];
    }
  });
}

- (NSNumber *)isSupported {
  // All iPhones since iPhone 7 (2016) support the Taptic Engine.
  // UIFeedbackGenerator silently no-ops on unsupported devices (iPad without haptics).
  // We check for the presence of the feedback generator API, which is iOS 10+.
  return @(YES);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeNitroHapticSpecJSI>(params);
}

+ (NSString *)moduleName
{
  return @"NitroHaptic";
}

@end
