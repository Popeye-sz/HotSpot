//
//  WebViewController.m
//  HotSpot
//
//  Created by 何青 on 2022/5/15.
//

#import "WebViewController.h"
#import "HotSearchItem.h"

#import <WebKit/WebKit.h>

@interface WebViewController ()
@property (strong, nonatomic) WKWebView *webView;
@end

@implementation WebViewController

- (instancetype)initWithFrame:(CGRect)frame model:(HotSearchItem *)model {
    self = [super init];
    if (self) {
        UIView *view = [[UIView alloc] initWithFrame:frame];
        self.view = view;
        self.navigationItem.title = model.title;

        //init webview
        CGRect webViewFrame = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100);
        self.webView = [[WKWebView alloc] initWithFrame:webViewFrame];
        [self.webView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self.view addSubview:self.webView];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:model.urlString]];
        [self.webView loadRequest:request];
    }
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
