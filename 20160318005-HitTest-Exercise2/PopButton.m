//
//  PopButton.m
//  20160318005-HitTest-Exercise2
//
//  Created by Rainer on 16/3/18.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "PopButton.h"

@implementation PopButton

/**
 *  视图事件处理方法
 *  这里处理视图触摸事件查找最适合的视图来处理该事件
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 1.判断当前视图是否可以处理事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) return nil;
    
    // 2.查找最适合处理事件的视图返回
    // 2.1.将当前触摸点转换为子视图的触摸点
    CGPoint childPoint = [self convertPoint:point toView:self.chartButton];
    
    // 2.2.判断转换后的触摸点是否在子视图上：如果在就返回子视图，如果不在就返回系统默认处理方式
    if ([self.chartButton pointInside:childPoint withEvent:event]) {
        return self.chartButton;
    } else {
        return [super hitTest:point withEvent:event];
    }
}

/**
 *  视图触摸移动事件处理
 *  这里实现视图随着手指移动位置移动位置
 */
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.获取触摸对象
    UITouch *touch = [touches anyObject];
    
    // 2.取出当前触摸点
    CGPoint currentPoint = [touch locationInView:self];
    
    // 3.取出上一次触摸点
    CGPoint previouPoint = [touch previousLocationInView:self];
    
    // 4.计算偏移量
    CGFloat offSetX = currentPoint.x - previouPoint.y;
    CGFloat offSetY = currentPoint.y - previouPoint.y;
    
    // 5.设置视图的偏移位置
    [UIView animateWithDuration:0.01 animations:^{
        self.transform = CGAffineTransformTranslate(self.transform, offSetX, offSetY);
    }];
    
//    CGPoint center = self.center;
//
//    center.x += offSetX;
//    center.y += offSetY;

//    self.center = center;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
