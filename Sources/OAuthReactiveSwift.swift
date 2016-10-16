//
//  OAuthReactiveSwift.swift
//  OAuthReactiveSwift
//
//  Created by phimage on 15/10/16.
//  Copyright © 2016 phimage. All rights reserved.
//

import Foundation
import OAuthSwift
import ReactiveSwift

extension OAuthSwift {
    public typealias SignalSuccess = (credential: OAuthSwiftCredential, response: URLResponse?, parameters: Parameters) // see OAuthSwift.TokenSuccessHandler
    public typealias SignalError = OAuthSwiftError

    public struct SignalResult: OAuthSwiftRequestHandle {
        public var producer: SignalProducer<SignalSuccess, SignalError>? = nil
        
        fileprivate var handle: OAuthSwiftRequestHandle? = nil
        public func cancel() {
            handle?.cancel() // ??? observer.sendInterrupted()
        }
    }
}

extension OAuth1Swift {
    
    open func rac_authorize(withCallbackURL callbackURL: URL) -> SignalResult {
        var result = SignalResult()
        result.producer = SignalProducer<SignalSuccess, SignalError> { observer, disposable in
            
            result.handle = self.authorize(
                withCallbackURL: callbackURL,
                success: { credential, response, parameters in
                    observer.send(value: (credential, response, parameters))
                    observer.sendCompleted()
                },
                failure: { error in
                    observer.send(error: error)
                }
            )
            
        }
        return result
    }
    
    @nonobjc open func rac_authorize(withCallbackURL callbackURL: String) -> SignalResult {
        var result = SignalResult()
        result.producer = SignalProducer<SignalSuccess, SignalError> { observer, disposable in
            
            result.handle = self.authorize(
                withCallbackURL: callbackURL,
                success: { credential, response, parameters in
                    observer.send(value: (credential, response, parameters))
                    observer.sendCompleted()
                },
                failure: { error in
                    observer.send(error: error)
                }
            )
            
        }
        return result
    }
    
}


extension OAuth2Swift {
    
    
    open func rac_authorize(withCallbackURL callbackURL: URL, scope: String, state: String, parameters: Parameters = [:], headers: Headers? = nil) -> SignalResult {
        var result = SignalResult()
        result.producer = SignalProducer<SignalSuccess, SignalError> { observer, disposable in
            
            result.handle = self.authorize(
                withCallbackURL: callbackURL,
                scope: scope, state: state, parameters: parameters, headers: headers,
                success: { credential, response, parameters in
                    observer.send(value: (credential, response, parameters))
                    observer.sendCompleted()
                },
                failure: { error in
                    observer.send(error: error)
                }
            )
            
        }
        return result
    }
    
    @nonobjc open func rac_authorize(withCallbackURL urlString: String, scope: String, state: String, parameters: Parameters = [:], headers: Headers? = nil) -> SignalResult {
        var result = SignalResult()
        result.producer = SignalProducer<SignalSuccess, SignalError> { observer, disposable in
            
            result.handle = self.authorize(
                withCallbackURL: urlString,
                scope: scope, state: state, parameters: parameters, headers: headers,
                success: { credential, response, parameters in
                    observer.send(value: (credential, response, parameters))
                    observer.sendCompleted()
                },
                failure: { error in
                    observer.send(error: error)
                }
            )
            
        }
        return result
    }
    
}
