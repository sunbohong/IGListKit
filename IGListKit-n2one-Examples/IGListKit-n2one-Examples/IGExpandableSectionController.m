//
//  IGExpandableSectionController.m
//  IGListKit-n2one-Examples
//
//  Created by sunbohong on 2016/10/27.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "IGExpandableSectionController.h"

#import <SunCollectionViewCell/SunCollectionViewCell.h>


#import <ChameleonFramework/Chameleon.h>

static const CGFloat dx = 8;
static const CGFloat dy = 15;
static const UIEdgeInsets insets = {dy, dx, dy, dx};

@implementation IGExpandableSectionController {
    BOOL _expanded;
    NSString *_object;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    if(_expanded) {
        CGFloat width = self.collectionContext.containerSize.width;
        CGSize constrainedSize = CGSizeMake(width-insets.left-insets.right, CGFLOAT_MAX);
        CGRect bounds = [_object boundingRectWithSize:constrainedSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        return CGSizeMake(width, ceil(bounds.size.height) + insets.top+insets.bottom);
    } else{
        return CGSizeMake(self.collectionContext.containerSize.width, 52);
    }
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    SunCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[SunCollectionViewCell class] forSectionController:self identifier:NSStringFromClass(self.class) atIndex:index];

    if(cell.needConfig) {
        cell.needConfig = NO;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor = RandomFlatColor;
        cell.textLabel.font   = [UIFont systemFontOfSize:17];
        cell.separator.hidden = NO;
        cell.separatorInset = UIEdgeInsetsMake(0, dx, 0, dx);
    }

    cell.textLabel.numberOfLines = _expanded ? 0 : 1;
    cell.textLabel.frame = CGRectInset(cell.bounds, dx, dy);
    cell.textLabel.text  = _object;

    return cell;
}

- (void)didUpdateToObject:(id)object {
    if([object isKindOfClass:[NSString class]]) {
        _object = object;
    } else{
        _object = nil;
    }
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    _expanded = !_expanded;
    [self.collectionContext reloadSectionController:self];
}

@end
