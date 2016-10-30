//
//  IGUserSectionController.m
//  IGListKit-n2one-Examples
//
//  Created by sunbohong on 2016/10/28.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "IGUserSectionController.h"

#import <SunCollectionViewCell/SunCollectionViewCell.h>
#import <ChameleonFramework/Chameleon.h>
#import <MCUIViewLayout/UIView+MCLayoutCalculation.h>
#import <MCUIViewLayout/UIView+MCLayout.h>

#import "IGUser.h"

static CGFloat padding = 15;

@implementation IGUserSectionController {
    IGUser *_user;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake([self.collectionContext containerSize].width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    SunCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[SunCollectionViewCell class] forSectionController:self identifier:NSStringFromClass(self.class) atIndex:index];

    if(cell.needConfig) {
        cell.needConfig = NO;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font      = [UIFont systemFontOfSize:17];
        cell.textLabel.backgroundColor = RandomFlatColor;

        cell.detailTextLabel.textAlignment = NSTextAlignmentRight;
        cell.detailTextLabel.textColor     = [UIColor whiteColor];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
        cell.backgroundColor      = RandomFlatColor;

        cell.separator.hidden = NO;

        cell.didLayoutSubviewsBlock = ^(SunCollectionViewCell *cell){
            [cell.textLabel mc_setRelativePosition:MCViewPositionVCenterLeft toView:cell.contentView withMargins:UIEdgeInsetsMake(0, padding, 0, 0)];
            [cell.detailTextLabel mc_setRelativePosition:MCViewPositionVCenterRight toView:cell.contentView withMargins:UIEdgeInsetsMake(0, 0, 0, padding)];
        };
    }

    cell.textLabel.text = _user.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"@%@", _user.handle ? : @""];
    [cell.textLabel sizeToFit];
    [cell.detailTextLabel sizeToFit];

    return cell;
}

- (void)didUpdateToObject:(id)object {
    if([object isKindOfClass:[IGUser class]]) {
        _user = object;
    } else{
        _user = nil;
    }
}

- (void)didSelectItemAtIndex:(NSInteger)index {
}

@end
