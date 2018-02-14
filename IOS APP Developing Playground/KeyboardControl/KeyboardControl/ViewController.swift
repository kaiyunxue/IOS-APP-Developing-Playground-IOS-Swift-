//
//  ViewController.swift
//  KeyboardControl
//
//  Created by Xue Kaiyun on 2018/2/6.
//  Copyright © 2018年 Xue Kaiyun. All rights reserved.
//

import UIKit

class ViewController:UIViewController, UITextViewDelegate {

    @IBOutlet weak var MyPassword: UITextField!
    @IBOutlet weak var MyUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        if textField == MyUsername {
            MyPassword.becomeFirstResponder()
        }else if textField == MyPassword{
            textField.resignFirstResponder();
    }
    return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch Began")
        
        self.view.endEditing(true)

    }

}

