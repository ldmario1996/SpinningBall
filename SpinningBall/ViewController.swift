//
//  ViewController.swift
//  SpinningBall
//
//  Created by Thang Le on 6/28/16.
//  Copyright © 2016 Thang Le. All rights reserved.
//
//xoay qua bong, di chuyen qua bong
// cung tron ban kinh r, chan goc @ duoc tinh bang cong thuc @r
// y k doi, x doi, co @, co r => do dai cung tron
// tang goc quay len va di   
// truc ox oy, voi moi khoang thoi gian nhat dinh tang goc quay len, quay them 1 doan va di chuyen 1 doan + x
import UIKit

class ViewController: UIViewController {
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadius = CGFloat()
    var dir = "right"
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        let time = NSTimer.scheduledTimerWithTimeInterval(0.02, target:self , selector: Selector("rollBall"),userInfo: nil,repeats : true)
    
    }
    
    func addBall()
    {
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadius = 32.0
        
        ball.center = CGPointMake(ballRadius, mainViewSize.height * 0.5)
        self.view.addSubview(ball)
    }
    func rollBall(){
        let deltaAngle: CGFloat = 0.1
//        self.ball.center = CGPointMake(ball.center.x + ballRadius * deltaAngle, ball.center.y)
     
        
        
        if(dir == "left"){
            self.ball.center = CGPointMake(ball.center.x - ballRadius * deltaAngle, ball.center.y)
            radians = radians - deltaAngle
        }
        if(dir == "right"){
            self.ball.center = CGPointMake(ball.center.x + ballRadius * deltaAngle, ball.center.y)
            radians = radians + deltaAngle

        }
        if (self.ball.center.x >= self.view.bounds.size.width - ballRadius ) {
            dir = "left"
        }
        
        if(self.ball.center.x <= ballRadius){
            dir = "right"
        }
        self.ball.transform = CGAffineTransformMakeRotation(radians)

    }
}

      

    


