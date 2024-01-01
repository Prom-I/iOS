//
//  ToMeetToMeAPI.swift
//  ToMeetToMe
//
//  Created by 조유진 on 1/2/24.
//

import Moya
import Foundation

enum ToMeetToMeAPI {

    /// signIn:
    /// 응답 타입: BaseResponse<SignInResponse>
    case signIn(dto: SignInDto)

   
}

extension ToMeetToMeAPI: TargetType {
    var baseURL: URL { return URL(string: "http://13.125.18.63:8080")! }

    var path: String {
        switch self {
        case .signIn:
            return "/api/sign-in"
        
        }
    }

    var method: Moya.Method {
        switch self {
        case .signIn:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .signIn(dto):
            return .requestJSONEncodable(dto)
        }

    }
    
    var headers: [String: String]? {
        switch self {
        case .signIn:
            return ["Content-Type": "application/json"]
    
        default:
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessKey") ?? "")"
            ]
        }
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

// API 사용 예시
//Task {
//    let response = try await NetworkService.shared.request(.signIn(dto: .init(loginId: id, password: pw)), type: BaseResponse<SignInResponse>.self)
//    
//    guard let accessKey = response.result?.accessKey else {
//        return
//    }
//    
//    UserDefaults.standard.set(accessKey, forKey: "accessKey")
//    
//    await MainActor.run(body: {
//        self.dismiss(animated: true)
//    })
//}
