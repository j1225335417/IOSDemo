

#import "NJBProgressContentView.h"


@implementation NJBProgressContentView

+ (instancetype)create
{
//    UIImage *contentImage = [UIImage imageNamed:@"img_progress_main"];
//    UIImage *circleImage = [UIImage imageNamed:@"img_progress_circle"];
//    CGFloat width = MAX(contentImage.size.width, circleImage.size.width);
//    CGFloat height = MAX(contentImage.size.height, circleImage.size.height);
//    UIImageView *mainImgView = [[UIImageView alloc]initWithImage:contentImage];
//    UIImageView *circleImgView = [[UIImageView alloc]initWithImage:circleImage];
//    NJBProgressContentView *view = [[NJBProgressContentView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
//    view.backgroundColor = [UIColor clearColor];
//    [view addSubview:mainImgView];
//    mainImgView.center = CGPointMake(width/2.0, height/2.0);
//    [view addSubview:circleImgView];
//    circleImgView.center = CGPointMake(width/2.0, height/2.0);
//    
//    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    animation.fromValue = [NSNumber numberWithFloat:0.0f];
//    animation.toValue = [NSNumber numberWithFloat: 2*M_PI];
//    animation.duration = 1.5f;
//    animation.repeatCount = MAXFLOAT;
//    [circleImgView.layer addAnimation:animation forKey:@"MyAnimation"];

    UIImage *contentImage1          = [UIImage imageNamed:@"njb_loading_pic_01"];
    UIImage *contentImage2          = [UIImage imageNamed:@"njb_loading_pic_02"];

    CGFloat width                   = contentImage1.size.width;
    CGFloat height                  = contentImage1.size.height;
    
    NJBProgressContentView *view    = [[NJBProgressContentView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    view.backgroundColor            = [UIColor clearColor];
    
    NSArray *images                 = @[contentImage1,contentImage2,contentImage1];

    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [view addSubview:imageView];
    //    [view addSubview:circleImgView];
    //    circleImgView.center = CGPointMake(width/2.0, height/2.0);
    
    imageView.animationImages = images;
    imageView.animationDuration = 0.5;

    [view addSubview:imageView];
    [imageView startAnimating];
    
    return view;
}

@end
