#import <UIKit/UIKit.h>
#import <Nucleus/Nucleus.h>

@interface UILabelHooks : NSObject
-(void)setText:(NSString*)text;
-(void)orig_setText:(NSString*)text;
@end

@implementation UILabelHooks

-(void)setText:(NSString*)text {
    [self orig_setText:[text stringByAppendingString:@"--WORKS!"]];
}
@end

__attribute__((constructor))
static void initialize() {
    [Nucleus hook:@selector(setText:) inClass:@"UILabel" fromClass:@"UILabelHooks"];
}
