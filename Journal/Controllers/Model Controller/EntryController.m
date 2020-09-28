//
//  EntryController.m
//  Journal
//
//  Created by LAURA JELENICH on 9/28/20.
//

#import "EntryController.h"

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    return sharedInstance;
}

- (void)addEntrywithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    if (!_entries) {
        _entries = [NSMutableArray new];
    }
    Entry *newEntry = [[Entry alloc] initWithTitle:title bodyText:bodyText];
    [_entries addObject:newEntry]; 
}

- (void)removeEntry:(Entry *)entry
{
    [_entries removeObject:entry];
}

- (void)updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
}

@end
