//
//  TableViewController.m
//  WebViewTest
//
//  Created by Игорь Талов on 22.05.16.
//  Copyright © 2016 Игорь Талов. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()
@property(strong, nonatomic) NSArray* pdfArray;
@property(strong, nonatomic) NSArray* urlArray;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString* vkUrlString = @"http://www.vk.com/iosdevcourse";
    NSString* googleUrlString = @"http://www.google.com";
    NSString* yandexUrlString = @"http://www.yandex.ru";
    NSString* bookUrlString = @"book.pdf";
    NSString* iPadBook = @"iPad_ru.pdf";
    
    NSArray* urlArray = @[vkUrlString,googleUrlString,yandexUrlString];
    self.urlArray = urlArray;
    NSArray* pdfArray = @[bookUrlString,iPadBook];
    self.pdfArray = pdfArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return [self.urlArray count];
    } else {
       return [self.pdfArray count];
    }
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"URL";
    } else {
        return @"PDF";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [self.urlArray objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [self.pdfArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    if (indexPath.section == 0) {
        vc.url = [NSURL URLWithString:[self.urlArray objectAtIndex:indexPath.row]];
    } else if (indexPath.section == 1) {
        vc.url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:[self.pdfArray objectAtIndex:indexPath.row] ofType:nil]];
    }
    [self.navigationController pushViewController:vc animated:YES];
}


@end
