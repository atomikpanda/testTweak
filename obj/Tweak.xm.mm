#line 1 "Tweak.xm"
#include <Nucleus/Nucleus.h>


- (id)init {

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Activate ~ UIColors" message:@"Thanks for downloading UIColors. Please go to Settings>UIColors to activate UIColors." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
extern void init()
{
Method m = [Nucleus methodFromSEL:@selector(init) inClass:objc_getClass("SBUIController") isClassMethod:NO];
Method m = [Nucleus methodFromSEL:@selector(init) inClass:[self class] isClassMethod:NO];
[Nucleus hookMethod:m inClass: hook:(Method)hook orig:NULL];
}
