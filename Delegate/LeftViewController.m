
#import "LeftViewController.h"
#import "IIViewDeckController.h"
#import "AppDelegate.h"
#import "ViewController.h"


@implementation LeftViewController

//table arrow not loading
// allow spacing between table view cells

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _rowNum = 0;
    //list of items stores search data, allows user to press tab and re do search
    if (self.listOfItems.count!=0){
        self.backLabel.hidden = NO;
        
    }
    
    
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    
    
    self. tableView.separatorColor = [UIColor clearColor];
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    self.tableView.rowHeight = 88;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.scrollsToTop = NO;
    
    ////////////////////////////////////////////////////////
    
    UILabel *headerLabel =
    [[UILabel alloc]
     initWithFrame:CGRectMake(0, 0, 300, 44)];
    headerLabel.text = NSLocalizedString(@"Recent", @"");
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.font = [UIFont fontWithName:@"Avenir Light" size:22];
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"searchTop"]];
    [self.view addSubview:headerLabel];
    
    
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Do whatever data deletion you need to do...
        [self.listOfItems removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationLeft ];
        if(self.listOfItems.count==0){
            self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableViewBackground.png"]];
        }
        
        
        
    }
    
    [tableView endUpdates];
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;//self.listOfItems.count;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //this is where search term must take parameter
    self.link = @"Timeline_of_United_States_history_(1790%E2%80%931819)";
    //[self openView2:UIViewAnimationOptionTransitionCurlDown];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //is there a cell that can be reused
    
    
    
    static NSString *cellID = @"Cell Identifier";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    
    if (!cell) {
        
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"barTabLeft.png"]];
        
        
        
        
    }
    else{
        
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
        
        
        
        //name = value for key in array of recent searchers
        if (_rowNum == 0){
            NSString *cellValue = [self.listOfItems objectAtIndex:indexPath.row];
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = cellValue;
            cell.textLabel.textColor = [UIColor whiteColor];
            
        }
        
        
        
    }
    
    
    return cell;
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


@end