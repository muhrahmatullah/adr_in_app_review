#import "AdrInAppReviewPlugin.h"
#if __has_include(<adr_in_app_review/adr_in_app_review-Swift.h>)
#import <adr_in_app_review/adr_in_app_review-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "adr_in_app_review-Swift.h"
#endif

@implementation AdrInAppReviewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAdrInAppReviewPlugin registerWithRegistrar:registrar];
}
@end
