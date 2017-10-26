//
//  CLWRootTabBarViewController.m
//  CleverParents
//
//  Created by Candy on 2017/8/21.
//  Copyright © 2017年 com.zhiweism. All rights reserved.
//

#import "CLWRootTabBarViewController.h"
#import "CLWHomeViewController.h"
#import "CLWSchoolViewController.h"
#import "CLWMessageViewController.h"
#import "CLWMineViewController.h"
#import "CLWNavigationViewController.h"


@interface CLWRootTabBarViewController ()

@property (nonatomic, strong)NSMutableArray <CLWNavigationViewController *>* VCArray;


@end

@implementation CLWRootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializUI];
}


- (void)initializUI {
    //tabBar工具栏背景图片
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_menu_bg"]];
    img.frame = CGRectMake(0, - SCREEN_WIDTH / 50, SCREEN_WIDTH, self.tabBar.frame.size.height + SCREEN_WIDTH / 50);
    img.contentMode = UIViewContentModeScaleToFill;
    [[self tabBar]insertSubview:img atIndex:0];
    
    NSArray *viewControllers = @[[[CLWHomeViewController alloc]init],[[CLWSchoolViewController alloc]init],[[CLWMessageViewController alloc]init], [[CLWMineViewController alloc]init]];
    //标签控制器 - 标题
    NSArray *tabBarItemTitle = @[
                                 NSLocalizedStringFromTable(@"tabBar.home", CleverLocalizable, @"首页"),
                                 NSLocalizedStringFromTable(@"tabBar.school", CleverLocalizable, @"学校"),
                                 NSLocalizedStringFromTable(@"tabBar.message", CleverLocalizable, @"消息"),
                                 NSLocalizedStringFromTable(@"tabBar.mine", CleverLocalizable, @"我的")];
    
    //标签控制器 - 正常图片
    NSArray *tabBarItemImageName = @[@"menu_index_normal@3x", @"menu_school_normal@3x", @"menu_interactive_normal@3x", @"menu_mine_normal@3x"];
    //标签控制器 - 选中图片
    NSArray *tabBarItemSelectedImageName =  @[@"menu_index_selected@3x", @"menu_school_selected@3x", @"menu_interactive_selected@3x", @"menu_mine_selected@3x"];
    _VCArray = [NSMutableArray array];
    //循环赋值
    for (int i = 0; i<viewControllers.count; i++) {
        UIViewController * vc = viewControllers[i];
        //方法一：直接初始化
        //UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:tabBarItemTitle[i] image:[UIImage imageNamed:tabBarItemImageName[i]] selectedImage:[UIImage imageNamed:tabBarItemSelectedImageName[i]]];
        //方法二：设置图片渲染
        UITabBarItem *item = [[UITabBarItem alloc] init];
        [item setTitle:tabBarItemTitle[i]];
        item.image = [[UIImage imageNamed:tabBarItemImageName[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:tabBarItemSelectedImageName[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem = item;
        vc.title = tabBarItemTitle[i];
        
        //未选中字体颜色
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:AAFont(12)} forState:UIControlStateNormal];
        //选中字体颜色
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:AAFont(12)} forState:UIControlStateSelected];
        [_VCArray addObject:[[CLWNavigationViewController alloc] initWithRootViewController:vc]];
    }
    
//    self.tabBar.barStyle = UIBarStyleBlack;
    //设置初始状态选中的下标
    self.selectedIndex = 0;
    //设置标签栏文字和图片的颜色
    self.tabBar.tintColor = [UIColor whiteColor];
    //设置标签栏的颜色
    self.tabBar.barTintColor = APP_MAIN_COLOR;
//    self.delegate = self;
    self.viewControllers = _VCArray;
    
}
@end
