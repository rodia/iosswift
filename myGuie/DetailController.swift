//
//  DetailController.swift
//  myGuie
//
//  Created by internet on 5/17/15.
//  Copyright (c) 2015 acdevel. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    struct Movie {
        var title: String
        var poster: String
        var rata: String
        var average: String
        var detail: String
    }
    var titlema: String!
    var posterma: String!
    var detailma: String!
    var item: Movie!

    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var dateMovie: UILabel!
    @IBOutlet weak var rateMovie: UILabel!
    @IBOutlet weak var averageMovie: UILabel!
    @IBOutlet weak var posterMovie: UIImageView!
    @IBOutlet weak var detailMovie: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = RestApiManager.Static.sharedIntance.getImageSource(posterma)

        if let url = NSURL(string: img) {
            if let data = NSData(contentsOfURL: url){
                posterMovie.contentMode = UIViewContentMode.ScaleAspectFit
                posterMovie.image = UIImage(data: data)
            }
        }
        
        titleMovie.text = titlema
        detailMovie.text = detailma
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
