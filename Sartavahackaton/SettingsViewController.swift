import UIKit



class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //save btn saves changes for email and password
    
    @IBAction func savechanges(sender: AnyObject) {
        
    }
    
    //all txt's
    
    @IBOutlet weak var txtname: UITextField!
    
    @IBOutlet weak var txtusername: UITextField!
    
    @IBOutlet weak var txtchange1: UITextField!
    
    @IBOutlet weak var txtchange2: UITextField!
    
    //done editing info
    
    @IBAction func btndone(sender: AnyObject)
        
    {
        
    }
    
    //change email function
    
    @IBAction func changeemail(sender: AnyObject)
        
    {
        
        txtchange1.hidden = false
        
        txtchange2.hidden = false
        
        txtchange1.placeholder = "Old Email"
        
        txtchange2.placeholder = "New Email"
        
    }
    
    //change password function
    
    @IBAction func changepass(sender: AnyObject)
        
    {
        
        txtchange1.hidden = false
        
        txtchange2.hidden = false
        
        txtchange1.placeholder = "Old Password"
        
        txtchange2.placeholder = "New Password"
        
    }
    
    @IBOutlet weak var profileimg: UIImageView!
    
    var ipc : UIImagePickerController?
    
    //change profile pic
    
    @IBAction func EditPicBtn(sender: AnyObject)
        
    {
        
        ipc = UIImagePickerController()
        
        
        
        //Checking if the device posses a camera
        
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
            
            
            
        {
            
            
            
            ipc?.sourceType = UIImagePickerControllerSourceType.Camera
            
            
            
        }
            
            
            
        else
            
            
            
        {
            
            
            
            ipc?.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            
            
        }
        
        
        
        ipc?.delegate = self
        
        
        
        ipc?.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        
        
        self.presentViewController(ipc!, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        
        
        profileimg.image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        
    }
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        if self.revealViewController() != nil {
            
            btnMenu.target = self.revealViewController()
            
            btnMenu.action = "revealToggle:"
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
            
        }
        
        
        
        //Side Menu Custoization
        
        revealViewController().rearViewRevealWidth = 160
        
        revealViewController().rearViewRevealDisplacement = 60
        
        revealViewController().frontViewShadowRadius = 25
        
        revealViewController().frontViewShadowOffset = CGSizeMake(0.0, 2.5)
        
        revealViewController().frontViewShadowOpacity = 1.0
        
        revealViewController().frontViewShadowColor = UIColor.blackColor()
        
        revealViewController().toggleAnimationDuration = 0.7
        
        
        
        //Nav Bar Stuff
        
        let navBar = self.navigationController?.navigationBar
        
        navBar?.barTintColor = UIColor(red: 104/255, green: 174/255, blue: 235/225, alpha: 1.0)
        
        navBar?.tintColor = UIColor.whiteColor()
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        profileimg.layer.cornerRadius = profileimg.frame.size.height/2
        
        profileimg.clipsToBounds = true
        
        profileimg.layer.borderWidth = 1
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
}

