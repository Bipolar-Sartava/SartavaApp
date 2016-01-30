import UIKit
import Parse



class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //all txt's
    
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtchange1: UITextField!
    @IBOutlet weak var txtchange2: UITextField!
    
    var changingEmail: Bool = false
    
    //done editing info
    
    @IBAction func btndone(sender: AnyObject) {
        var user = PFUser.currentUser()
        if txtusername != nil || txtusername.text != "" {
            user?.username = txtusername.text
        } else {
            let alert = UIAlertController(title: "Error", message: "Invalid UserName", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if txtname != nil || txtname.text != "" {
            user!["fName"] = txtname.text
        } else {
            let alert = UIAlertController(title: "Error", message: "Invalid name", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        if changingEmail {
            if txtchange1.text != nil || txtchange1.text != "" || txtchange2.text != nil || txtchange2.text != "" {
                if txtchange1.text == user?.email {
                    user?.email = txtchange2.text
                } else {
                    let alert = UIAlertController(title: "Error", message: "This is not your OLD Email", preferredStyle:    UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                    self.presentViewController(alert, animated: true, completion: nil)
                }

            } else {
                if txtchange1.text == user?.password {
                    user?.password = txtchange2.text
                } else {
                    let alert = UIAlertController(title: "Error", message: "This is not your OLD Password", preferredStyle:     UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
        }

    }
    
    //change email function
    
    @IBAction func changeemail(sender: AnyObject) {
        changingEmail = true
        txtchange1.hidden = false
        txtchange2.hidden = false
        txtchange1.text = ""
        txtchange2.text = ""
        txtchange1.placeholder = "Old Email"
        txtchange2.placeholder = "New Email"
        
    }
    
    //change password function
    
    @IBAction func changepass(sender: AnyObject) {
        txtchange1.hidden = false
        txtchange2.hidden = false
        txtchange1.text = ""
        txtchange2.text = ""
        txtchange1.secureTextEntry = true
        txtchange2.secureTextEntry = true
        txtchange1.placeholder = "Old Password"
        txtchange2.placeholder = "New Password"
        
    }
    
    @IBOutlet weak var profileimg: UIImageView!
    
    var ipc : UIImagePickerController?
    
    //change profile pic
    
    @IBAction func EditPicBtn(sender: AnyObject) {
        
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

