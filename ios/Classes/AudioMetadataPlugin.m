#import "AudioMetadataPlugin.h"
#if __has_include(<audio_metadata/audio_metadata-Swift.h>)
#import <audio_metadata/audio_metadata-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "audio_metadata-Swift.h"
#endif

@implementation AudioMetadataPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAudioMetadataPlugin registerWithRegistrar:registrar];
}
@end
