//
//  MemberRepository.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 31/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

public class MemberRepository: MemberRepositoryProtocol {
    let apiService: ApiServiceProtocol
    
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    public func getMember() -> Observable<MemberModel> {
        return apiService.getMember().flatMap { any -> Observable<MemberModel> in
            let jsonDecoder = JSONDecoder()
            let member = try jsonDecoder.decode(MemberModel.self, from: any)
            return Observable.create { subscriber in
                subscriber.onNext(member)
                subscriber.onCompleted()
                return Disposables.create()
            }
        }
    }
    
    public func getAvatar(from url: String?) -> Observable<UIImage> {
        
//        return Observable.create
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
//            DispatchQueue.main.async() {
//                self.imageView.image = UIImage(data: data)
//            }
//        }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
