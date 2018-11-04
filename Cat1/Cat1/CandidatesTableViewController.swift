//
//  CandidatesTableViewController.swift
//  Cat1
//
//  Created by USER on 01/11/2018.
//  Copyright © 2018 LearnAppMaking. All rights reserved.
//

import UIKit

class CandidatesTableViewController: UITableViewController {
    
    var candidates : [CandidateCore] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCandidates()
    }
    
    func getCandidates() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreCandidates = try? context.fetch(CandidateCore.fetchRequest()) as? [CandidateCore] {
                if let coreDataCandidates = coreCandidates {
                    candidates = coreDataCandidates
                    tableView.reloadData()
                }
            }
        }
        

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candidates.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let candidate = candidates[indexPath.row]
        
        if candidate.live {
            /*
            let ratingString = " Ov:" + String(candidate.overall) + " Ph:" + String(candidate.physical) + " Ob:" + String(candidate.observation) + " Mo:" + String(candidate.moral)
            */
            let fullName = "\(candidate.firstName!) \(candidate.lastName!) "
            let overallString = " Ov:\(candidate.overall)%"
            let physicalString = " Ph:\(candidate.physical)%"
            let observationString = " Ob:\(candidate.observation)%"
            let moralString = " Mo:\(candidate.moral)%"

            cell.textLabel?.text =  fullName  + overallString + physicalString + observationString + moralString
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let candidate = candidates[indexPath.row]
        performSegue(withIdentifier: "MoveToUpdate", sender: candidate)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddCandiViewController {
            addVC.previuosVC = self
        }
        
        if let updateVC = segue.destination as? UpdateCandidateViewController {
            if let candidate = sender as? CandidateCore {
                updateVC.selectedCandidate = candidate
                updateVC.previuosVC = self
            }
        }
    }
    
}
