import UIKit

class DetailViewController: UIViewController {
    
    var selection: String!
    
    @IBOutlet weak var detailLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = selection

    }
    
    @IBAction func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
