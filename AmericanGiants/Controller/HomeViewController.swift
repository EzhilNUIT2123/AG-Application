//
//  HomeViewController.swift
//  AmericanGiants
//
//  Created by Ezhilarasi on 05/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitle = ["Kid's","Women's","Men's"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
 
    var apiResult = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
       
        homeFeedTable.dataSource = self
        homeFeedTable.showsVerticalScrollIndicator = false
        homeFeedTable.delegate = self
        configurationHeader()
        
        //we can also create an object for HeaderView and use it here
        homeFeedTable.tableHeaderView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        toGetKidsWear()
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        homeFeedTable.frame = view.bounds
    }
    
    //UIImage(named: "google")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal).resizeTo(size: CGSize(width: 25, height: 25))
    
    private func toGetKidsWear(){
        GetProducts.sharedInstance.kidsWear { result in
            switch result{
            case .success(let dress):
                print(dress)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    private func configurationHeader(){
        
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: (self.navigationController?.navigationBar.frame.width)!, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Search Here ..."
        textField.backgroundColor = .gray
        self.navigationItem.titleView = textField
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: nil)
        //navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(systemName:"apple.logo"), style: .done, target: self, action: nil)
    }

}

//MARK: - TableViewDelegate , TableViewDataSource

extension HomeViewController : UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.textColor = .white
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.font = .systemFont(ofSize: 18,weight: .semibold)
        header.textLabel?.text = header.textLabel?.text?.uppercased()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{ return UITableViewCell() }
        //cell.imageView?.image = UIImage(named: String(apiResult[indexPath.row].image))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    

}
