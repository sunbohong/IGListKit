//
//  IGMixedDataViewController.m
//  IGListKit-n2one-Examples
//
//  Created by sunbohong on 2016/10/27.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "IGMixedDataViewController.h"

#import <IGListKit_n2one/IGListKit.h>
#import <ChameleonFramework/Chameleon.h>

#import "IGExpandableSectionController.h"
#import "IGGridSectionController.h"
#import "IGUserSectionController.h"
#import "IGUser.h"

@interface IGMixedDataViewController () <IGListAdapterDataSource>

@end

@implementation IGMixedDataViewController {
    IGListAdapter *_adapter;
    IGListCollectionView *_collectionView;
    NSArray *_data;
    Class _selectedClass;
    NSArray<NSArray *> *_segments;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _segments = @[
        @[@"All",
          @"Colors",
          @"Text",
          @"Users"],
        @[[NSNull class],
          [IGGridItem class],
          [NSString class],
          [IGUser class],
        ]];
    _selectedClass = [NSNull class];

    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:_segments[0]];
    control.selectedSegmentIndex = 0;
    [control addTarget:self action:@selector(onControl:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = control;

    _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing      = 2;
    layout.minimumInteritemSpacing = 2;
    layout.estimatedItemSize = CGSizeMake(320, 44);

    _collectionView = [[IGListCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];

    _data = @[
        @"Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
        [[IGGridItem alloc] initWithColor:RandomFlatColor itemCount:6],
        [[IGUser alloc] initWithPK:2 name:@"Ryan Olson" handle:@"jessie_squires"],
        @"Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
        [[IGUser alloc] initWithPK:4 name:@"Oliver Rickard" handle:@"ocrickard"],
        [[IGGridItem alloc] initWithColor:RandomFlatColor itemCount:5],
        @"Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
        [[IGUser alloc] initWithPK:3 name:@"Jessie Squires" handle:@"ryanolson"],
        [[IGGridItem alloc] initWithColor:RandomFlatColor itemCount:3],
        @"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
        [[IGGridItem alloc] initWithColor:RandomFlatColor itemCount:7],
        [[IGUser alloc] initWithPK:1 name:@"Ryan Nystrom" handle:@"_ryannystrom"],
    ];

    [self.view addSubview:_collectionView];
    _adapter.collectionView = _collectionView;
    _adapter.dataSource     = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _collectionView.frame = self.view.bounds;
}

- (void)onControl:(UISegmentedControl *)sender {
    _selectedClass = _segments[1][sender.selectedSegmentIndex];
    [_adapter performUpdatesAnimated:YES completion:nil];
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable> > *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    if(_selectedClass != [NSNull class]) {
        NSMutableArray *items = [NSMutableArray array];
        for(id obj in _data) {
            if([obj isKindOfClass:_selectedClass]) {
                [items addObject:obj];
            }
        }
        return items;
    } else{
        return _data;
    }
}

- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if([object isKindOfClass:[IGGridItem class]]) {
        return [IGGridSectionController new];
    } else if([object isKindOfClass:[IGUser class]]) {
        return [IGUserSectionController new];
    } else{
        return [IGExpandableSectionController new];
    }
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
