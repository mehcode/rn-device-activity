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

        [[NSNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(protectedDataAvailable:)
                   name:@"UIApplicationProtectedDataDidBecomeAvailable"
                 object:nil
        ];

        [[NSNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(protectedDataUnavailable:)
                   name:@"UIApplicationProtectedDataWillBecomeUnavailable"
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

-(void)protectedDataAvailable:(NSNotification *)notification {
    [self.bridge.eventDispatcher sendDeviceEventWithName:@"protectedDataAvailable" body:NULL];
}

-(void)protectedDataUnavailable:(NSNotification *)notification {
    [self.bridge.eventDispatcher sendDeviceEventWithName:@"protectedDataUnavailable" body:NULL];
}

RCT_EXPORT_MODULE();
@end
