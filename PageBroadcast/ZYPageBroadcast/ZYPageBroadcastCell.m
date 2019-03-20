//
//  ZYPageBroadcastCell.m
//  PageBroadcast
//
//  Created by ren on 2019/3/19.
//  Copyright © 2019年 ren. All rights reserved.
//

#import "ZYPageBroadcastCell.h"

@implementation ZYPageBroadcastCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self configViews];
    }
    return self;
}

- (void)configViews{
    _labText = [[UILabel alloc] init];
    _labText.frame = self.bounds;
    [self addSubview:_labText];
  
}

@end
