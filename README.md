Welcome to Alfa News!
===================

Alfa News provide a simplified experience for news reader with its beautiful and user friendly UI. You select which category of news you interested in, and Alfa News will show you the most reliable sources according to the category. If you find a source you like, you will get directed to top articles and read the article.

iOS App Store: https://itunes.apple.com/us/app/alfa-news/id1187632337?ls=1&mt=8

----------

## Table of Contents
  * [App Design](#app-design)
    * [Objective](#objective)
    * [Audience](#audience)
    * [Experience](#experience)
  * [Technical](#technical)
    * [Screens](#Screens)
    * [External services](#external-services)
    * [Views, View Controllers, and other Classes](#Views-View-Controllers-and-other-Classes)

---
### App Design

#### Objective
Enable the user to read news with different categories from the most reliable sources, give them a better experience of reading news with the user friendly UI in Alfa News.

#### Audience
News reader

#### Experience
When the user first time load the app, they will be get directed into the home view for them to pick the category of news they want to read. Once they've picked the category, they will be asked to choose the news source they want to read depending which category they've picked. Finally, Alfa News will displayed them with our most top articles during that specific time.

[Back to top ^](#)

---

### Technical

#### Screens
* ViewController & CategoryCollectionViewCell -> HOME
* SourceViewController & SourceViewCell -> Sources
* ArticlesViewController & ArticlesViewCell -> Articles
* DisplayViewController -> WebView

#### External services
* News API -> https://newsapi.org
* Alamofire -> https://github.com/Alamofire/Alamofire

#### Views, View Controllers, and other Classes
* Views
  * CategoryCollectionViewCell
  * SourceViewCell
  * ArticlesViewCell
* View Controllers
  * ViewController.swift
  * SourceViewController.swift
  * ArticlesViewController
  * DisplayViewController
* Other Classes
  * Category.swift
  * Source.swift
  * Articles.swift

#### Data models
* Category.swift
* Source.swift
* Articles.swift

[Back to top ^](#)

---
> **Version:**
* Swift 3.0
* Xcode 8.1
* ```pod 'Alamofire', '~> 4.0'```

![simulator screen shot dec 18 2016 10 59 59 am](https://cloud.githubusercontent.com/assets/17153572/21295781/6238179e-c511-11e6-80ea-d9adc79518ad.png)

![simulator screen shot dec 18 2016 11 00 44 am](https://cloud.githubusercontent.com/assets/17153572/21295787/75d02756-c511-11e6-88e0-ce703b93d4b6.png)

![simulator screen shot dec 18 2016 11 01 13 am](https://cloud.githubusercontent.com/assets/17153572/21295808/d9d12408-c511-11e6-9074-545632a201d2.png)
