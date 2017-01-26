//
//  ViewController.swift
//  imagePicker
//
//  Created by 윤사라 on 2017. 1. 26..
//  Copyright © 2017년 boostcamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create tapGesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
        
        //add to the image view
        imgView.addGestureRecognizer(tapGesture)
        
        
        
        
        //make sure imageview can be interacted with by user
        imgView.isUserInteractionEnabled = true
        
        //UIView에 있는 userinteractionenabled와 imageview와 차이점
        
    }
    
    
    //imageview tap 되었을때
    func imageTapped(gesture: UIGestureRecognizer){
        
        //이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        
        //델리게이트 지정
        picker.delegate = self
        
        
        //alert action생성
        let alert = UIAlertController(title: nil, message:nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title:"Album", style:.default, handler:{
            action in
            picker.sourceType = .savedPhotosAlbum
            self.present(picker, animated: true, completion: nil)
        }))
        
        
        alert.addAction(UIAlertAction(title:"Photo Library", style: .default, handler:{
            action in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title:"Cancel", style:.cancel, handler:nil))
        
        //화면에 표시
        self.present(alert, animated:true, completion:nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //이미지를 이미지 뷰에 표시
        self.imgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        //picker controller창 닫기
        picker.dismiss(animated: false, completion: nil)
        
        //alert 생성
        let alert = UIAlertController(title: "이미지를 성공적으로 가져왔어요", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: false, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: false, completion: nil)
        
        //알림창
        let alert = UIAlertController(title: " ", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
        
        self.present(alert, animated:false, completion:nil)
        
        
    }
   
    @IBAction func shareImage(_ sender: Any) {
        let activityItem: [AnyObject] = [self.imgView.image as AnyObject]
        
        let avc = UIActivityViewController(activityItems: activityItem as [AnyObject], applicationActivities: nil)
        
        self.present(avc, animated: true, completion: nil)
    }
    
  }



