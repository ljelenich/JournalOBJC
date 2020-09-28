//
//  EntryDetailViewController.m
//  Journal
//
//  Created by LAURA JELENICH on 9/28/20.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)updateViews
{
    if (!self.entry) return;
    self.titleTextField.text = self.entry.title;
    self.bodyTextView.text = self.entry.bodyText;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)saveButtonTapped:(id)sender {
    NSString *title = _titleTextField.text;
    NSString *body = _bodyTextView.text;
    if (title.length) {
        if (_entry) {
            [EntryController.sharedInstance updateEntry:_entry title:title bodyText:body];
        } else {
            [EntryController.sharedInstance addEntrywithTitle:title bodyText:body];
        }
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTaped:(id)sender {
    _titleTextField.text = @"";
    _bodyTextView.text = @"";
}

@end
