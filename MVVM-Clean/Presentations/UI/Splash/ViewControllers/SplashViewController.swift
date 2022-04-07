//
//  SplashViewController.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit
import Combine
import Swinject

class SplashViewController: UIViewController {
    
    @IBOutlet var welcomeMessage: UILabel!
    
    var subscriptions: Set<AnyCancellable> = .init()
    var splashViewModel: SplashScreenViewModelDelegate?
    var router: SplashRouterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        localizeUI()
        
        guard let viewModel = Assembler.sharedAssembler.resolver.resolve(SplashScreenViewModelDelegate.self) else {
            fatalError("Assembler was unable to resolve SplashScreenViewModel")
        }
        
        splashViewModel = viewModel
        router = SplashRouter()
        
        bind()
        
        // Add 0.5 second in case we would like to show some graphic content for few seconds.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.splashViewModel?.checkUserState()
        }
    }
    
    /// Prepare all label with current localization.
    private func localizeUI() {
        let localizedWelcomeLabel = NSLocalizedString("splash_message", comment: "")
        welcomeMessage.text = localizedWelcomeLabel
    }
    
    /// <#Description#>
    private func bind() {
        if let viewModel = splashViewModel {
            viewModel.status.sink { state in
                switch viewModel.status.value {
                case .none:
                    print("Nothing to do")
                case .loggedIn:
                    print("Goes to home view")
                    self.goestToHomeViewController()
                case .notLoggedIn:
                    print("Goes to login view")
                    self.goestToLoginViewController()
                }
            }.store(in: &subscriptions)
        }
    }
    
    
    /// Get HomeViewCotroller and set as main window
    private func goestToHomeViewController() {
//        if let mainViewController = Assembler.sharedAssembler.resolver.resolve(SummaryViewController.self) {
//            let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
//            nvc.setNavigationBarHidden(false, animated: false)
//            UIApplication.shared.keyWindow?.rootViewController = nvc
//        }
        router?.navigateToHomeView()
    }
    
    /// Get LoginViewController and set as main window
    private func goestToLoginViewController() {
//        if let loginViewController = Assembler.sharedAssembler.resolver.resolve(LoginViewController.self) {
//            let nvc: UINavigationController = UINavigationController(rootViewController: loginViewController)
//            nvc.setNavigationBarHidden(false, animated: false)
//            UIApplication.shared.keyWindow?.rootViewController = nvc
//        }
        router?.navigateToLoginView()
    }
    
}
