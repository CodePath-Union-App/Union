//
//  GameDetailsViewController.swift
//  Union
//
//  Created by Celeste Urena on 5/6/22.
//

import UIKit
import AlamofireImage

class GameDetailsViewController: UIViewController {
    
    var game: [String:Any]!

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = game["title"] as? String
        descriptionLabel.text = game["description"] as? String
        
        let posterPath = game["background_image"] as! String
        let posterUrl = URL(string: posterPath)
        backdropView.af.setImage(withURL: posterUrl!)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
