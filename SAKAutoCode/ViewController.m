//
//  ViewController.m
//  SAKAutoCode
//
//  Created by Fan Li Lin on 2020/12/15.
//

#import "ViewController.h"
#import "SAKCustomScript01.h"
#import "SAKJsonToModel.h"
#import "SAKCustomScript02.h"

@interface ViewController()
@property (weak) IBOutlet NSPopUpButton *popUpButton;
@property (unsafe_unretained) IBOutlet NSTextView *inputTextView;
@property (unsafe_unretained) IBOutlet NSTextView *outputTextView;
@property (weak) IBOutlet NSButton *commitButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /// 禁用引号的智能替换功能
    self.inputTextView.automaticQuoteSubstitutionEnabled = NO;
    self.outputTextView.automaticQuoteSubstitutionEnabled = NO;
    
    [self setupItems];
}

- (void)setupItems
{
    [self.popUpButton removeAllItems];
    [self.popUpButton addItemsWithTitles:
     @[
         @"Json生成属性声明",
         @"埋点json生成code",
         @"埋点Android Json格式生成code"]];
}

- (IBAction)commitButtonClick:(NSButton *)sender
{
    if (self.popUpButton.indexOfSelectedItem == 0) {
        self.outputTextView.string = [SAKJsonToModel outputCodeWithJsonString:self.inputTextView.string];
        
    }else if (self.popUpButton.indexOfSelectedItem == 1) {
        self.outputTextView.string = [SAKCustomScript01 outputCodeWithJsonString:self.inputTextView.string];
        
    }else if (self.popUpButton.indexOfSelectedItem == 2) {
        self.outputTextView.string = [SAKCustomScript02 outputCodeWithJsonString:self.inputTextView.string];
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end


