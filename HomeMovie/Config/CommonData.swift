//
//  CommonData.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/10/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation


struct CommonData {
    static let kDefaultNumber: Int = 0
    static let kDefaultBannerTag = "moi-cap-nhat"
}

struct TitleMenu {
    static let FeaturesTitleMenu : Array =
    [
    "Mới cập nhật",
    "Hot trong tháng",
    "HDViệt đề cử",
    "Hành động",
    "Kinh dị",
    "Hài",
    "Chiến tranh",
    "Khoa học viễn tưởng",
    "Hình sự tội phạm",
    "Võ thuật",
    "Tình cảm",
    "Hoạt hình",
    "Anime",
    "Âm nhạc",
    "Thể thao",
    "Tâm lý",
    "Âu mỹ",
    "Gia đình",
    "Châu á",
    "Hồng kông",
    "Hàn quốc",
    "Lịch sử",
    "Tài liệu",
    "Phim chiếu rạp",
    "Phim bí ẩn",
    "Phim cổ trang",
    "Phim lãng mạn",
    "Phim trinh thám",
    "Phim viễn tây",
    "Sắp chiếu",
    "Thần thoại"]
    
    static let FeaturesTagMenu : Array =
    [
    "moi-cap-nhat",
    "hot-trong-thang",
    "hdviet-de-cu",
    "hanh-dong",
    "kinh-di",
    "hai",
    "chien-tranh",
    "khoa-hoc-vien-tuong",
    "hinh-su-toi-pham",
    "vo-thuat",
    "tinh-cam",
    "hoat-hinh",
    "anime",
    "am-nhac",
    "the-thao",
    "tam-ly",
    "au-my",
    "gia-dinh",
    "chau-a",
    "hong-kong",
    "han-quoc",
    "lich-su",
    "tai-lieu",
    "chieu-rap",
    "bi-an",
    "co-trang",
    "lang-man",
    "trinh-tham",
    "vien-tay",
    "sap-chieu",
    "than-thoai"]
}


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

enum TypeMovie {
    case Hot
    case Feature
    case Television
}
