import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    
    let interestsLabel = UILabel()
    let secondInterestsLabel = UILabel()
    
    let scrollView = UIScrollView()
    let secScrollView = UIScrollView()
    let numberOfPages: Int = 5
    let padding: CGFloat = 15
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSearchBar()
        setUpScrollView()
        setUpInterestsLabel()
        setUpSecondInterestsLabel()
        setUpSecondScrollView()
    }
    
    func setUpSearchBar() {
        title = "Home"
        view.backgroundColor = .white
        searchBar.frame = CGRect(x: 10, y: 60, width: 300, height: 20)
        searchBar.backgroundColor = .white
        searchBar.searchBarStyle = .minimal
        searchBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        searchBar.searchTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 5)
        searchBar.placeholder = " Search..."
        searchBar.isTranslucent = false
        searchBar.delegate = self
        view.addSubview(searchBar)
    }
    
    func setUpScrollView() {
        view.addSubview(scrollView)
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .white
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.frame = CGRect(x: 0, y: 120, width: view.frame.width, height: 200)
        
        let viewWidth = 200 - 2 * padding
        let viewHeight = 200 - 2 * padding
        
        var x : CGFloat = 0
        for i in 0...numberOfPages {
            let view: UIView = UIView(frame: CGRect(x: x + padding, y: padding, width: viewWidth, height: viewHeight))
            view.backgroundColor = UIColor(red: 88/255.0, green: 169/255.0, blue: 245/255.0, alpha: 0.5)
            scrollView .addSubview(view)
            x = view.frame.origin.x + viewWidth + padding
        }
        scrollView.contentSize = CGSize(width: x+padding, height:scrollView.frame.size.height)
    }
    
    func setUpInterestsLabel() {
        view.addSubview(interestsLabel)
        interestsLabel.backgroundColor = .white
        interestsLabel.text = "Cinema"
        interestsLabel.textAlignment = .left
        interestsLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        interestsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            interestsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            interestsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            interestsLabel.widthAnchor.constraint(equalToConstant: 200),
            interestsLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setUpSecondInterestsLabel() {
        view.addSubview(secondInterestsLabel)
       secondInterestsLabel.backgroundColor = .white
       secondInterestsLabel.text = "Biology"
       secondInterestsLabel.textAlignment = .left
       secondInterestsLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
       secondInterestsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           secondInterestsLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
           secondInterestsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           secondInterestsLabel.widthAnchor.constraint(equalToConstant: 200),
           secondInterestsLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func setUpSecondScrollView() {
        view.addSubview(secScrollView)
        secScrollView.isPagingEnabled = true
        secScrollView.backgroundColor = .white
        secScrollView.showsHorizontalScrollIndicator = false
        secScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        
        let viewWidth = 200 - 2 * padding
        let viewHeight = 200 - 2 * padding
        
        var x : CGFloat = 0
        for i in 0...numberOfPages {
            let view: UIView = UIView(frame: CGRect(x: x + padding, y: padding, width: viewWidth, height: viewHeight))
            view.backgroundColor = UIColor(red: 88/255.0, green: 169/255.0, blue: 245/255.0, alpha: 0.5)
            secScrollView .addSubview(view)
            x = view.frame.origin.x + viewWidth + padding
        }
        secScrollView.contentSize = CGSize(width: x+padding, height:secScrollView.frame.size.height)
    }
}




//import UIKit
//
//class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
//
//    let searchBar = UISearchBar()
//
//    let scrollView = UIScrollView()
//    let tableView = UITableView()
//    let pageControl = UIPageControl()
//    var images: [String] = ["image1","image2","image3"]
//    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setUpSearchBar()
//        setUpScroll()
//
//    }
//
//    func setUpSearchBar() {
//        title = "Home"
//        view.backgroundColor = .white
//        let searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 20, y: 50, width: 280, height: 10))
//        searchBar.searchBarStyle = UISearchBar.Style.prominent
//        searchBar.placeholder = " Search..."
//        searchBar.sizeToFit()
//        searchBar.isTranslucent = false
//        searchBar.backgroundImage = UIImage()
//        searchBar.delegate = self
//        view.addSubview(searchBar)
//    }
//
//    func setUpScroll() {
//        scrollView.showsHorizontalScrollIndicator = false
//                scrollView.isPagingEnabled = true
//        scrollView.backgroundColor = .gray
//
//                for index in 0..<images.count {
//                    frame.origin.x = scrollView.frame.size.width * CGFloat(index)
//                    frame.size = scrollView.frame.size
//
//                    let imageView = UIImageView(frame: frame)
//                    imageView.image = UIImage(named: images[index])
//                    self.scrollView.addSubview(imageView)
//                }
//                scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(images.count), height: scrollView.frame.size.height)
//                scrollView.delegate = self
//                tableView.dataSource = self
//                tableView.delegate = self
//            }
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        var page = scrollView.contentOffset.x/scrollView.frame.size.width
//            pageControl.currentPage = Int(page)
//        }
//}
//
//
//
//
















//retu



//import UIKit
//
//class HomeViewController: UIViewController {
//
//    let maintableView = UITableView()
//    let searchUIBar = UISearchBar()
//
//    let searchBar: UISearchBar = UISearchBar()
//
//    var isSearch : Bool = false
//    var tableData = ["Afghanistan", "Algeria", "Bahrain","Brazil", "Cuba", "Denmark","Denmark", "Georgia", "Hong Kong", "Iceland", "India", "Japan", "Kuwait", "Nepal"];
//    var filteredTableData:[String] = []
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 10, y: 10, width: 150, height: 20))
//        searchBar.searchBarStyle = UISearchBar.Style.prominent
//        searchBar.placeholder = " Search..."
//        searchBar.sizeToFit()
//        searchBar.isTranslucent = false
//        searchBar.backgroundImage = UIImage()
//        searchBar.delegate = self
//        view.addSubview(searchBar)
//
//        title = "Home"
//        view.backgroundColor = .white
//
//
//        view.addSubview(maintableView)
//        view.addSubview(searchUIBar)
//
//
//        maintableView.dataSource = self
//        maintableView.delegate = self
//        searchUIBar.delegate = self
//        maintableView.reloadData()
//
//
//    }
//}
//
//extension HomeViewController: UISearchBarDelegate{
//    //MARK: UISearchbar delegate
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//           isSearch = true
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//           searchBar.resignFirstResponder()
//           isSearch = false
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//           searchBar.resignFirstResponder()
//           isSearch = false
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//           searchBar.resignFirstResponder()
//           isSearch = false
//    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText.count == 0 {
//            isSearch = false
//            self.maintableView.reloadData()
//        } else {
//            filteredTableData = tableData.filter({ (text) -> Bool in
//                let tmp: NSString = text as NSString
//                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
//                return range.location != NSNotFound
//            })
//            if(filteredTableData.count == 0){
//                isSearch = false
//            } else {
//                isSearch = true
//            }
//            self.maintableView.reloadData()
//        }
//    }
//
//}
//
//extension HomeViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = maintableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        if (isSearch) {
//            cell.textLabel?.text = filteredTableData[indexPath.row]
//            return cell
//        }
//        else {
//            cell.textLabel?.text = tableData[indexPath.row]
//            print(tableData[indexPath.row])
//            return cell
//        }
//    }
//
//    }
//
//    extension HomeViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         if(isSearch) {
//             return filteredTableData.count
//         }else{
//            return tableData.count
//        }
//
//    }
//}

