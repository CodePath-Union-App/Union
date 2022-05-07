//
//  FeedViewController.swift
//  Union
//
//  Created by Administrator on 4/12/22.
//

import UIKit
import AlamofireImage
import Foundation

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var tableView: UITableView!
    
    var games = [[String:Any]]() // Creating an array
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 335
        //Do any additional setup after loading the view.
        //List of games API
        let url = URL(string: "https://api.rawg.io/api/games?key=cb066cebbec641558aaa4c6b40614ead")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                    self.games = dataDictionary["results"] as! [[String:Any]] // Casting
                    self.tableView.reloadData()
                 
                    //print(dataDictionary)
                 
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell") as! GameCell
        
        let game = games[indexPath.row]
        let title = game["name"] as! String
        cell.titleLabel.text = title
        
        let posterPath = game["background_image"] as! String
        let posterUrl = URL(string: posterPath)
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Find the selected game
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for:cell)!
        let game = games[indexPath.row]
        
        
        // Pass the selected movie to the details view controller
        let detailsViewController = segue.destination as! GameDetailsViewController
        detailsViewController.game = game
                
        tableView.deselectRow(at: indexPath, animated: true) // Deselects a row when you return from navigation
    }
    

}
