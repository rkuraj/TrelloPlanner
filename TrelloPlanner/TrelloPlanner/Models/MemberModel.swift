//
//  MemberModel.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 31/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation

public class MemberModel: Codable {
    var id: String?
    var avatarHash: String?
    var avatarUrl: String?
    var bio: String?
//    var bioData: Any?
    var confirmed: Bool?
    var email: String?
    var fullName: String?
    var gravatarHash: String?
    var idBoards: [String]?
    var idBoardsPinned: [String]?
    var idOrganizations: [String]?
    var idEnterprisesAdmin: [String]?
    var idPremOrgsAdmin: [String]?
    var initials: String?
    var loginTypes: [String]?
    var memberType: String?
    var oneTimeMessagesDismissed: [String]?
   // var prefs: Any?
    var products: [Int]?
    var uploadedAvatarUrl: String?
    var uploadedAvatarHash: String?
    var url: String?
    var username: String?
}
