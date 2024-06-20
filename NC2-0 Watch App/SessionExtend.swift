//
//  SessionExtend.swift
//  NC2-0 Watch App
//
//  Created by 이진 on 6/19/24.
//

import SwiftUI

class SessionExtend: NSObject, ObservableObject, WKExtendedRuntimeSessionDelegate {
    static public let shared = SessionExtend()
    private var session = WKExtendedRuntimeSession()
    
    private func isRunningSession() -> Bool {
        return session.state == .running || session.state == .scheduled
    }
    
    func startSession() {
        if isRunningSession() {
            return
        }
        
        session = WKExtendedRuntimeSession()
        session.delegate = self
        session.start(at: Date())
    }
    
    func stopSession() {
        if isRunningSession() {
            session.invalidate()
        }
    }
    
    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
        // something to do..
    }
    
    func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        // something to do..
    }
    
    func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        // something to do..
    }
}
