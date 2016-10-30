//
//  IGGridItem.h
//  IGListKit-n2one-Examples
//
//  Created by sunbohong on 2016/10/28.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import <IGListKit_n2one/IGListKit.h>

@interface IGGridItem : NSObject

- (instancetype)initWithColor:(UIColor *)color itemCount:(NSUInteger)itemcount;

@end


@interface IGGridSectionController : IGListSectionController<IGListSectionType>

@end
