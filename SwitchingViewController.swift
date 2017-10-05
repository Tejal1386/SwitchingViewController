//
//  SwitchingViewController.swift
//  MultiViewApp
//
//  Created by Tejal Patel on 2017-10-04.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class SwitchingViewConreoller: UIViewController {
    
    //PRIVATE INSTANCE VARIABLE
    private var _blueViewController: BlueViewConreoller!
    private var _yellowViewController: YelloViewController!
    
   //this triggers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._blueViewController =
        storyboard?.instantiateViewController(withIdentifier: "Blue") as!
        BlueViewConreoller
        
        self._blueViewController.view.frame = view.frame
        SwitchViewConreoller(from: nil, to:self._blueViewController  )
    
    }
    
    //when switch view button on toolbar is pressed
    @IBAction func switchViews(sender: UIBarButtonItem){
    
        //instantiate new view controller object
        if self._yellowViewController?.view.subviews == nil{
        
           self._yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as!
            YelloViewController
        }
        else if self._blueViewController?.view.subviews == nil{
            
            self._blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewConreoller
        }
        
        //clean up current controller and attach the new one
        if self._blueViewController != nil && self._blueViewController!.view.superview != nil
        {
            self._yellowViewController.view.frame = view.frame
            SwitchViewConreoller(from: self._blueViewController, to: self._yellowViewController)
        }
        else
        {
           self._blueViewController.view.frame = view.frame
            SwitchViewConreoller(from: _yellowViewController, to: _blueViewController)
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        if self._blueViewController != nil &&
            self._blueViewController!.view.superview == nil{
        self._blueViewController = nil
        }
        if self._yellowViewController  != nil && self._yellowViewController.view.superview == nil
        {
            self._yellowViewController = nil
        }
    }
    
    
    
    private func SwitchViewConreoller(from fromVC:UIViewController?, to toVC:UIViewController?)
    {
    
        //cleans up current view controller
        if fromVC != nil{
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        if toVC != nil {
        self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParentViewController: self)
            
        }
    }
}
