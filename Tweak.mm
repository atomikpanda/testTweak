#import <UIKit/UIKit.h>
#import <Nucleus/Nucleus.h>

static Nucleus *nucleus;

__attribute__((constructor))
static void initialize() {
    nucleus = [[Nucleus alloc] init];
    nucleus.debug = YES;
    [nucleus initClasses:@[@"UILabelHooks"]];
}

@interface UILabelHooks : NSObject
-(void)Nucleus;
-(void)setText:(NSString*)text;
-(void)orig_setText:(NSString*)text;
@end

@implementation UILabelHooks
-(void)Nucleus {
    [nucleus hook:@selector(setText:) inClass:@"UILabel" fromClass:@"UILabelHooks"];
}
-(void)setText:(NSString*)text {
    [self orig_setText:[text stringByAppendingString:@"--WORKS!"]];
}
@end
