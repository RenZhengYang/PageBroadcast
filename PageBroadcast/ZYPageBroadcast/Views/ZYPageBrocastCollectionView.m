//
//  ZYPageBrocastCollectionView.m
//  PageBroadcast
//
//  Created by ren on 2019/3/19.
//  Copyright © 2019年 ren. All rights reserved.
//

#import "ZYPageBrocastCollectionView.h"
#import "ZYPageBroadcastCell.h"

#define scrollMaxSections 20

static NSString *const cellID = @"ZYPageBroadcastCell";

@interface ZYPageBrocastCollectionView () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ZYPageBrocastCollectionView

- (instancetype)initWithFrame:(CGRect)frame
         collectionViewLayout:(UICollectionViewLayout *)layout
                    DataArray:(NSMutableArray *)dataArray
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self){
        
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        self.scrollsToTop = NO;
        self.scrollEnabled = YES;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor whiteColor]; // 默认
      
        self.dataArr = dataArray;
        
        [self registerClass:[ZYPageBroadcastCell class] forCellWithReuseIdentifier:cellID];
    }
    return self;
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return scrollMaxSections;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataArr.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     ZYPageBroadcastCell *cell = (ZYPageBroadcastCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    cell.labText.text = self.dataArr[indexPath.row];
    cell.labText.textAlignment = self.textAlignment;
    cell.labText.font      = self.textFont;
    cell.labText.textColor = self.textColor;
    cell.backgroundColor   = self.bgColor;
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width, self.frame.size.height);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.brocastDelegate respondsToSelector:@selector(pageBrocastcollectionView:didSelectItemAtIndexPath:)]) {
        [self.brocastDelegate pageBrocastcollectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}

@end
