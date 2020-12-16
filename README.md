# SAKAutoCode
## 代码自动生成工具

根据json 文件生成一些ios代码

### Json生成属性声明
输入
```
{
    "imgUrl": "https://shigongbang.oss-cn-hangzhou.aliyuncs.com/material/650000/20190926709484865548605",
    "promote": false,
    "brandName": "",
    "unit": "立方米",
    "priceScope": "10.00",
    "cartTitle": "撒谎给你苹果的的",
    "updateTime": "2020-12-10",
    "id": 160767344012928,
    "storage": "北京市东城区",
    "cid1": 7,
    "status": "草稿"
}
```
输出

```
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, assign) BOOL promote;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, copy) NSString *updateTime;
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, copy) NSString *storage;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *cartTitle;
@property (nonatomic, copy) NSString *brandName;
@property (nonatomic, copy) NSString *priceScope;
@property (nonatomic, strong) NSNumber *cid1;
```

### 埋点json生成code

输入
```
[
{
    "title":"首页",
    "titleId":"JC_100000",
    "ios":"CMHallViewController",
    "android":"CentralizedTypeActivity"
},
{
    "title":"个人中心",
    "titleId":"JC_1000002",
    "ios":"CMHallViewController",
    "android":"CentralizedTypeActivity"
}
]
```

输出
```
[self creatVCInfoWithIOS:@"CMHallViewController" android:@"CentralizedTypeActivity" titile:@"首页" titleId:@"JC_100000"];
[self creatVCInfoWithIOS:@"CMHallViewController" android:@"CentralizedTypeActivity" titile:@"个人中心" titleId:@"JC_1000002"];
```

### 埋点Android Json格式生成code

输入
```
{
  "DealedCasesListActivity": {
    "title" : "成交案例",
    "titleId" : "enterprise_1",
    "android" : "DealedCasesListActivity",
    "ios" : "iosVC"
  },

  "IntellPropAcitivity": {
    "title" : "知识产权",
    "titleId" : "enterprise_2",
    "android" : "IntellPropAcitivity",
    "ios" : "iosVC"
  },
}
```

输出
```
[self creatVCInfoWithIOS:@"iosVC" android:@"IntellPropAcitivity" titile:@"知识产权" titleId:@"enterprise_2"];
[self creatVCInfoWithIOS:@"iosVC" android:@"DealedCasesListActivity" titile:@"成交案例" titleId:@"enterprise_1"];
```