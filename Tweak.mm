#import <UIKit/UIKit.h>
#import <Nucleus/Nucleus.h>
@interface Tweak : NSObject
-(void)setTextColor:(id)textColor;
-(void)layoutSubviews;
@end
static Nucleus *nuke;
@implementation Tweak

-(void)layoutSubviews {
//Get original IMP from Nucleus.originals
 IMP orig = [nuke originalForSEL:@selector(layoutSubviews) inClass:@"UILabel"];
	//Run original IMP
	orig(self,_cmd);
	//Set Text Color
	[self setTextColor:[UIColor redColor]];
}
-(void)setTextColor:(id)textColor {
//Set the textColor arg to red
textColor = [UIColor redColor];
	//Get original IMP from Nucleus.originals
 IMP orig = [nuke originalForSEL:@selector(setTextColor:) inClass:@"UILabel"];
	//Run original IMP
	orig(self,_cmd, textColor);
}

__attribute__((constructor))
static void initialize()
{ 
//Initialize
nuke = [[Nucleus alloc]init];

IMP hookTC= class_getMethodImplementation(objc_getClass("Tweak"), @selector(setTextColor:));
 [nuke hookMethod:@selector(setTextColor:) inClass:@"UILabel" hook:hookTC];
 
IMP hookLS = class_getMethodImplementation(objc_getClass("Tweak"), @selector(layoutSubviews));
 [nuke hookMethod:@selector(layoutSubviews) inClass:@"UILabel" hook:hookLS];
}
@end
