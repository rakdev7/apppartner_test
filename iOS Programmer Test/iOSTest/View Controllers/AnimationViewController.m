//
//  AnimationViewController.m
//  iOSTest
//
//  Created by App Partner on 12/13/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "AnimationViewController.h"
#import "MenuViewController.h"

@interface AnimationViewController ()
{
    
   
    CGPoint firstTouchPoint;
    
    //xd,yd destance between imge center and my touch center
    float xd;
    float yd;
}
@property (weak, nonatomic) IBOutlet UIImageView *loaderImage;
@property(strong,nonatomic) UIPanGestureRecognizer *panRecognizer;
@end

@implementation AnimationViewController

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make the UI look like it does in the mock-up.
 *
 * 2) Logo should spin when the user hits the spin button
 *
 * 3) User should be able to drag the logo around the screen with his/her fingers
 *
 * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
 *    section in Swfit to show off your skills. Anything your heart desires!
 *
 **/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Animation";
    [[self loaderImage]setUserInteractionEnabled:YES];
   

//    self.panRecognizer =[[UIPanGestureRecognizer alloc]
//     initWithTarget: self
//     action: @selector(handlePan:)];
//    NSLog(@"%@",self.loaderImage);
//    [self.loaderImage addGestureRecognizer:self.panRecognizer];

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    UITouch* bTouch = [touches anyObject];
    if ([bTouch.view isEqual:[self loaderImage]]) {
        firstTouchPoint = [bTouch locationInView:[self view]];
        xd = firstTouchPoint.x - [[bTouch view]center].x;
        yd = firstTouchPoint.y - [[bTouch view]center].y;
    }

}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* mTouch = [touches anyObject];
    if (mTouch.view == [self loaderImage]) {
        CGPoint cp = [mTouch locationInView:[self view]];
        [[mTouch view]setCenter:CGPointMake(cp.x-xd, cp.y-yd)];
    }
}
//-(void) handlePan:
//(UIGestureRecognizer *)sender
//{
//    UIPanGestureRecognizer *panRecognizer =
//    (UIPanGestureRecognizer *)sender;
//    if (panRecognizer.state ==
//        UIGestureRecognizerStateBegan ||
//        panRecognizer.state ==
//        UIGestureRecognizerStateChanged)
//    {
//        CGPoint currentPoint =
//        self.loaderImage.center;
//        CGPoint translation =
//        [panRecognizer translationInView:
//         self.loaderImage.superview];
//        self.loaderImage.center = CGPointMake
//        (currentPoint.x + translation.x,
//         currentPoint.y + translation.y);
//        [panRecognizer setTranslation: CGPointZero
//                               inView: self.loaderImage.superview];
//    }
//}


- (IBAction)backAction:(id)sender
{
    MenuViewController *mainMenuViewController = [[MenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

- (IBAction)didPressSpinButton:(id)sender
{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.fromValue = [NSNumber numberWithFloat:0.0f];
        animation.toValue = [NSNumber numberWithFloat: 2*M_PI];
        animation.duration = 10.0f;
        animation.repeatCount = INFINITY;
        [self.loaderImage.layer addAnimation:animation forKey:@"SpinAnimation"];
    
}
@end
