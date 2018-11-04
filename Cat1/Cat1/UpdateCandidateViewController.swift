//
//  UpdateCandidateViewController.swift
//  Cat1
//
//  Created by USER on 02/11/2018.
//  Copyright © 2018 LearnAppMaking. All rights reserved.
//

import UIKit

    let trialList = ["Grip Intro","Grip Endurance 1","Grip Endurance 2","Grip Race 1","Grip Race 2","Grip Max Endurance","Blink","Composure","Yell","Questions"]

class UpdateCandidateViewController: UIViewController {
    
    var previuosVC = CandidatesTableViewController()
    var selectedCandidate : CandidateCore?

    @IBOutlet weak var titleName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleName.text = (selectedCandidate?.firstName)! + " " + (selectedCandidate?.lastName)!

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateAction(_ sender: Any) {
        var index = 0
        for candidate in previuosVC.candidates {

            if candidate.eMail == selectedCandidate!.eMail {
                previuosVC.candidates[index].overall = 10
                previuosVC.candidates[index].physical = 20
                previuosVC.candidates[index].observation = 30
                previuosVC.candidates[index].moral = 40
                break
            }
            index += 1
        }
        previuosVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteCandidate(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let deadCandidate = selectedCandidate {
                context.delete(deadCandidate)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
