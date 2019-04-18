//
//  ViewController.swift
//  GimnasioPollo
//
//  Created by Mike on 4/11/19.
//  Copyright © 2019 UTNG. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating a cell using the custom class
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        //the artist object
        let person: PersonModel
        
        //getting the artist of selected position
        person = personList[indexPath.row]
        
        //adding values to labels
        cell.lblName.text = person.name
        cell.lblEge.text = person.ege
        cell.lblAlt.text = person.alt
        cell.lblPeso.text = person.peso
        cell.lblAddress.text = person.address
        
        //returning cell
        return cell
    }
    

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEge: UITextField!
    @IBOutlet weak var txtPeso: UITextField!
    @IBOutlet weak var txtAlt: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var lblPersons: UITableView!
    
    //list to store all the artist
    var personList = [PersonModel]()
    
    @IBAction func btnAdd(_ sender: Any) {
        addPerson()
    }
    //defining firebase reference var
    var refPersons: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FirebaseApp.configure()
        
        //getting a reference to the node artists
        refPersons = Database.database().reference().child("Persons");
        
        //observing the data changes
        refPersons.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.personList.removeAll()
                
                //iterating through all the values
                for artists in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let artistObject = artists.value as? [String: AnyObject]
                    let name  = artistObject?["Name"]
                    let id  = artistObject?["id"]
                    let ege = artistObject?["Ege"]
                    let peso = artistObject?["Peso"]
                    let alt = artistObject?["Alt"]
                    let address = artistObject?["Address"]
                    
                    //creating artist object with model and fetched values
                    let person = PersonModel(id: id as! String?, name: name as! String?, ege: ege as! String?, peso: peso as! String?, alt: alt as! String?, address: address as! String?)
                    
                    //appending it to list
                    self.personList.append(person)
                }
                
                //reloading the tableview
                self.lblPersons.reloadData()
            }
        })
        
    }
    
    func addPerson(){
        //generating a new key inside artists node
        //and also getting the generated key
        let key = refPersons.childByAutoId().key
        
        //creating artist with the given values
        let person = ["id":key,
                      "Name": txtName.text! as String,
                      "Ege": txtEge.text! as String,
                      "Peso": txtPeso.text! as String,
                      "Alt": txtAlt.text! as String,
                      "Address": txtAddress.text! as String
                      
        ]
        
        //adding the artist inside the generated unique key
        refPersons.child(key ?? "a").setValue(person)
        
        
    }


}

