//
//  IGGridItem.m
//  IGListKit-n2one-Examples
//
//  Created by sunbohong on 2016/10/28.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "IGGridSectionController.h"

#import <SunCollectionViewCell/SunCollectionViewCell.h>
#import <ChameleonFramework/Chameleon.h>

@interface IGGridItem ()

@property (nonatomic)    UIColor *color;
@property (nonatomic) NSUInteger itemCount;

@end

@implementation IGGridItem

- (instancetype)initWithColor:(UIColor *)color itemCount:(NSUInteger)itemcount {
    if(self = [super init]) {
        _color     = color;
        _itemCount = itemcount;
    }
    return self;
}

@end


@implementation IGGridSectionController {
    IGGridItem *_object;
}

- (instancetype)init {
    if(self = [super init]) {
        self.minimumInteritemSpacing = 1;
        self.minimumLineSpacing      = 1;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return _object.itemCount ? : 0;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width    = [self.collectionContext containerSize].width;
    CGFloat itemSize = floor(width/4);
    return CGSizeMake(itemSize, itemSize);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    SunCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[SunCollectionViewCell class] forSectionController:self identifier:NSStringFromClass(self.class) atIndex:index];

    if(cell.needConfig) {
        cell.needConfig = NO;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor = RandomFlatColor;
        cell.textLabel.font = [UIFont systemFontOfSize:17];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;

        cell.didLayoutSubviewsBlock = ^(SunCollectionViewCell *cell){
            cell.textLabel.center = cell.contentView.center;
        };
    }

    cell.backgroundColor = _object.color;
    cell.textLabel.text  = [NSString stringWithFormat:@"%ld", index+1];
    [cell.textLabel sizeToFit];

    return cell;
}

- (void)didUpdateToObject:(id)object {
    if([object isKindOfClass:[IGGridItem class]]) {
        _object = object;
    } else{
        _object = nil;
    }
}

- (void)didSelectItemAtIndex:(NSInteger)index {
}

@end
