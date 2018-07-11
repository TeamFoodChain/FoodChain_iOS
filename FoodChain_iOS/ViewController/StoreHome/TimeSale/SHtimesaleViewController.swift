//
//  SHtimesaleViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 10..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class SHtimesaleViewController: UIViewController {

    @IBOutlet weak var timesaleTV: UITableView!
    @IBOutlet weak var timerLB: UILabel!
    var seconds = 7200
    var timer = Timer()
    
    var isTimerRunning = false
    var resumeTapped = false
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
       
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate time's up.
        } else {
            seconds -= 1
            timerLB.text = timeString(time: TimeInterval(seconds))
            
           
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        timesaleTV.delegate = self
        timesaleTV.dataSource = self
        
        if isTimerRunning == false {
            runTimer()
        }
        
     
        
    }

    
   

}
extension SHtimesaleViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timesaleCell") as! SHtimesaleTableViewCell
        return  cell
    }
    
    
}
extension SHtimesaleViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextview = UIStoryboard.init(name: "StoreHome", bundle: nil).instantiateViewController(withIdentifier: "detailView") as! SHhomeDetailViewController
        
        navigationController?.pushViewController(nextview, animated: true)
    }
    
}
