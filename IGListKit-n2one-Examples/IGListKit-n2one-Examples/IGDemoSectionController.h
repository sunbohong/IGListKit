//
//  IGDemoSectionController.h
//  IGListKit-n2one-Examples
//
//  Created by sunbohong on 2016/10/27.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <IGListKit_n2one/IGListKit.h>

@interface IGDemoItem : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) Class controllerClass;

- (instancetype)initWithName:(NSString *)name controllerClass:(Class)controllerClass;

@end


@interface IGDemoSectionController : IGListSectionController<IGListSectionType>

@end
