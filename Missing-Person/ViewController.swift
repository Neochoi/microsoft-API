//
//  ViewController.swift
//  Missing-Person
//
//  Created by 蔡智斌 on 16/5/1.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    @IBOutlet weak var collectionView: UICollectionView!


    @IBOutlet weak var selectedImg: UIImageView!
    
    
    
    
    let missingPeople = ["person1.jpg","person2.jpg","person3.jpg","person4.jpg","person5.jpg","person6.png"]
    
    let baseURL = "http://localhost:6069/img/"


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
    
    @IBAction func checkForMatch(sender: AnyObject) {
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

