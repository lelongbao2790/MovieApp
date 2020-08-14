//
//  CommonData.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/10/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation

struct Tag {
    static let Features : Dictionary =
                        ["Mới cập nhật":"moi-cap-nhat", // show on banner
                        "Hot trong tháng":"hot-trong-thang",
                        "HDViệt đề cử":"hdviet-de-cu",
                        "Hành động":"hanh-dong",
                        "Kinh dị":"kinh-di",
                        "Hài":"hai",
                        "Chiến tranh":"chien-tranh",
                        "Khoa học viễn tưởng":"khoa-hoc-vien-tuong",
                        "Hình sự tội phạm":"hinh-su-toi-pham",
                        "Võ thuật":"vo-thuat",
                        "Tình cảm":"tinh-cam",
                        "Hoạt hình":"hoat-hinh",
                        "Anime":"anime",
                        "Hoạt hình":"hoat-hinh",
                        "Âm nhạc":"am-nhac",
                        "Thể thao":"the-thao",
                        "Tâm lý":"tam-ly",
                        "Âu mỹ":"au-my",
                        "Gia đình":"gia-dinh",
                        "Châu á":"chau-a",
                        "Hồng kông":"hong-kong",
                        "Hàn quốc":"han-quoc",
                        "Lịch sử":"lich-su",
                        "Tài liệu":"tai-lieu",
                        "Phim chiếu rạp":"chieu-rap",
                        "Phim bí ẩn":"bi-an",
                        "Phim cổ trang":"co-trang",
                        "Phim lãng mạn":"lang-man",
                        "Phim trinh thám":"trinh-tham",
                        "Phim viễn tây":"vien-tay",
                        "Phim chiếu rạp":"chieu-rap",
                        "Sắp chiếu":"sap-chieu",
                        "Thần thoại":"than-thoai"]
        
    
    static let TelevisionSeries : Dictionary =
                        ["Mới cập nhật":"moi-cap-nhat", // show on banner
                        "Hot trong tháng":"hot-trong-thang",
                        "HDViệt đề cử":"hdviet-de-cu",
                        "Hành động":"hanh-dong",
                        "Kinh dị":"kinh-di",
                        "Hài":"hai",
                        "Chiến tranh":"chien-tranh",
                        "Khoa học viễn tưởng":"khoa-hoc-vien-tuong",
                        "Hình sự tội phạm":"hinh-su-toi-pham",
                        "Võ thuật":"vo-thuat",
                        "Tình cảm":"tinh-cam",
                        "Hoạt hình":"hoat-hinh",
                        "Anime":"anime",
                        "Hoạt hình":"hoat-hinh",
                        "Âm nhạc":"am-nhac",
                        "Thể thao":"the-thao",
                        "Tâm lý":"tam-ly",
                        "Âu mỹ":"au-my",
                        "Gia đình":"gia-dinh",
                        "Châu á":"chau-a",
                        "Hồng kông":"hong-kong",
                        "Hàn quốc":"han-quoc",
                        "Lịch sử":"lich-su",
                        "Tài liệu":"tai-lieu",
                        "Phim bí ẩn":"bi-an",
                        "Phim cổ trang":"co-trang",
                        "Phim lãng mạn":"lang-man",
                        "Phim trinh thám":"trinh-tham",
                        "Phim viễn tây":"vien-tay",
                        "Thần thoại":"than-thoai"]
    
}

enum Genre : Int {
    case Hot = 0
    case Feature = 1
    case Television = 2
}
