//
//  ViewController.swift
//  LearnVIPER
//
//  Created by zein rezky chandra on 09/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catalogueTable: UITableView!
    
    var presenter: ViewControllerPresenterProtocol?
    var catalogueModel: ViewControllerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        presenter?.viewDidLoad()
    }

    private func registerCell() {
        catalogueTable.register(UINib(nibName: "CatalogueCell", bundle: nil), forCellReuseIdentifier: "catalogueCellID")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalogueModel?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        66
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "catalogueCellID", for: indexPath) as? CatalogueCell)!
        cell.object = catalogueModel?.data[indexPath.row]
        return cell
    }
}

extension ViewController: ViewControllerViewProtocol {
    func didSuccessfullyRequestCatalogue(model: ViewControllerModel) {
        catalogueModel = model
        DispatchQueue.main.async {
            self.catalogueTable.reloadData()
        }
    }
    
    func showLoading() {
        self.showActivityIndicator(true, isFullScreen: true, isCenter: true)
    }
    
    func hideLoading() {
        self.showActivityIndicator(false, isFullScreen: true, isCenter: true)
    }
    
    func showError(message: String) {
        self.showToast(message: message)
    }
}
