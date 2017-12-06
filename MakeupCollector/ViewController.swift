//
//  ViewController.swift
//  MakeupCollector
//
//  Created by Sophie Amin on 2017-12-01.
//  Copyright © 2017 Sophie Amin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var makeups : [Makeup] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
             makeups = try context.fetch(Makeup.fetchRequest())
            tableView.reloadData()
        }
        catch{
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return makeups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let makeup = makeups[indexPath.row]
        cell.textLabel?.text = makeup.productName
        cell.imageView?.image = UIImage(data: makeup.image as! Data)
        return cell
    }

    


}

