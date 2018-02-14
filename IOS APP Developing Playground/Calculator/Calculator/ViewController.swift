//
//  ViewController.swift
//  Calculator
//
//  Created by Xue Kaiyun on 2018/2/3.
//  Copyright © 2018年 Xue Kaiyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button_clear: UIButton!
    @IBOutlet weak var outputLabel: UILabel!
    var result : Float = 0
    var output : String = "0"
    var operation : Int?
    // 0:+  1:-   2:x   3:÷
    var operationNum : Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OnButtonTouched_0(_ sender: Any) {
        AddString(num: "0")
    }
    @IBAction func OnButtonTouched_1(_ sender: Any) {
        AddString(num: "1")
    }
    @IBAction func OnButtonTouched_2(_ sender: Any) {
        AddString(num: "2")
    }
    @IBAction func OnButtonTouched_3(_ sender: Any) {
        AddString(num: "3")
    }
    @IBAction func OnButtonTouched_4(_ sender: Any) {
        AddString(num: "4")
    }
    @IBAction func OnButtonTouched_5(_ sender: Any) {
        AddString(num: "5")
    }
    @IBAction func OnButtonTouched_6(_ sender: Any) {
        AddString(num: "6")
    }
    @IBAction func OnButtonTouched_7(_ sender: Any) {
        AddString(num: "7")
    }
    @IBAction func OnButtonTouched_8(_ sender: Any) {
        AddString(num: "8")
    }
    @IBAction func OnButtonTouched_9(_ sender: Any) {
        AddString(num: "9")
    }
    @IBAction func OnButtonTouched_Clear(_ sender: Any) {
        if button_clear.currentTitle == "C"{
            result = 0
            outputLabel.text = "0"
            button_clear.setTitle("AC", for: .normal)
        }else{
            operationNum = nil
            output = "0"
            operation = nil
            outputLabel.text = "0"
        }
    }
    @IBAction func OnButtonTouched_Reversal(_ sender: Any) {
        result = Str2Num(str: outputLabel.text!)
        result = -1 * result
        output = Num2Str(num: result)
        outputLabel.text = output
    }
    @IBAction func OnButtonTouched_Equal(_ sender: Any) {
        GetResult();
    }
    func GetResult(){
        switch operation {
        case nil:
            result = Str2Num(str: outputLabel.text!)
            outputLabel.text = output
        case 0?:
            if outputLabel.text == "Error"{
                outputLabel.text = "Error"
            }
            if output != "NULL"{
                operationNum = Str2Num(str: output)
            }
            if operationNum != nil{
                result = result + operationNum!
                output = "NULL"
                outputLabel.text = Num2Str(num: result)
            }else{
                output = "NULL"
                outputLabel.text = Num2Str(num: result)
            }
        case 1?:
            if outputLabel.text == "Error"{
                outputLabel.text = "Error"
            }
            if output != "NULL"{
                operationNum = Str2Num(str: output)
            }
            if operationNum != nil{
                result = result - operationNum!
                output = "NULL"
                outputLabel.text = Num2Str(num: result)
            }else{
                output = "NULL"
                outputLabel.text = Num2Str(num: result)
            }
        case 2?:
            if outputLabel.text == "Error"{
                outputLabel.text = "Error"
            }
            if output != "NULL"{
                operationNum = Str2Num(str: output)
            }
            if operationNum != nil{
                result = result * operationNum!
                output = "NULL"
                outputLabel.text = Num2Str(num: result)
            }else{
                output = "NULL"
            }
        case 3?:
            if outputLabel.text == "Error"{
                outputLabel.text = "Error"
            }
            if output != "NULL"{
                operationNum = Str2Num(str: output)
            }
            output = "NULL"
            if operationNum == 0{
                outputLabel.text = "Error"
            }else{
                if operationNum != nil{
                    result = result / operationNum!
                    outputLabel.text = Num2Str(num: result)
                }
            }
        default:
            result = Str2Num(str: output)
            outputLabel.text = output
        }
    }
    @IBAction func OnButtonTouched_Percent(_ sender: Any) {
        result = Str2Num(str: outputLabel.text!)
        result = result/100
        output = Num2Str(num: result)
        outputLabel.text = output
    }
    @IBAction func OnButtonTouched_Divided(_ sender: Any) {
        GetResult();
        result = Str2Num(str: outputLabel.text!)
        output = "NULL"
        operation = 3
    }
    
    @IBAction func OnButtonTouched_Multiply(_ sender: Any) {
        GetResult();
        result = Str2Num(str: outputLabel.text!)
        output = "NULL"
        operation = 2
    }
    @IBAction func OnButtonTouched_Point(_ sender: Any) {
        if !output.contains("."){
            AddString(num: ".")
        }
    }
    @IBAction func OnButtonTouched_Add(_ sender: Any) {
        GetResult();
        result = Str2Num(str: outputLabel.text!)
        output = "NULL"
        operation = 0
    }
    @IBAction func OnButtonTouched_Minus(_ sender: Any) {
        GetResult();
        result = Str2Num(str: outputLabel.text!)
        output = "NULL"
        operation = 1
    }
    func AddString(num : String) {
        if num != "0" || output != "0"{
            button_clear.setTitle("C", for: .normal)
        }   
        if output == "NULL"{
            output = "0"
        }
        if output == "0" && num != "." {
            output = num
            outputLabel.text = output
        }else if output == "0" && num == "."{
            output += num
            outputLabel.text = output
        }else {
            output += num
            outputLabel.text = output
        }
    }
    func Str2Num(str: String) -> Float {
        return Float(str)!
    }
    func Num2Str(num: Float) -> String{
        if num == round(num){
            return "\(Int(num))"
        }else{
        return "\(num)"
        }
    }
}
