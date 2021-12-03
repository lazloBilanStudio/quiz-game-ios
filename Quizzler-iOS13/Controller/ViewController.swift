import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func onButtonPress(_ sender: UIButton) {
        let userResult = sender.currentTitle!
        let userAnswerIsCorrect = quizBrain.checkAnswer(answer: userResult)
        
        if userAnswerIsCorrect {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.systemRed
        }
        
        quizBrain.nextItem()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI () {
        questionLabel.text = quizBrain.getText()
        progressBar.progress = quizBrain.getProgress()
        falseButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
    }
}

