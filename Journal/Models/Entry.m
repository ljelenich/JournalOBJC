//
//  Entry.m
//  Journal
//
//  Created by LAURA JELENICH on 9/28/20.
//

#import "Entry.h"

@implementation Entry
- (instancetype)initWithTitle:(NSString *)title
                     bodyText:(NSString *)bodyText
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timestamp = [NSDate new];
    }
    return self;
}
@end
