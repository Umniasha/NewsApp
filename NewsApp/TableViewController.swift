//
//  TableViewController.swift
//  NewsApp
//
//  Created by Oleg Arnaut  on 09.11.2023.
//

import UIKit

class TableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
        }
    }

    
    @IBAction func refreshAction(_ sender: Any) {
        loadNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
           
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.publishedAt
        
       

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToOneViews", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        if segue.identifier == "goToOneViews" {
            (segue.destination as? ViewController)?.article = articles[tableView.indexPathForSelectedRow!.row]
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
        
    }


}
