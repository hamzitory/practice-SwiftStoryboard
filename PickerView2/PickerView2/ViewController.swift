//
//  ViewController.swift
//  PickerView2
//
//  Created by 나연  강 on 2023/01/10.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10 // 이미지의 파일명을 저장할 배열의 최대 크기
    let PICKER_VIEW_COLUMN = 2 // 피커뷰 열의 개수
    let PICKER_VIEW_HEIGHT:CGFloat=80 // 피커뷰 높이
    var imageArray = [UIImage?]() // UIImage 타입의 배열 선언
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"] // 이미지의 파일명을 저장할 배열
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblImageFileName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 값을 0에서 MAX_ARRAY_NUM보다 작을 떄까지 반복
        for i in 0 ..< MAX_ARRAY_NUM {
            //각 파일명에 해당하는 이미지를 생성
            let image = UIImage(named: imageFileName[i])
            //생성된 이미지를 imageArray에 추가
            imageArray.append(image)
        }
        
        //뷰가 로드되었을 때 첫번째 파일명을 출력
        lblImageFileName.text = imageFileName[0]
        //뷰가 로드되었을 때 첫번째 이미지 출력
        imageView.image = imageArray[0]
    }

    //return the number of 'columns' to display 피커뷰의 컴포넌트 수 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    //return height of row for each component 피커뷰의 높이 설정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    //return the # of rows in each component.. 피커뷰의 개수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)
    -> Int {
        return imageFileName.count
    }
    
    //피커뷰의 각 Row 타이틀 설정
    /*func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
    -> String {
        return imageFileName[row]
    }*/
    
    //피커뷰의 각 Row의 view 설정
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x:0, y:0, width:100, height:150)
        return imageView
    }
    
    //피커뷰가 선택되었을 때 실행
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component==0) {
            lblImageFileName.text = imageFileName[row]
        }
        else {
            imageView.image = imageArray[row]
        }
        
    }
}

