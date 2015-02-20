//
//  SensoresTableViewController.m
//  metabolismo3
//
//  Created by molina on 2/10/15.
//  Copyright (c) 2015 Tec de Monterrey. All rights reserved.
//

#import "SensoresTableViewController.h"
#import "DetallesTableViewController.h"

@interface SensoresTableViewController ()

@end

@implementation SensoresTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urls = @"http://citm.ccm.itesm.mx/sc1/sensores.aspx";
    NSURL *url = [NSURL URLWithString:urls];
    NSData *data = [NSData dataWithContentsOfURL:url];
    self.subs = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.subs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; cell.textLabel.font = [UIFont systemFontOfSize:19.0]; cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    }
    NSDictionary *dico = self.subs[indexPath.row];
    
    cell.textLabel.text= [dico[@"descripcion"]description];
    return cell;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"si se selecciono %d", (int)indexPath.row);
    [self performSegueWithIdentifier:@"cambiar" sender:self];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"se llamo el segue");
    DetallesTableViewController *siguienteVista=segue.destinationViewController;
    NSInteger a=self.tableView.indexPathForSelectedRow.row;
    siguienteVista.elrenglon=self.subs[a];


    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}












@end
