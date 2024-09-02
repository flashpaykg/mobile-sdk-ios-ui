//
//  ECMPConfig.swift
//  flashpaySDK
//
//  Created by Виталий Морозов on 09.09.2021.
//  Copyright © 2021 Flashpay. All rights reserved.
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
