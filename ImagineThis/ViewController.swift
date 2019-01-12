import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    @IBOutlet weak var categoryLabel: UILabel!
    
    var categories = ["urban", "horror", "news", "action", "fantasy", "scifi"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (view.frame.size.width - (2 * 40 + 20)) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let destinationViewController = segue.destination as? DetailViewController {
                //if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                if let indexPath = sender as? IndexPath {
                    destinationViewController.selection = categories[indexPath.row]
                }
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath)
        if let imageView = cell.viewWithTag(100) as? UIImageView {
            imageView.image = UIImage(named: "button_\(categories[indexPath.row])") 
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // using indexPath to have this
        performSegue(withIdentifier: "DetailSegue", sender: indexPath)
    }
}

/*
 
 func generateRandom() -> String {
 let adjective = adjectives.randomElement()
 let noun = nouns.randomElement()
 let verb = verbs.randomElement()
 let adverb = adverbs.randomElement()
 
 let sentanse = adjective! + " " + noun! + " " + verb! + " " + adverb!
 return sentanse
 }
 
var nouns: [String] = ["vase","hospital", "view", "bit", "airport", "brick", "squirrel", "flame", "toothpaste", "nose", "teeth", "apparel", "balance", "belief", "approval", "veil", "hand", "cat", "air", "robin", "wrench", "oven"]

var verbs: [String] = ["wishes","invites", "decays", "strokes", "forces", "balance", "closes", "arrests", "burns", "dislikes", "dances", "reduces", "reflects", "refuses", "suspends", "smokes", "produces", "prints", "bleaches", "scares"]

var adjectives: [String] = ["ruddy","nonstop", "fortunate", "steady", "unaccountable", "ashamed", "sticky", "phobic", "purring", "ablaze", "lying", "impartial", "damaging", "busy", "black", "alive", "fixed", "empty", "nasty", "tacky", "loose", "complete", "learned", "assorted"]

var adverbs: [String] = ["knowledgeably","violently", "fervently", "rarely", "enormously", "wildly", "thoughtfully", "mortally", "upside-down", "initially", "arrogantly", "softly", "slowly", "urgently", "nicely", "blissfully", "closely", "tensely", "viciously", "bashfully", "merely", "recently", "voluntarily", "oddly"]
*/
