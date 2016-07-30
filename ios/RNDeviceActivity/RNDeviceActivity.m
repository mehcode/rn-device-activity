#import "RNDeviceActivity.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"

@implementation RNDeviceActivity

@synthesize bridge = _bridge;

- (instancetype)init {
    if ((self = [super init])) {
        // install listener for application suspend event
        [[NSNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(suspend:)
                   name:@"UIApplicationDidEnterBackgroundNotification"
                 object:nil
        ];
        // install listener for application resume event
        [[NSNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(resume:)
                   name:@"UIApplicationDidBecomeActiveNotification"
                 object:nil
        ];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)resume:(NSNotification *)notification {
    [self.bridge.eventDispatcher sendDeviceEventWithName:@"deviceResume" body:NULL];
}

-(void)suspend:(NSNotification *)notification {
    [self.bridge.eventDispatcher sendDeviceEventWithName:@"devicePause" body:NULL];
}

RCT_EXPORT_MODULE();
@end
