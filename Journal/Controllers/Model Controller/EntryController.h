//
//  EntryController.h
//  Journal
//
//  Created by LAURA JELENICH on 9/28/20.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject
@property (nonatomic, strong) NSMutableArray *entries;

+ (EntryController *)sharedInstance;

- (void)addEntrywithTitle:(NSString *)title
                 bodyText:(NSString *)bodyText;
- (void)removeEntry:(Entry *)entry;
- (void)updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)bodyText;
@end

NS_ASSUME_NONNULL_END
