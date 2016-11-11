@interface LSApplicationProxy
/*MobileCoreServices*/
- (id)_initWithBundleUnit:(NSUInteger)arg1 applicationIdentifier:(NSString *)arg2;
+ (id)applicationProxyForIdentifier:(NSString *)arg1;
+ (id)applicationProxyForBundleURL:(NSURL *)arg1;
@end

@interface SBDisplayItem : NSObject
@property (nonatomic,readonly) NSString* displayIdentifier;
@end

@interface SBSearchBackdropView : UIView
@end

@interface FBApplicationInfo : NSObject
/*FrontBoard*/
- (NSURL *)dataContainerURL;
- (NSURL *)bundleURL;
- (NSString *)bundleIdentifier;
- (NSString *)bundleType;
- (NSString *)bundleVersion;
- (NSString *)displayName;
- (id)initWithApplicationProxy:(id)arg1;
@end


NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.nld.snapfolder.plist"];

%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)application {
%orig;
NSString* info = @"snapchat does not exist";

    FBApplicationInfo *appInfo = [LSApplicationProxy applicationProxyForIdentifier: @"com.toyopagroup.picaboo"];
if (appInfo != nil)
{
    info = appInfo.dataContainerURL.path;
}	
    myDictionary[@"snap"] = info;

    [myDictionary writeToFile:@"/var/mobile/Library/Preferences/com.nld.snapfolder.plist" atomically:YES];

}
%end