//
//  ViewController.swift
//  Project1
//
//  Created by burk burs on 26.01.2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        // for making our title big in initial screen. But it effects our sub navigations.
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            print(item)
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        
    }
    
    // this func means how many row in our table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // this method describes how each cell looks like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) //definin cell
        cell.textLabel?.text = pictures[indexPath.row] //index path contains [sectionIndex, rowIndex]
        return cell
    }
    
    // this method says what happens when row tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // creating viewcontroller from storyboard with StoryboardID
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            
            // pushing our vc to navigation stack
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
}

