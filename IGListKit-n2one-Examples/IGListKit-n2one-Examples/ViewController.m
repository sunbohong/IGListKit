//
//  ViewController.m
//  IGListKit-n2one-Examples
//
//  Created by sunbohong on 2016/10/27.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "ViewController.h"

#import <IGListKit_n2one/IGListKit.h>

#import "IGDemoSectionController.h"
#import "IGMixedDataViewController.h"

@interface ViewController ()<IGListAdapterDataSource>

@end

@implementation ViewController {
    IGListAdapter *_adapter;
    IGListCollectionView *_collectionView;
    NSArray *_demos;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Demos";

    self.automaticallyAdjustsScrollViewInsets = YES;
#warning 使用 mainQueue 后，collection 会发生偏移
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
    _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.estimatedItemSize = CGSizeMake(320, 44);

    _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];

    _demos = @[
        [[IGDemoItem alloc] initWithName:@"本页内容使用了自动布局" controllerClass:[ViewController class]],
        [[IGDemoItem alloc] initWithName:@"Mixed Data" controllerClass:[IGMixedDataViewController class]],
        [[IGDemoItem alloc] initWithName:@"最近因为某些原因，看到了很多与“库”相关的文章。但是，很多文章在经过英语→汉语的转换后都会丢失很多信息，让人难以理解。所以，这篇文章会好好的总结一下 iOS 中的那些“库”。" controllerClass:[ViewController class]],
    ];

    [self.view addSubview:_collectionView];
    _adapter.collectionView = _collectionView;
    _adapter.dataSource     = self;
//     }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _collectionView.frame = self.view.bounds;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable> > *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return _demos;
}

- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [IGDemoSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
