//
//  Payment.swift
//  flashpaySDK
//
//  Created by Ivan Krapivtsev on 28.01.2022.
//  Copyright © 2022 Flashpay. All rights reserved.
//

import Foundation
#if !DEVELOPMENT
@_implementationOnly import MsdkCore
#else
import MsdkCore
#endif

@objcMembers public class Payment: NSObject, Codable {
    public var status: String?
    public var type: String?
    public var id: String?
    public var date: String?
    public var method: String?
    public var sum: Int64
    public var currency: String?
    public var token: String?

    internal init(from corePayment: MsdkCore.Payment) {
        status = corePayment.status.map { $0.name }
        type = corePayment.type
        id = corePayment.id
        date = corePayment.date
        method = corePayment.method
        sum = corePayment.sum
        currency = corePayment.currency
        token = corePayment.token
        super.init()
    }
}
