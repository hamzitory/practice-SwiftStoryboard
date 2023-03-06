//
//  ViewController.swift
//  DatePicker
//
//  Created by 나연  강 on 2023/01/02.
//

import UIKit

class ViewController: UIViewController {
    //타이머가 구동되면 실행될 함수
    let timeSelector : Selector = #selector(ViewController.updateTime)
    let interval = 1.0 //타이머의 간격값 1.0
    var count = 0 //타이머가 설정한 간격대로 싫행되는지 확인하기 위한 변수
    
    @IBOutlet var lblCurrentTime: UILabel! //현재 시간 레이블의 아웃렛 변수
    @IBOutlet var lblPickerTime: UILabel! //선택 시간 레이블의 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender // 전달된 인수 저장
        let formatter = DateFormatter() // DateFormatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // formatter의 dateFormat 속성을 설정
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date) // 데이트 피커에서 선택한 날짜를 포맷대로 string매서드를 사용하여 문자열로 변환
    }
    
    //타이머가 구동된 후 정해진 시간이 되었을 때 실행할 함수
    @objc func updateTime() {
        //count값을 문자열로 변환하여 현재시간에 출력
        //lblCurrentTime.text = String(count)
        //count = count + 1
        
        let date = NSDate() // 현재 시간을 가져옴
        
        //DateFormatter라는 클래스의 상수 formatter를 선언
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" // 상수 formatter의 속성 설정
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date) //현재시간에 문자열 추가 
    }
    
}

