//
//  ViewController.swift
//  LoginDelegateDemo
//
//  Created by Pasan Premaratne on 7/7/15.
//  Copyright (c) 2015 Treehouse. All rights reserved.
//

import UIKit

// make ViewController a delegate of UIVIewController and LoginViewControllerDelegate
// LogininViewControllerDelegate --> Protocol defined in the LoginViewController
class ViewController: UIViewController, LoginViewControllerDelegate {
    
    // initally set logged in to false
    var loggedIn: Bool = false
    {
        // when changed check for logged in 
        // if true then configure the view
        didSet
        {
            if loggedIn == true
            {
                configureView()
            }
        }
    }
    
    // initial: "you are not logged in"
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        // if loggedIn is false then send to the login view
        if loggedIn == false
        {
            performSegueWithIdentifier("showLogin", sender: nil)
        }
    }
    
    // whe the logged in status changes call this function
    func configureView()
    {
        textLabel.text = "Welcome! You are now logged in!"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // call this function when logged in
    func didLoginSuccessfully()
    {
        // properery observer on the loggedIn variable
        loggedIn = true // set logged in to true calling other functions
        dismissViewControllerAnimated(true, completion: nil) // get rid of current view
    }
    
    // Whenn called with a segue and a sender object
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // if segue want to go to "showLogin"
        if segue.identifier == "showLogin"
        {
            // set the destination as the Login ViewController 
            let loginVC = segue.destinationViewController as! LoginViewController
            // the delagte of the loginVC in the LoginViewController as self
            loginVC.delegate = self
        }
    }
}

