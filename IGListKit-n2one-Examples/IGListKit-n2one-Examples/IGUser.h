//
//  IGUser.h
//  IGListKit-n2one-Examples
//
//  Created by sunbohong on 2016/10/28.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <IGListKit/IGListKit.h>

@interface IGUser : NSObject  < IGListDiffable>

@property (nonatomic, readonly) NSInteger pk;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *handle;

- (instancetype)initWithPK:(NSInteger)pk name:(NSString *)name handle:(NSString *)handle;

@end
