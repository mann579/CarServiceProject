#import "CSViewController.h"
#import "AFNetworking.h"
#import "CSsearchserviceprovider.h"
@interface CSViewController ()
{
    NSDictionary *stateDic;
    NSArray *modelsDic;
    UIImagePickerController *imagepicker;
     NSInteger buttonTag;
    NSArray * ServiceType;
    NSInteger load;
    NSInteger dicRow;
     BOOL toggle;
    CSsearchserviceprovider *vc;
    NSString *jobIDStr;
    NSMutableArray *imagestore;
    
}
@end

@implementation CSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ServiceType=@[@"wheel Alignment",@"Wheel Balancing",@"Cooling Systems",@"Brakes",@"Clutch and Auto transmission",@"Auto Electrical",@"Suspensions and shocks",@"Exhaust Systems"];
    
    _btn_next.layer.cornerRadius=5.0;
    _date_picker.hidden=YES;
    _picker_view.hidden=YES;

  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://api.edmunds.com/api/vehicle/v2/makes?fmt=json&year=2014&api_key=veu6nzhb6jprpbq9zqcsj2m8" parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             stateDic=[[NSDictionary alloc] initWithDictionary:responseObject];
             
             [_picker_view reloadAllComponents];
             NSLog(@"JSON: %@", responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    vc=[[CSsearchserviceprovider alloc] init];
    
    
    _textfieldcarmake.inputView=_servicerequset_view;
    _textfieldcarmodel.inputView=_servicerequset_view;
    _textfield_servicetype.inputView=_servicerequset_view;
    _textfielddate_time.inputView=_servicerequset_view;;

    
    [_servicerequset_view setFrame:CGRectMake(0, 568, _servicerequset_view.frame.size.width, _servicerequset_view.frame.size.height)];
    
    
    imagepicker=[[UIImagePickerController alloc]init];
    
    imagepicker.delegate = self;
    imagepicker.allowsEditing = YES;
    imagestore=[[NSMutableArray alloc]init];
    }
    -(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
    {
        
        UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
        [(UIButton*)[self.view viewWithTag:buttonTag] setBackgroundImage:chosenImage forState:UIControlStateNormal];
        [imagestore addObject:chosenImage];
        
        [picker dismissViewControllerAnimated:YES completion:NULL];
    }

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    return 1;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (load==1) {
      
        return ServiceType.count;
    }
    
    else if(load==2)
    {
         return [[stateDic valueForKeyPath:@"makes.name"] count];
    
    }
    else if (load==3)
    {
        return modelsDic.count;
    }
    else
        return 0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (load==1) {
    return ServiceType[row];
    }

else if(load==2)
{
    return [[stateDic valueForKeyPath:@"makes.name"] objectAtIndex:row];
}
    else if (load==3)
    {
        return [modelsDic objectAtIndex:row];
        
    }
    
    return nil;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (load==1) {
        
    _textfield_servicetype.text=[ServiceType objectAtIndex:row];
    }
    
    else if(load==2)
    
    {_textfieldcarmodel.text=@"";
        _textfieldcarmake.text=[[stateDic valueForKeyPath:@"makes.name"] objectAtIndex:row];
     
        dicRow=row;
        
    }
    else if(load==3)
    {
        _textfieldcarmodel.text=[modelsDic objectAtIndex:row];
    }
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
    
}- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [_picker_view selectRow:0 inComponent:0 animated:YES];
    [_picker_view reloadAllComponents];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
  

    load=textField.tag;
    //_picker_view.hidden=NO;
    
    if (textField.tag==1||textField.tag==2||textField.tag==3) {

        _picker_view.hidden=NO;
        _date_picker.hidden=YES;
        
    }
    
       if (textField.tag==9) {
         _picker_view.hidden=YES;
        _date_picker.hidden=NO;
    }
    
    return YES;
}
- (IBAction)btn_done:(UIButton *)sender {
    
    [self  show];
    
    
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        imagepicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagepicker animated:YES completion:NULL];
        
    }
    else if(buttonIndex==1)
    {
        imagepicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagepicker animated:YES completion:NULL];
    }
    else if (buttonIndex==2)
    {
         [(UIButton*)[self.view viewWithTag:buttonTag] setBackgroundImage:[UIImage imageNamed:@"camerapic"] forState:UIControlStateNormal];
        
    }
}
- (IBAction)btn_imges:(UIButton *)sender {
    
    buttonTag=[sender tag];
    
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"choose" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Photo library",@"Delete", nil];
    
    [action showInView:self.view];
    
}
-(void)show
{
    [self.view endEditing:YES];
    modelsDic=[[stateDic valueForKeyPath:@"makes.models.name"] objectAtIndex:dicRow];
    [_picker_view reloadAllComponents];
    
}

- (IBAction)action_date_picker:(UIDatePicker *)sender {
    
    _picker_view.hidden=YES;
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    NSString *pickdate=[format stringFromDate:_date_picker.date];
    _textfielddate_time.text=pickdate;
}

- (IBAction)btn_checkbox:(UIButton *)sender {
    
    if (!toggle) {
        [_btn_checkbox setImage:[UIImage imageNamed:@"tick"] forState:UIControlStateNormal];
        
    }
    else{
        
        [_btn_checkbox setImage:[UIImage imageNamed:@"without_tick"] forState:UIControlStateNormal];}
    
    toggle=!toggle;
}

- (IBAction)btn_cancel:(id)sender {
    
    
    if (load==1) {
        _textfield_servicetype.text=nil;
    }
    else if (load==2)
    {
        _textfieldcarmake.text=nil;
        
    }
    else if (load==3)
    {
        _textfieldcarmodel.text=nil;
        
    }
    else if (load==9)
    {
        _textfielddate_time.text=nil;
    }
    
   [self.view endEditing:YES];
    
}
- (IBAction)btn_next:(UIButton *)sender {
    
    NSString *serviceTypeStr = [[_textfield_servicetype text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *cartypes = [[_textfieldcarmake text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *carModel = [[_textfieldcarmodel text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *carregno = [[_textfiledreg_vehicleno text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *textviewdes = [[_textfield_description text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if (serviceTypeStr.length == 0||cartypes.length==0||carModel.length==0||carregno.length==0)
    { UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"ALert" message:@"Please Enter the Field " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        
        [alert show];
       
    }
    else if ([[_btn_images backgroundImageForState:UIControlStateNormal]isEqual:[UIImage imageNamed:@"camerapic"]])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"ALert" message:@"Please select first  image " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alert show];
             }
    else if (textviewdes.length==0 )
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"ALert" message:@"Please fill the Description " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alert show];
             }
    
        else{
            
            NSData *imagedata=UIImageJPEGRepresentation([imagestore objectAtIndex:0], 0.7);
            PFFile *imagefile=[PFFile fileWithData:imagedata];
            PFObject *service_pro=[PFObject objectWithClassName:@"jobs"];
            [service_pro setValue:@"1" forKey:@"consumerId"];
            [service_pro setValue:@"101" forKey:@"service_provider_id"];
            [service_pro setValue:cartypes forKey:@"car_make"];
            [service_pro setValue:carModel forKey:@"car_model"];
            [service_pro setValue:carregno forKey:@"vehicle_number"];
            [service_pro setObject:imagefile forKey:@"imagestore"];
 
            
            [service_pro saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    jobIDStr= service_pro.objectId;
                    
                    [self performSegueWithIdentifier:@"MySegue" sender:sender];}
                }];
        }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
        if ([[segue identifier] isEqualToString:@"MySegue"]) {
            
            // Get destination view
           vc = [segue destinationViewController];
            
            vc.jobID= jobIDStr;
        
            
                   }
        
    }


@end
