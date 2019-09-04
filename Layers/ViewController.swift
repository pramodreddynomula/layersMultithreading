//
//  ViewController.swift
//  Layers

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBAction func downloadImage(_ sender: Any) {
        
        print("main thread starts here")
        activityIndicator.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            // Download file or perform expensive task
            print("Controll on the chainld thred/background")
            sleep(5)
            let imageURl = "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg"
            let url = URL(string: imageURl)
            let imageData = try? Data(contentsOf: url!)
            
            DispatchQueue.main.async {
                // Update the UI
                print("Controll Updating UI")
                self.imageView.image = UIImage(data: imageData!)
                self.activityIndicator.stopAnimating()
            }
        }
        print("Controll Comes here")

        
    }
    var myView:UIView!
    var myLayer:CALayer!
    
    @IBAction func hellClicked(_ sender: Any) {
        
        print("Hell Clicked");
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        /*
        
        myView = UIView(frame: CGRect(x: 50, y: 20, width: 100, height: 100))
        myView.backgroundColor = UIColor.red
        myView.layer.cornerRadius = 50;
        self.view.addSubview(myView)
 
        
        myLayer = CALayer();
        myLayer.frame = CGRect(x: 50, y: 150, width: 100, height: 100)
        myLayer.cornerRadius = 10;
        myLayer.borderWidth = 2;
        myLayer.borderColor = UIColor.blue.cgColor;
        myLayer.shadowOpacity = 0.7
        myLayer.shadowColor = UIColor.black.cgColor
        
        myLayer.backgroundColor = UIColor.yellow.cgColor
        
        self.view.layer.addSublayer(myLayer)
        
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedOnView(guesture:)))
        myView.addGestureRecognizer(tapGuesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.draggedView(_:)))
        myView.isUserInteractionEnabled = true
        myView.addGestureRecognizer(panGesture)
        */
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubview(toFront: myView)
        let translation = sender.translation(in: self.view)
        myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    @objc func tappedOnView(guesture:UITapGestureRecognizer)
    {
        print("tappedOnView")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

