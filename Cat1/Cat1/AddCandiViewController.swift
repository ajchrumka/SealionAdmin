//
//  AddCandiViewController.swift
//  Cat1
//
//  Created by USER on 02/11/2018.
//  Copyright © 2018 LearnAppMaking. All rights reserved.
//

import UIKit

class AddCandiViewController: UIViewController {
    
    var previuosVC = CandidatesTableViewController()
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var eMail: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var position: UITextField!
    @IBOutlet weak var location: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        let stringDate = dateOfBirth.text!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        let birthDate = dateFormatter.date(from: stringDate)
        
        
        if let unwrappedFName = firstName.text {
            // test for nil
            if unwrappedFName.count != 0 {
                if let unwrappedLName = lastName.text {
                    //test for nil
                    if unwrappedLName.count != 0 {
                        if let unwrappedeMail = eMail.text {
                            //test for nil
                            if unwrappedeMail.count != 0 {
//                                let newCandidate = Candidate()
                                if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                                    let newCandidate = CandidateCore(entity: CandidateCore.entity(), insertInto:context)
                                    newCandidate.firstName = unwrappedFName
                                    newCandidate.lastName = unwrappedLName
                                    newCandidate.eMail = unwrappedeMail
                                
                                    newCandidate.doB = birthDate
                                    newCandidate.position = position.text
                                    newCandidate.location = location.text
                            
//                                previuosVC.candidates.append(newCandidate)
//                                previuosVC.tableView.reloadData()
                                    try? context.save()
                                
                                    navigationController?.popViewController(animated: true)
                                }
                          } else {
                                return
                            }
                        } else {
                            // handle duff email
                        }
                    } else {
                        return
                    }
                } else {
                    // handle duff surname
                }
    
            } else {
                return
            }
        } else {
            // handle duff first name
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

}
