//
//  Status.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import Foundation

enum Status: Int {
    case success = 200
    case multipleChoices = 300
    case badRequest = 400
    case forbidden = 403
    case notFound = 404
    case requestTimeout = 408
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailabe = 503
    case gatewayTimeout = 504

    case authErrorCodeInvalidCustomToken = 17000


    case authErrorCodeInvalidCredential = 17004


    case authErrorCodeUserDisabled = 17005

    case authErrorCodeOperationNotAllowed = 17006

    case authErrorCodeEmailAlreadyInUse = 17007


    case authErrorCodeInvalidEmail = 17008

    case authErrorCodeWrongPassword = 17009

    case authErrorCodeTooManyRequests = 17010

    case authErrorCodeUserNotFound = 17011

    case authErrorCodeAccountExistsWithDifferentCredential = 17012

    case authErrorCodeRequiresRecentLogin = 17014

    case authErrorCodeProviderAlreadyLinked = 17015


    case authErrorCodeInvalidUserToken = 17017

    case authErrorCodeNetworkError = 17020

    case authErrorCodeUserTokenExpired = 17021

    case authErrorCodeInvalidAPIKey = 17023

    case authErrorCodeUserMismatch = 17024

    case authErrorCodeCredentialAlreadyInUse = 17025

    case authErrorCodeWeakPassword = 17026

    case authErrorCodeAppNotAuthorized = 17028

    case authErrorCodeExpiredActionCode = 17029

    case authErrorCodeInvalidActionCode = 17030


    case authErrorCodeMissingEmail = 17034

    case authErrorCodeMissingIosBundleID = 17036


    case authErrorCodeUnauthorizedDomain = 17038

    case authErrorCodeInvalidContinueURI = 17039

    case authErrorCodeMissingContinueURI = 17040


    case authErrorCodeMissingVerificationCode = 17043

    case authErrorCodeInvalidVerificationCode = 17044

    case authErrorCodeMissingVerificationID = 17045


    case authErrorCodeInvalidVerificationID = 17046

    case authErrorCodeMissingAppCredential = 17047

    case authErrorCodeInvalidAppCredential = 17048

    case authErrorCodeSessionExpired = 17051

    case authErrorCodeQuotaExceeded = 17052

    case authErrorCodeMissingAppToken = 17053


    case authErrorCodeAppVerificationUserInteractionFailure = 17059

    case authErrorCodeInvalidClientID = 17060


    case authErrorCodeEmailChangeNeedsVerification = 17090


    case authErrorCodeMissingClientIdentifier = 17993

    case authErrorCodeKeychainError = 17995

    case authErrorCodeInternalError = 17999

    case authErrorCodeMalformedJWT = 18000
}
