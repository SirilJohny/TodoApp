//
//  ViewController.swift
//  Estudent
//
//  Created by DDUKK on 24/11/22.
//

import UIKit
import CoreData

class ViewController: UIViewController{
    var items = [addStudent]()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        //self.getData()
        // Do any additional setup after loading the view.
    }
}
    
    
    extension ViewController:UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }
        
        func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell" , for: indexPath)
            let contact = items[indexPath.row]
            cell.textLabel?.text = contact.name
            //cell.textLabel?.text = items[indexPath.row]
            
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            tableView.beginUpdates()
          items.remove(at:indexPath.row)
            tableView.deleteRows(at: [indexPath], with:.fade)
            tableView.endUpdates()
        }
        
@IBAction func AddButton(_ sender: Any) {
        
        var textField = UITextField()
    var getName = textField.text!
            
            let alart = UIAlertController(title: "Enter The List", message: "", preferredStyle:.alert)
            
            let save = UIAlertAction(title:"save", style:.default){(save)in
                let user1 = addStudent()
                var addItem = textField.text!
                user1.add(name:addItem)
                self.items.append(user1)
                
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Entity")
                request.returnsObjectsAsFaults = false
                
                do{
                    let result = try context.fetch(request)
                    for data in result as! [NSManagedObject]{
                    //data to be stored in  core data
                     ///   user1. = data.value(forKey:"number")as! String
                       
                        
                        
                    }
                }catch{
                    print("Failed")
                }
                
                self.tableview.reloadData()
               
            }
            
            
            alart.addTextField{(text)in
                textField = text
                textField.placeholder = "Add Todo List"
            }
            alart.addAction(save)
            
            
            
            present(alart,animated: true,completion: nil)
    
            
            
        }
        
        
        func getData(){
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Entity")
            request.returnsObjectsAsFaults = false
            
            do{
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject]{
                   // items = data.value(forKey:"number")as! [String]
                }
            }catch{
                print("Failed")
            }
            
            
        }
        
    }




