//
//  ZYPageBrocastCollectionView.h
//  PageBroadcast
//
//  Created by ren on 2019/3/19.
//  Copyright © 2019年 ren. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZYPageBrocastCollectionViewDelegate <NSObject>

@optional;
/*
 * 点击某条广播时
 */
- (void)pageBrocastcollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ZYPageBrocastCollectionView : UICollectionView
/*
 * 代理对象
 */
@property (nonatomic, weak) id <ZYPageBrocastCollectionViewDelegate> brocastDelegate;
/*
 * 数据源
 */
@property (nonatomic , strong) NSMutableArray *dataArr;
/*
 * 背景颜色
*/
@property (nonatomic , strong) UIColor *bgColor;
/*
 * 字体大小 默认系统 17.0f
 */
@property (nonatomic, strong) UIFont *textFont;
/*
 * 字体颜色 默认系统 黑色
 */
@property (nonatomic, strong) UIColor *textColor;
/*
 * 字体位置 默认系统 局左边
 */
@property (nonatomic, assign) NSTextAlignment textAlignment;

- (instancetype)initWithFrame:(CGRect)frame
         collectionViewLayout:(UICollectionViewLayout *)layout
                    DataArray:(NSArray *)dataArray;
@end
