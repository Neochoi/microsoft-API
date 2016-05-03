//
//  PersonCell.swift
//  Missing-Person
//
//  Created by 蔡智斌 on 16/5/1.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    
    
    func configureCell(imgUrl: String){
        if let url = NSURL(string: imgUrl){
            downloadImage(url)
        }
    }
    
    
    func downloadImage(url: NSURL){
        getDataFromUrl(url) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue()){() -> Void in
                guard let data = data where error == nil else {return}
                self.personImage.image = UIImage(data: data)
        }
    }
}
    
    func getDataFromUrl(url: NSURL, completion: ((data: NSData?, response: NSURLResponse?,error: NSError?) -> Void)){
        NSURLSession.sharedSession().dataTaskWithURL(url){(data,response,error) in
            completion(data: data,response: response,error: error)
    }.resume()
  }
}