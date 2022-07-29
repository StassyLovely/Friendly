import Foundation
import UIKit

class SearchViewController: UIViewController {

    let maintableView = UITableView()
    let searchUIBar = UISearchBar()
        
    var isSearch : Bool = false
    var tableData = ["Afghanistan", "Algeria", "Bahrain","Brazil", "Cuba", "Denmark","Denmark", "Georgia", "Hong Kong", "Iceland", "India", "Japan", "Kuwait", "Nepal"];
    var filteredTableData:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maintableView.dataSource = self
        maintableView.delegate = self
        searchUIBar.delegate = self
        maintableView.reloadData()

    }
}

extension SearchViewController: UISearchBarDelegate{
    //MARK: UISearchbar delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
           isSearch = true
    }
       
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
           searchBar.resignFirstResponder()
           isSearch = false
    }
       
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searchBar.resignFirstResponder()
           isSearch = false
    }
       
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           searchBar.resignFirstResponder()
           isSearch = false
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            isSearch = false
            self.maintableView.reloadData()
        } else {
            filteredTableData = tableData.filter({ (text) -> Bool in
                let tmp: NSString = text as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            if(filteredTableData.count == 0){
                isSearch = false
            } else {
                isSearch = true
            }
            self.maintableView.reloadData()
        }
    }

}

extension SearchViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = maintableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if (isSearch) {
            cell.textLabel?.text = filteredTableData[indexPath.row]
            return cell
        }
        else {
            cell.textLabel?.text = tableData[indexPath.row]
            print(tableData[indexPath.row])
            return cell
        }
    }

    }

    extension SearchViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if(isSearch) {
             return filteredTableData.count
         }else{
            return tableData.count
        }
         
    }
}
