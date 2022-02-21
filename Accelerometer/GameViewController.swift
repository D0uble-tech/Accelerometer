//
//  GameViewController.swift
//  Accelerometer
//
//  Created by Motonari Sakuma on 2022/02/21.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    
    @IBOutlet var awaImageView: UIImageView!
    let motionManager = CMMotionManager()
    var accelarationX: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { data, error in
                self.accelarationX = (data?.acceleration.x)!
                self.awaImageView.center.x += CGFloat(self.accelarationX*20)
                
                if self.awaImageView.frame.origin.x < 40 {
                    self.awaImageView.frame.origin.x = 40
                }
                
                if self.awaImageView.frame.origin.x > 260{
                    self.awaImageView.frame.origin.x = 260
                }
            }
            
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.accelerationX = self.accelarationX
    }
    
    override func didReceiveMemoryWaining() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
