//
//  ViewController.swift
//  IOS-Swift-CoreMotionDeviceMotion
//
//  Created by Pooya on 2018-09-12.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    
    @IBOutlet weak var xDevi: UITextField!
    @IBOutlet weak var yDevi: UITextField!
    @IBOutlet weak var zDevi: UITextField!
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDeviceMotion()
        
    }

    func myDeviceMotion(){
        print("Start DeviceMotion")
        motion.deviceMotionUpdateInterval  = 0.5
        motion.startDeviceMotionUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let trueData =  data {
                
                self.view.reloadInputViews()
                let mPitch = trueData.attitude.pitch
                let mRoll = trueData.attitude.roll
                let mYaw = trueData.attitude.yaw
                self.xDevi!.text = "x (pitch): \(Double(mPitch).rounded(toPlaces: 3))"
                self.yDevi!.text = "y (roll): \(Double(mRoll).rounded(toPlaces: 3))"
                self.zDevi!.text = "z (yaw): \(Double(mYaw).rounded(toPlaces: 3))"
            }
        }
        return
    }
}


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
