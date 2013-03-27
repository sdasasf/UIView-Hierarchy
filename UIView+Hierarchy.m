//
//  UIView+Hierarchy.m
//  Switch
//
//  Created by 曹昊 on 13-3-27.
//  Copyright (c) 2013年 曹昊. All rights reserved.
//

#import "UIView+Hierarchy.h"

@implementation UIView (Hierarchy)
- (NSDictionary *)hierarchy
{
    if ([self.subviews count]) {
        NSMutableArray *hierarchies = [NSMutableArray new];
        for (UIView *view in self.subviews) {
            [hierarchies addObject:[view hierarchy]];
        }
        return [NSDictionary dictionaryWithObject:hierarchies forKey:NSStringFromClass([self class])];
    }
    else
    {
        CGRect frame = self.frame;
        NSString *frameDescription = [NSString stringWithFormat:@"%f,%f,%f,%f",
                                      frame.origin.x,
                                      frame.origin.y,
                                      frame.size.width,
                                      frame.size.height];
        return [NSDictionary dictionaryWithObject:frameDescription forKey:NSStringFromClass([self class])];
    }
}

- (NSString *)description
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self hierarchy] options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end
