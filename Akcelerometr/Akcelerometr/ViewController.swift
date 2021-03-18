//
//  ViewController.swift
//  Akcelerometr
//
//  Created by Jakub Rękas on 18/01/2021.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var squatLbl: UILabel!
    @IBOutlet weak var pajacykLbl: UILabel!
    @IBOutlet weak var situpsLbl: UILabel!
    
    var squat = 0
    var sitUps = 0
    var pajacyk = 0
    
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motionManager.accelerometerUpdateInterval = 0.2
        
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                if myData.acceleration.y < -1.5 && myData.acceleration.x > -0.5 && myData.acceleration.x < 0.5
                {
                    self.squat = (self.squatLbl.text as! NSString).integerValue
                    self.squat += 1
                    self.squatLbl.text = String(self.squat)
                }
                if myData.acceleration.y > 3 && myData.acceleration.x < -1
                {
                    self.pajacyk = (self.pajacykLbl.text as! NSString).integerValue
                    self.pajacyk += 1
                    self.pajacykLbl.text = String(self.pajacyk)
                }
                if myData.acceleration.x < -1 && myData.acceleration.y > -0.5 && myData.acceleration.y < 0.5
                {
                    self.sitUps = (self.situpsLbl.text as! NSString).integerValue
                    self.sitUps += 1
                    self.situpsLbl.text = String(self.sitUps)
                }
            }
        }
    }
    


}

