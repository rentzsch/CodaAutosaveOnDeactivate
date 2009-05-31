#import "CodaAutosaveOnDeactivatePlugin.h"

@implementation CodaAutosaveOnDeactivatePlugin

- (id)initWithPlugInController:(CodaPlugInsController*)controller_ bundle:(NSBundle*)bundle_ {
    self = [super init];
    if (self) {
        NSString *codaVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        if ([codaVersion isEqualToString:@"1.6.4"]) {
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(appDidResignActive:)
                                                         name:NSApplicationDidResignActiveNotification
                                                       object:nil];
        }
    }
    return self;
}

- (void)appDidResignActive:(NSNotification*)notification_ {
    NSArray *documents = [[NSDocumentController sharedDocumentController] documents];
    
    NSMutableSet *dirtyEditors = [NSMutableSet set];
    for (NSDocument *document in documents) {
        [dirtyEditors addObjectsFromArray:[document valueForKey:@"dirtyEditors"]];
    }
    
    for (NSDocument *dirtyEditor in dirtyEditors) {
        [dirtyEditor saveDocument:nil];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (NSString*)name {
    return @"CodaAutosaveOnDeactivate";
}

@end
