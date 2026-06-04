#import "ViewController.h"

#import <AnimaX/AnimaXContext.h>
#import <AnimaX/AnimaXView.h>
#import <AnimaX/BaseAnimaXAbility.h>

@interface ViewController ()

@property(nonatomic, strong) BaseAnimaXAbility *ability;
@property(nonatomic, strong) AnimaXView *animaxView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor colorWithRed:250.0 / 255.0
                                              green:250.0 / 255.0
                                               blue:250.0 / 255.0
                                              alpha:1.0];

  self.ability = [[BaseAnimaXAbility alloc] init];
  AnimaXContext *context = [[AnimaXContext alloc] initWithAbility:self.ability];
  self.animaxView = [[AnimaXView alloc] initWithContext:context];
  self.animaxView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:self.animaxView];

  UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
  [NSLayoutConstraint activateConstraints:@[
    [self.animaxView.centerXAnchor constraintEqualToAnchor:guide.centerXAnchor],
    [self.animaxView.centerYAnchor constraintEqualToAnchor:guide.centerYAnchor],
    [self.animaxView.widthAnchor constraintLessThanOrEqualToAnchor:guide.widthAnchor constant:-48.0],
    [self.animaxView.widthAnchor constraintLessThanOrEqualToConstant:320.0],
    [self.animaxView.widthAnchor constraintGreaterThanOrEqualToConstant:220.0],
    [self.animaxView.heightAnchor constraintEqualToAnchor:self.animaxView.widthAnchor]
  ]];

  NSString *path = [[NSBundle mainBundle] pathForResource:@"simple_shape" ofType:@"json"];
  if (path.length > 0) {
    NSURL *url = [NSURL fileURLWithPath:path];
    [self.animaxView setLoop:YES];
    [self.animaxView setAutoplay:YES];
    [self.animaxView setSrc:url.absoluteString];
  }
}

@end
