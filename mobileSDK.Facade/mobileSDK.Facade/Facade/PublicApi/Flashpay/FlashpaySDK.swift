//
//  FlashpaySDK.swift
//  flashpaySDK
//
//  Created by Ivan Krapivtsev on 25.01.2022.
//  Copyright © 2022 Flashpay. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

public typealias PaymentCompletion = (_ result: PaymentResult) -> Void

public class FlashpaySDK: NSObject {
    /// The key is used to get error-code from UserInfo of NSError instance returned while mobile SDK session initialisation
    @objc public static let kSDKInitErrorCodeKey = "SDKInitErrorCode"
    /// Version of currently installed Flashpay SDK
    @objc public static let buildNumber: String = SDKInteractor.getBuildNumberOfBundle(for: FlashpaySDK.self)
    @objc public static let sdkVersion: String = SDKInteractor.getBundleVersion(for: FlashpaySDK.self)
    @objc public static let coreVerion: String = SDKInteractor.getCoreVersion()

    /// Debug initializer, should not be present in release version!
    ///
    /// - Parameters:
    ///   - url_api: API url to send requests to
    ///   - url_socket: Socket url to listen for callbacks
    @objc(initWithApi:socket:)
    public init(apiUrlString: String, socketUrlString: String) {
        interactor = SDKInteractor(apiUrlString: apiUrlString, socketUrlString: socketUrlString)
    }

    private let interactor: SDKInteractor

    @objc(init) public override init() {
        interactor = SDKInteractor()
    }

    /// Presents UI to begin payment flow
    ///
    /// - Parameters:
    ///   - viewController: controller from what you would like to present payment UI
    ///   - paymentOptions: info that is needed to perform payment (merchant_id, proeject_id, etc)
    ///   - completion: result of payment flow
    @objc(presentPaymentAt:paymentOptions:completionHandler:)
    public func presentPayment(at viewController: UIViewController,
                               paymentOptions: PaymentOptions,
                               completion: ((_ result: PaymentResult) -> Void)?) {
        interactor.presentPayment(at: viewController,
                                  paymentOptions: paymentOptions) { result in
            completion?(result)
        }

    }

    /// Create pament page UI to begin payment flow
    ///
    /// - Parameters:
    ///   - rootView: view to present payment on
    ///   - paymentOptions: info that is needed to perform payment (merchant_id, proeject_id, etc)
    ///   - completion: result of payment flow
    public func getPaymentView(with paymentOptions: PaymentOptions,
                               completion: ((_ result: PaymentResult) -> Void)?) -> some View {
        typealias OnViewDidAppear = (_ controlledBy: UIViewController) -> Void
        
        final class WrapperViewController: UIViewController {
            var onViewDidAppear: OnViewDidAppear = { _ in }

            init(onViewDidAppear: @escaping OnViewDidAppear) {
                self.onViewDidAppear = onViewDidAppear
                super.init(nibName: nil, bundle: nil)
            }

            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
            
            override func viewDidAppear(_ animated: Bool) {
                super.viewDidAppear(animated)
                onViewDidAppear(self)
            }
        }
        
        struct WrapperController: UIViewControllerRepresentable {
            var onViewDidAppear: OnViewDidAppear = { _ in }
            
            typealias UIViewControllerType = WrapperViewController

            func makeUIViewController(context: Context) -> WrapperViewController {
                return WrapperViewController(onViewDidAppear: onViewDidAppear)
            }

            func updateUIViewController(_ uiViewController: WrapperViewController, context: Context) {}
        }

        let wrapper = WrapperController { [weak self] vc in
            self?.presentPayment(at: vc, paymentOptions: paymentOptions, completion: completion)
        }
        return wrapper
    }
}
