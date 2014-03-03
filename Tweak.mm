#import <UIKit/UIKit.h>
#define NUDebug
#import <Nucleus/Nucleus.h>

__attribute__((constructor))
static void initialize() {
    [Nucleus initClasses:@[@"UILabelHooks"]];
}

@interface UILabelHooks : NSObject
-(void)Nucleus;
-(void)setText:(NSString*)text;
-(void)orig_setText:(NSString*)text;
@end

@implementation UILabelHooks
-(void)Nucleus {
    [Nucleus hook:@selector(setText:) inClass:@"UILabel" fromClass:@"UILabelHooks"];
}
-(void)setText:(NSString*)text {
    [self orig_setText:[text stringByAppendingString:@"--WORKS!"]];
}
@end
