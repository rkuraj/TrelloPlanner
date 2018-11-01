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
    
    public func getAvatar(from urlString: String?) -> Observable<UIImage> {
        var image: UIImage?
        let formattedUrl = urlString! + "/170.png"
        let url = URL.init(string: formattedUrl)
        
        return Observable.create { subscriber in
            self.getData(from: url!) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    subscriber.onError(error)
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                image = UIImage(data: data)
                
                subscriber.onNext(image!)
                subscriber.onCompleted()
            }

            return Disposables.create()
        }


    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
