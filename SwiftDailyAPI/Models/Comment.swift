//
//  Comment.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 1/06/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo

public struct Comments {
  public let comments: [Comment]
}

extension Comments: Decodable {
  private static func create(comments: [Comment]) -> Comments {
    return Comments(comments: comments)
  }

  public static func decode(j: JSON) -> Decoded<Comments> {
    return Comments.create
      <^> j <|| "comments"
  }
}

public struct Comment {
  public let commentId: Int
  public let authorName: String
  public let content: String
  public let likes: Int
  public let repliedAt: NSDate
  public let avatarURL: NSURL
  public let replyToComment: ReplyToComment?
}

extension Comment: Decodable {
  private static func create(commentId: Int)(authorName: String)(content: String)(likes: Int)(repliedAt: NSDate)(avatarURL: NSURL)(replyToComment: ReplyToComment?) -> Comment {
    return Comment(commentId: commentId, authorName: authorName, content: content, likes: likes, repliedAt: repliedAt, avatarURL: avatarURL, replyToComment: replyToComment)
  }

  public static func decode(j: JSON) -> Decoded<Comment> {
    return Comment.create
      <^> j <| "id"
      <*> j <| "author"
      <*> j <| "content"
      <*> j <| "likes"
      <*> ((j <| "time") >>- toNSDate)
      <*> j <| "avatar"
      <*> j <|? "reply_to"
  }
}

public struct ReplyToComment {
  public let authorName: String
  public let content: String
}

extension ReplyToComment: Decodable {
  private static func create(authorName: String)(content: String) -> ReplyToComment {
    return ReplyToComment(authorName: authorName, content: content)
  }

  public static func decode(j: JSON) -> Decoded<ReplyToComment> {
    return ReplyToComment.create
      <^> j <| "author"
      <*> j <| "content"
  }
}
