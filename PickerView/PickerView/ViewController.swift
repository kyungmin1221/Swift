//
//  ViewController.swift
//  PickerView
//
//  Created by kyungmin on 2023/03/18.
//
/*
 피커뷰는 아이폰에서 원하는 항목을 선택할 수 있게 해주는 객체로,
 피커(picker)라고도 합니다.
 데이트 피커가 날짜와 시간을 선택하기 위한 객체라면 ,
 피커뷰는 문자열을 선택하기 위한 객체입니다.
 */

/*
 델리게이트(delegate)
 : 대리자를 뜻하며 누군가 해야 할 일을 대신 해주는 역할을 한다.
   예를 들어 특정 객체와 상호작용할 때 메시지를 넘기면 그 메시지에 대한 책임은
   델리게이트로 위임된다..
   델리게이트 메서드는 해당 역할을 수행하며 처리결과나 메시지 등을 받는다.
   즉, 사용자가 객체를 터치했을 때 해야 할 일을 델리게이트 매서드에 구현하고,
   해당 객체가 터치되었을 때 델리게이트가 호출되어 위임받은 일을 하게 된다. 
 */
import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 10      // 이미지의 파일명을 저장할 배열의 최대 크기를 지정
    let PICKER_VIEW_COLUMN = 1      // 피커뷰의 열의 개수 지정
    var imageArray = [UIImage?]()
    var imageFileName = [ "1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var IbImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        IbImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        IbImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
    
}

