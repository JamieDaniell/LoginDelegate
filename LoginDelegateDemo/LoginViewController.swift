//
//  LoginViewController.swift
//  LoginDelegateDemo
//
//  Created by Pasan Premaratne on 7/7/15.
//  Copyright (c) 2015 Treehouse. All rights reserved.
//

import UIKit

// Define the function of the loginVeiwControllerDelegate
protocol LoginViewControllerDelegate
{
    // if crediatials are successfully validated 
    // the  call didloginsuccesfully 
    // Screen will be dismissed
    func didLoginSuccessfully()
}

class LoginViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    // don't alwayes require a delegate
    var delegate: LoginViewControllerDelegate?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // from login view
    @IBAction func loginButtonPressed(sender: AnyObject)
    {
        // if the password and username are correct
        if usernameField.text == "jamie" && passwordField.text == "testing123"
        {
            resignFirstResponder()//
            delegate?.didLoginSuccessfully()// call did login successfully
        }
        else
        {
            // create alert pop-up
            let alertController = UIAlertController(title: "Error!", message: "The username and password combination failed.", preferredStyle: .Alert)
            // create a button
            let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in })
            // add the button to the alert controller
            alertController.addAction(ok)
            // present the button
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    // From UITextFieldDelegate
    // Need to work out if there is text before submit
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        let length = textField.text!.characters.count - range.length + string.characters.count
        if length > 0
        {
            submitButton.enabled = true
        }
        else
        {
            submitButton.enabled = false
        }
        return true
    }
}







