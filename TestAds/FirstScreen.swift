//
//  ViewController.swift
//  TestAds
//
//  Created by Ali on 6/5/23.
//

import UIKit
import GoogleMobileAds
class FirstScreen: UIViewController, GADFullScreenContentDelegate {

    private var interstitial: GADInterstitialAd?
    private var rewardedAd: GADRewardedAd?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let request = GADRequest()
           GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910",
                                       request: request,
                             completionHandler: { [self] ad, error in
                               if let error = error {
                                 print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                 return
                               }
                               interstitial = ad
                             }
           )
        
        loadRewardedAd()
      
    }
    

    @IBAction func goToSecondScreen(){
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "SecondScreen") as? SecondScreen

        navigationController?.pushViewController(nextViewController!, animated: true)

    }
    @IBAction func showAd(){
        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
          } else {
            print("Ad wasn't ready")
          }
        

    }
    @IBAction func rewardAd(){
        if let ad = rewardedAd {
            ad.present(fromRootViewController: self) {
              let reward = ad.adReward
              print("Reward received with currency \(reward.amount), amount \(reward.amount.doubleValue)")
              // TODO: Reward the user.
            }
          } else {
            print("Ad wasn't ready")
          }

    }
    
    func loadRewardedAd() {
      let request = GADRequest()
      GADRewardedAd.load(withAdUnitID:"ca-app-pub-3940256099942544/1712485313",
                         request: request,
                         completionHandler: { [self] ad, error in
        if let error = error {
          print("Failed to load rewarded ad with error: \(error.localizedDescription)")
          return
        }
        rewardedAd = ad
        print("Rewarded ad loaded.")
      }
      )
    }
    
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
      print("Ad did fail to present full screen content.")
    }

    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad will present full screen content.")
    }

    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad did dismiss full screen content.")
    }
    
    
    

}

