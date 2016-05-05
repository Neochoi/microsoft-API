//
//  ViewController.swift
//  Missing-Person
//
//  Created by 蔡智斌 on 16/5/1.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectedImg: UIImageView!
    
    
    let imagePicker = UIImagePickerController()
    
    
    
    
    let missingPeople = ["person1.jpg","person2.jpg","person3.jpg","person4.jpg","person5.jpg","person6.png"]
    
    let baseURL = "http://localhost:6069/img/"


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        imagePicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(loadPicker(_:)))
        tap.numberOfTapsRequired = 1
        selectedImg.addGestureRecognizer(tap)
    }
    
    
    
    @IBAction func checkForMatch(sender: AnyObject) {
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String : AnyObject]) {//获取图片
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            selectedImg.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loadPicker(gesture: UITapGestureRecognizer){//读取图片
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return missingPeople.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PersonCell", forIndexPath: indexPath) as! PersonCell
        let url = "\(baseURL)\(missingPeople[indexPath.row])"
        cell.configureCell(url)
        return cell
    }

}

