//
//  TvGuieController.swift
//  myGuie
//
//  Created by internet on 5/16/15.
//  Copyright (c) 2015 acdevel. All rights reserved.
//

import UIKit

class TvGuieController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    var items = NSMutableArray()
    
    func loadData() -> NSMutableArray {
        RestApiManager.Static.sharedIntance.getRequest { json -> Void in
            let results = json["results"]
            for (index: String, subJson: JSON) in results {
                let movie: AnyObject = subJson.object
                self.items.addObject(movie)
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
            }
        }
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var id = UIDevice.currentDevice().identifierForVendor.UUIDString
        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.loadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        println("Appear")
        // We need load the list
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return items.count
    }

    //
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellID: NSString = "tv_list"

        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellID) as UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row]["title"] as? String
        cell.detailTextLabel?.text = items[indexPath.row]["release_date"] as? String
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("Variable.." + segue.identifier!)
        let detail = segue.destinationViewController as DetailController
        let seletedIndex = self.tableView.indexPathForSelectedRow()?.row
        
        detail.titlema = "Mad Max: Fury Road"
        
        detail.posterma = "/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"
        
        detail.detailma = "An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and most everyone is crazed fighting for the necessities of life. Within this world exist two rebels on the run who just might be able to restore order. There's Max, a man of action and a man of few words, who seeks peace of mind following the loss of his wife and child in the aftermath of the chaos. And Furiosa, a woman of action and a woman who believes her path to survival may be achieved if she can make it across the desert back to her childhood homeland."
    }

}
