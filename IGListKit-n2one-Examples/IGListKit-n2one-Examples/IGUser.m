//
//  IGUser.m
//  IGListKit-n2one-Examples
//
//  Created by sunbohong on 2016/10/28.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "IGUser.h"

@implementation IGUser

- (instancetype)initWithPK:(NSInteger)pk name:(NSString *)name handle:(NSString *)handle {
    if(self = [super init]) {
        _pk     = pk;
        _name   = name;
        _handle = handle;
    }
    return self;
}

- (id<NSObject>)diffIdentifier {
    return @(_pk);
}

- (BOOL)isEqual:(id<IGListDiffable>)object {
    if(self == object) {
        return true;
    }
    IGUser *user = (IGUser *)object;
    if([user isKindOfClass:[IGUser class]]) {
        return [_name isEqual:user.name] && [_handle isEqual:user.handle];
    }
    return false;
}

@end
