//
//  PostsMock.swift
//  JSReddit
//
//  Created by Juan sebastian Sanzone on 9/27/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

final class PostMock1: NSObject, PostViewModelProtocol {
    func isReaded() -> Bool {
        return false
    }

    func authorUserName() -> String {
        return "BobLazar"
    }

    func timeAgo() -> String {
        return "9 hours ago"
    }

    func imageUrl() -> String {
        return  "https://4.bp.blogspot.com/-5w8_-Z6YclM/WnTT9fy9b5I/AAAAAAAB9DU/sYt_XaTTMPs3wTV_tYTtmrad58vjbS1LQCLcBGAs/s400/boblazaromnisquare_0.jpg"
    }

    func postText() -> String {
        return "Simple text mock, short."
    }

    func commentsCount() -> Int {
        return 1400
    }
}

final class PostMock2: NSObject, PostViewModelProtocol {
    func isReaded() -> Bool {
        return true
    }

    func authorUserName() -> String {
        return "AliensMan"
    }

    func timeAgo() -> String {
        return "14 hours ago"
    }

    func imageUrl() -> String {
        return  "http://wrmx00.epimg.net/radio/imagenes/2018/11/22/sociedad/1542909883_657964_1542910423_noticia_normal.jpg"
    }

    func postText() -> String {
        return "If we find lots of planets like ours…we’ll know it’s likely that we aren’t alone, and that someday we might be able to join other intelligent life in the universe."
    }

    func commentsCount() -> Int {
        return 856
    }
}

final class PostMock3: NSObject, PostViewModelProtocol {
    func isReaded() -> Bool {
        return false
    }

    func authorUserName() -> String {
        return "NasaNews"
    }

    func timeAgo() -> String {
        return "22 hours ago"
    }

    func imageUrl() -> String {
        return  "https://cdn.mos.cms.futurecdn.net/m995fNhcasE9ZL2Nuc6F8Q-1024-80.jpg"
    }

    func postText() -> String {
        return "The organization is composed of four mission directorates: Aeronautics Research, for the development of advanced aviation technologies; Science, dealing with programs for understanding the origin, structure, and evolution of the universe, the solar system, and Earth; Space Technology, for the development of space science and exploration technologies; and Human Exploration and Operations, concerning the management of manned space missions, including those to the International Space Station, as well as operations related to launch services, space transportation, and space communications for both manned and robotic exploration programs. A number of additional research centres are affiliated, including the Goddard Space Flight Center in Greenbelt, Maryland; the Jet Propulsion Laboratory in Pasadena, California; the Johnson Space Center in Houston, Texas; and the Langley Research Center in Hampton, Virginia. Headquarters of NASA are in Washington, D.C."
    }

    func commentsCount() -> Int {
        return 30
    }
}
