import UIKit

class ResultAllViewController: BaseController {
    override func setupViews() {
        super.setupViews()
        setupGreenButton("Начать сначала")
        title = "Результаты"
    }
    override func greenButtonHandler() {
        navigationController?.popToRootViewController(animated: true)
    }
}
