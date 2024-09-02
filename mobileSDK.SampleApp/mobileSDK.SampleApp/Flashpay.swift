//
//  Flashpay.swift
//  SampleApp
//
//  Created by Ivan Krapivtsev on 22.08.2022.
//

import Foundation
import flashpaySDK_Dev

func getBrandName() -> String {
    return String(#file.split(separator: "/").last?.split(separator: ".").first ?? "")
}

func getSDKVersionString() -> String {
    return FlashpaySDK.sdkVersion + "(" + FlashpaySDK.buildNumber + ")"
}

func getCoreVersionString() -> String {
    return FlashpaySDK.coreVerion
}

#if NL3

    let defaultPaymentData = PaymentData(
        brandColor: nil,
        image: nil,
        projectId: 185541,
        paymentId: getUniquePaymentID(),
        paymentAmount: 11001,
        paymentCurrency: "USD",
        customerId: "12",
        paymentDescription: "Test payment",
        languageCode: "",
        forcePaymentMethod: .none,
        hideSavedWallets: false,
        hideSuccessFinalPage: false,
        hideDeclineFinalPage: false,
        secretKey: "123",
        apiHost: "pp-sdk.westresscode.net",
        wsApiHost: "paymentpage.westresscode.net",
        merchantId: "BCR2DN6TZ75OBLTH",
        merchantName: "Example Merchant",
        mockModeType: MockModeType.disabled,
        regionCode: ""
    )

#else

    let defaultPaymentData = PaymentData(
        brandColor: nil,
        image: nil,
        projectId: 0,
        paymentId: getUniquePaymentID(),
        paymentAmount: 123,
        paymentCurrency: "USD",
        customerId: "12",
        paymentDescription: "Test payment",
        languageCode: "",
        forcePaymentMethod: .none,
        hideSavedWallets: false,
        hideSuccessFinalPage: false,
        hideDeclineFinalPage: false,
        secretKey: "",
        apiHost: "sdk.flashpay.kg",
        wsApiHost: "paymentpage.flashpay.kg",
        merchantId: "BCR2DN6TZ75OBLTH",
        merchantName: "Example Merchant",
        mockModeType: MockModeType.disabled,
        regionCode: ""
    )

#endif
