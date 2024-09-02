//
//  ECMPConfigDev.swift
//  flashpaySDK
//
//  Created by Ivan Krapivtsev on 08.02.2022.
//  Copyright © 2022 Flashpay. All rights reserved.
//

import Foundation

typealias NetworkConfigType = ECMPConfig

struct ECMPConfig: NetworkConfig {
    var apiHost: String {
        "sdk.flashpay.kg"
    }

    var socketHost: String {
        "paymentpage.flashpay.kg"
    }
}
