//
//  ViewController.swift
//  DatePicker
//
//  Created by kyungmin on 2023/01/03.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector : Selector = #selector(ViewController.updateTime)    // timeSelector : 타이머가 구동되는 실행할 함수 지정
    let interval = 1.0      // 타이머의 간격 값 1초
    var count = 0       // 타이머가 설정한 간격대로 실행되는지 확인 하기 위한 변수
    var alarmTime : String?
    
    
    @IBOutlet var lblCurrentTime: UILabel!   // 현재시간 아울렛변수 선언
    @IBOutlet var lblPickerTime: UILabel!   // 선택시간 아울렛변수 선언
    
    
    // 내가 만든 뷰를 불러왔을 때 호출되는 함수, 뷰가 불러진 후 실행하고자 하는 기능이 필요할때 코드 선언
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    // 데이트피커를 선택했을때 실행되는 액션 함수  !!
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"    // 년 월 일 시 분 요일
        lblPickerTime.text =
        "선택시간: " + formatter.string(from:  datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    // 타이머가 동작할 때 실행할 함수
    @objc func updateTime() {
       // lblCurrentTime.text = String(count)
       // count = count + 1
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
        formatter.dateFormat =  "hh:mm aaa"
        let currentTime = formatter.string(for: date)
        
        if(alarmTime == currentTime)
        {
            view.backgroundColor = UIColor.red
        }
        else
        {
            view.backgroundColor = UIColor.white
        }
    }
    
}

