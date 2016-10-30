//
//  IGDemoSectionController.m
//  IGListKit-n2one-Examples
//
//  Created by sunbohong on 2016/10/27.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "IGDemoSectionController.h"

#import <SunCollectionViewCell/SunCollectionViewCell.h>
#import <ChameleonFramework/Chameleon.h>

static const CGFloat dx = 8;
static const CGFloat dy = 15;
static const UIEdgeInsets insets = {dy, dx, dy, dx};

@implementation IGDemoItem

- (instancetype)initWithName:(NSString *)name controllerClass:(Class)controllerClass {
    if(self = [super init]) {
        _name = name;
        _controllerClass = controllerClass;
    }
    return self;
}

@end


@implementation IGDemoSectionController {
    IGDemoItem *_object;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGSize constrainedSize = CGSizeMake(width-insets.left-insets.right, CGFLOAT_MAX);
    CGRect bounds = [_object.name boundingRectWithSize:constrainedSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    return CGSizeMake(bounds.size.width+insets.left+insets.right, ceil(bounds.size.height) + insets.top+insets.bottom);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {

    Identifier(IGDemoSectionController)

    SunCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[SunCollectionViewCell class] forSectionController:self identifier:reuseIGDemoSectionControllerIdentifier atIndex:index];

    if(cell.needConfig) {
        cell.needConfig = NO;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor = RandomFlatColor;
        cell.textLabel.numberOfLines   = 0;
        cell.separatorInset = UIEdgeInsetsMake(0, dx, 0, dx);
        cell.separator.hidden = NO;
    }

    cell.textLabel.text  = _object.name;
    cell.textLabel.frame = CGRectInset(cell.bounds, dx, dy);

    return cell;
}

- (void)didUpdateToObject:(id)object {
    if([object isKindOfClass:[IGDemoItem class]]) {
        _object = object;
    } else{
        _object = nil;
    }
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    UIViewController *controller = (UIViewController *)[[_object.controllerClass alloc] init];
    controller.title = _object.name;
    [self.viewController.navigationController pushViewController:controller animated:YES];
}

@end
