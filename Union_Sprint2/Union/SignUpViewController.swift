//
//  SignUpViewController.swift
//  Union
//
//  Created by Administrator on 4/20/22.
//

import UIKit
import Parse
import AlamofireImage

class CellClass: UITableViewCell{
}

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    //Game Preferences
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    
    let transparentView = UIView()
    let tableView = UITableView()
    
    var selectedButton = UIButton()
    var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
    let user = PFUser()

    user.username = usernameField.text
    user.password = passwordField.text
    user.signUpInBackground{ (success, error) in
        if success {
            self.dismiss(animated: true, completion: nil)
            print("Registered!")
        } else {
            print("error!")
        }
    }
}
    
    // Creates a transparent view after clicking on preference buttons
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
    // Create table view
    tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        
        self.view.addSubview(tableView)
        tableView.layer.cornerRadius = 5
    
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        tableView.reloadData()
    
    let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
    transparentView.addGestureRecognizer(tapgesture)
    transparentView.alpha = 0
    
    UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations:
        {self.transparentView.alpha = 0.5
        self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: 200)
    }, completion: nil)
}
    
    @objc func removeTransparentView() {
        let frames = selectedButton.frame
    UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations:
        {self.transparentView.alpha = 0
        self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
    }, completion: nil)
    }
    
    
    @IBAction func onFirstChoiceButton(_ sender: Any) {
        dataSource = ["Point-and-click", "Fighting", "Shooter", "Music", "Platform", "Puzzle", "Racing", "Real Time Strategy(RTS)", "Role-playing(RPG)", "Simulator", "Sport", "Strategy", "Turn-based strategy(TBS)", "Tactical", "Quiz/Trivia", "Hack and slash", "Pinball", "Adventure", "Arcade", "Visual Novel", "Indie", "Card & Board Game", "MOBA"]
        selectedButton = firstChoice
        addTransparentView(frames: firstChoice.frame)
    }
    
    @IBAction func onSecondChoiceButton(_ sender: Any) {
        dataSource = ["Point-and-click", "Fighting", "Shooter", "Music", "Platform", "Puzzle", "Racing", "Real Time Strategy(RTS)", "Role-playing(RPG)", "Simulator", "Sport", "Strategy", "Turn-based strategy(TBS)", "Tactical", "Quiz/Trivia", "Hack and slash", "Pinball", "Adventure", "Arcade", "Visual Novel", "Indie", "Card & Board Game", "MOBA"]
        selectedButton = secondChoice
        addTransparentView(frames: secondChoice.frame)
    }
    
    @IBAction func onThirdChoiceButton(_ sender: Any) {
        dataSource = ["Point-and-click", "Fighting", "Shooter", "Music", "Platform", "Puzzle", "Racing", "Real Time Strategy(RTS)", "Role-playing(RPG)", "Simulator", "Sport", "Strategy", "Turn-based strategy(TBS)", "Tactical", "Quiz/Trivia", "Hack and slash", "Pinball", "Adventure", "Arcade", "Visual Novel", "Indie", "Card & Board Game", "MOBA"]
        selectedButton = thirdChoice
        addTransparentView(frames: thirdChoice.frame)
    }
}

extension SignUpViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 30
 //   }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        removeTransparentView()
    }

}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
