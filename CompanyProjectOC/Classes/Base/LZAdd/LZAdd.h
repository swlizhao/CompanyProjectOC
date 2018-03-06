

#import <UIKit/UIKit.h>

@interface LZAdd : UIView

@property(nonatomic,copy)void(^lzAddBtnClickedBlock)(UIButton * button);

@property(nonatomic,strong)UIColor * titleColor;
@property(nonatomic,strong)UIFont  * titleFont;
@property(nonatomic,copy)NSString * titleString;
@property(nonatomic,strong)UIImage * bgImg;
@end
