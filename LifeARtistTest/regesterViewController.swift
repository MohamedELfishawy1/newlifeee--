//
//  regesterViewController.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 5/12/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit

class regesterViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate {

    @IBOutlet var fullname: UITextField!
    @IBOutlet var usernaem: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var Imageimg: UIImageView!
    @IBOutlet var namecompany: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var number: UITextField!
    @IBOutlet var place: UITextField!
    @IBOutlet var info: UITextField!
    @IBAction func importImage(_ sender: Any) {
        let imagepickercontrller = UIImagePickerController()
        imagepickercontrller.delegate = self
        
        let actionsheet = UIAlertController(title:"photo source" , message: "chosse a source" , preferredStyle: .actionSheet)
        actionsheet.addAction(UIAlertAction(title: "camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagepickercontrller.sourceType = .camera
                self.present(imagepickercontrller, animated: true, completion: nil)
                
            }else{
                print("camera not availble")
            }
            
        }))
        actionsheet.addAction(UIAlertAction(title: "photo Libarary", style: .default, handler: { (action:UIAlertAction) in
            imagepickercontrller.sourceType = .photoLibrary
            self.present(imagepickercontrller, animated: true, completion: nil)
        }))
        actionsheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        self.present(actionsheet, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        Imageimg.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fullname.delegate = self
        self.usernaem.delegate = self
        self.email.delegate = self
        self.password.delegate = self
        self.namecompany.delegate = self
        self.place.delegate = self
        self.number.delegate = self
        self.info.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillchange(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillchange(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillchange(notification:)
            ), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        
    }
    
    @objc func keyboardwillchange(notification:Notification){
        print("keyboardwillshow: \(notification.name.rawValue)")
        view.frame.origin.y = -300
        
        
    }
       

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
