#import "OSIconContentView.h"




@implementation OSIconContentView
@synthesize wallpaperView = _wallpaperView;
@synthesize contentView = _contentView;


-(id)init{
	if(![super initWithFrame:[[UIScreen mainScreen] bounds]]){
		return nil;
	}

	self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;


	self.wallpaperView = [[objc_getClass("SBWallpaperView") alloc] initWithOrientation:[[UIApplication sharedApplication] statusBarOrientation] variant:1];
	self.wallpaperView.image = [self.wallpaperView.image stackBlur:50.0];
	[self addSubview:self.wallpaperView];


    self.contentView = [[objc_getClass("SBIconController") sharedInstance] contentView];
	[self addSubview:self.contentView];



	return self;


}


-(void)prepareForDisplay{
	[self bringSubviewToFront:self.wallpaperView];
	[self addSubview:self.contentView];
}

-(void)dealloc{
	[self.wallpaperView release];
	[super dealloc];
}

@end