//
//  NetworkConfig.swift
//  flashpaySDK
//
//  Created by Ivan Krapivtsev on 08.02.2022.
//  Copyright © 2022 Flashpay. All rights reserved.
//

import UIKit

protocol NetworkConfig {
    var apiHost: String { get }
    var socketHost: String { get }
}
