import UIKit

class ResultAllViewController: BaseController {
    override func setupViews() {
        super.setupViews()
        setupGreenButton("Начать сначала")
        title = "Результаты"
    }
    override func greenButtonHandler() {
        let controller = CategoryViewController()
        navigationController?.popToRootViewController(animated: true)
    }
}
