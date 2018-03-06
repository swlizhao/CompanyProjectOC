<img src="https://lh3.googleusercontent.com/OoWK7hQYWoGnP8ZhdgzQJ8-0sXE5LimuVIehBhzAn1Y_BrfIPh_yKjYyozWHsb79QptDJhQbCkZPrWq3trk1EodNm_UtHksKGiF0-uAx4Y6YQh-DHMSUy5xDuHJNeDgNJpQcB7gb_kJw45bDBKEn6HUA8d1hux5B1safFPR9v0DTOKVXkOb94by85ooRJ8UIWt7kPXGTE4pd0iqRk5ooDXfajCDoxDbc_5i3Na9Vj9jcKjDidAKtuaNi_BZJUz9fDWqnFuoIHt-p_6mtA1CERPfO3DFzspCFtB7dsA0cznI7TOXMPsAlYFEuKTEuIZiWNETaG-nUscAJc_HWMplknB9_LIVXYfZJBkEvDJP_NWVY5ekJ8L3n6kE2EkEorFHb5YGnFRENNao57vVsk9b7M7lCQJ2NMnCaPM2MQHN734g_bRvwdb-acGmV7s7SjyZrdUmhgWcFhmIzRDMFOGAYW09h4WwxQYBr5vXh9FPrM_KVf8PXfWxSO3ziOH3Q1DkaP6Sr738Vn1CqmjF7u8tEOSBIe1SUtiQ8FfNhQ72K1RNN_a941rh_iBy_uVqp88cQ0fV2tQ0E84lvm3yb_Eaqio4putKMpmPVE08Wp_BFPGL00VqfZjo=w752-h100-no" width="650">

### [English](https://github.com/HJaycee/JCAlertController) | [中文](https://github.com/HJaycee/JCAlertController/blob/master/README_CN.md)

`JCAlertController` is `same level` with `UIAlertController`.<br/>
It is `inherited` from `UIViewController` too.<br/>
It supports managing presented controllers with `FIFO` or `LIFO`.


| Compare  | Present Queue   |   Custom Style | Custom View |  Minimum iOS Target |
| :----:   | :----:  | :----:  | :----: | :----:  |
| JCAlertController |  support  |  simple | simple | iOS 7|
| UIAlertController | not support|  difficult | difficult | iOS 8|


* support present queue
* support custom style
* support custom contentView

## What is present queue ?
Look at the flowing code:

```objc
[self presentWithFIFO:alert1];
[self presentWithFIFO:alert2];
[self presentWithFIFO:alert3];
```
Result:<br/>
alert1 shows `first`, after dismissed by user, alert2 shows `second`, after dismissed by user, alert3 shows `third`.<br/>
like this: `alert1` >> `alert2` >> `alert3`

```objc
[self presentWithLIFO:alert1];
[self presentWithLIFO:alert2];
[self presentWithLIFO:alert3];
```
Result:<br/>
alert3 shows `first`, after dismissed by user, alert2 shows `second`, after dismissed by user, alert1 shows `third`.<br/>
like this `alert3` >> `alert2` >> `alert1`

Present queue is powered by [JCPresentQueue](https://github.com/HJaycee/JCPresentQueue). It supports cocoapods too.

## Preview

#### <a>normal style</a>
<img src="https://lh3.googleusercontent.com/z5g468rrEDEQZPbENNiWiTNZ7I0RdE6xW0a_mUkiR-yawNv3VRYW3ikMO_B_QfhOHm0SZuTvVo8DLJbOG98z8OVcQ90OdH-Npl_H257vhNAv0Bsknrhg0ESY-J8ixIXeyqzsKhFTFqcWA1y5QEZ93wrqx057o72DYOLbD9pKlEOQB7bK9_xqU80cMDvlu7vrfel732a_dypDMfUetXclXGW9cu5P9gwTw9RBfOxi8TvxT7AxovgPyCgcVOZD1fxYWjli8vBMGsnmnhUEDMbFJ0N58vx83vXfUTxjLs8qslY09dXMP62pvlR0vz7gdO9wEwDPgoIyf208jGqvY7ApHtNBXvD8vxppRCMobTxe__PxwPeWYjxog17ypkD0Vm3B9jVBFrudVxde0KhvHenEMG_IbOL713Jx08kp4OFwj6GPnFSDCAf7N0KDal4cNpSWz1D_yzqwUinrlXd7hkcjIr4Hc28yjSXS-DFKP7fzrvDJ1QB-dC_H7ItE-GZZXU9E2e-nq77G986idrMqE932XA8CcH6mC_whOduw6xKktKov33djV1YI50nCxVaD0lS1VwyribS9MlBGcarWEhFdR4TWKi7d8OopBfua7ohUtX0bcFiAWPY=w640-h291-no" width="320">

#### <a>normal style（title only）</a>
<img src="https://lh3.googleusercontent.com/WZSp2cArJG6M_1ACpmaEE3L10NBto7dMXtwTvJZLsOPDe_nnake9j939fLgqXieNwSyt3Rfb8T9vrv5CHYUhMNVltyn4pSmfkh5764wP8VAS0sbYLXj6EuykbaWiu3_UmES_2-G3qr3faDpJe3L8eyb4QsptC9r_TFrwfPuPIUY7zfmiPG1xB3Eg_5vkWRlsoAaaeoYQZxT4WKq6lBVK-hmCkh97IobK9-UR3DRIn9BEzju-7G9kSpYnOA0zKkbM9TPckTASuFhXfFO-lJwZKvJnB_3O5JIAsxAsTXh_mLA_0pAuLiH9im6F4-1-YDqm2Bokw9q4ruAkY2ChrGUoO3RzcH-skIUCn7pfCyMIjSy3Fdt1hmCSAgIHWQuLMBxNRJ6IQqHF8n5jvDTQHVf63wDl5MgssIMX6YQIra8cnO6MiahpxHHuYhS7IsvCuLFtuH1xCVtvDwzYfRvTs07U0RL1jcvVnnGQD7tJuCcbIeiMyKnhYP57Sd04y4DbNjwwckGTeoEBxFe-GJM6tFonii6gTatoRKuloc-kt06e1vu96VjES_e6ZAARt91qR9-GrgGfOlIUDybCuyUaSXAwMtBgrZwWfAB-ZMP_ejDZp5ErRjDjRwQ=w640-h309-no" width="320">

#### <a>normal style（content only）</a>
<img src="https://lh3.googleusercontent.com/gW7OnpgR2rD1JxQooYgTVFeJVWCEAk9HGvG2_O1PYUsaRZnVMs3K_D7F15ran_fVKMzjpsCBXjBf10d9KmMksd_cOp-mXtg_ZaRY6Q7AqF_b21OOsHmLYMQ-h7AXlZouHAhxnIJYoTGFKtmcK24urcvSripBUCW-v8ACmRP7D0Z9RNx9GzWeqQyMX4YBKupzX6gcqCTZBzIrouvmZ_GtTc64sXICkqaP3O07y3HIktqP5hE4zKQYkWwOmBcKqbTgdbeddxD2YvZ54iqzNN2095ArnDSnpIo_2BxuErYjqq9C4vbAwe0o6WbdnLx_uTCmxT5Ya7P6NuMrxaiNyjwAOkq8Z43oYGFVK8q_6OhUM6Pqlxoenqw8gKpeJSyNyHmoDZJ6DmLaxBgBRmvNZGGLWXYny5LUV5MWmKoDO2dvdvBJyLHEWRuGvIwmBo3khuhX2YTmop9BTIHC-PQd-aY66GNUurkk5PIvJ36BAARIxW8BvOcFHmiCYNGVeeeXpxmatwPNSwhSfWs1dz3fwIeRjZfyec0Xs6N86URbAdzJ5J6s4eGLyVL3D1EPjAqbddyJbqf2Mcsg9A_kNRnTOXglKjQtOxXUB1Y1MjQ5FNVLlZdIg3Q5GLU=w640-h313-no" width="320">


#### <a>normal style (words oveflow)</a>
<img src="https://lh3.googleusercontent.com/F-3bjJePzCu2gsASTJthMsB9aN7C1HwmrxVgprnY8PqF22N1a8WfHZeI20Vc0i2CtPqahF5zWLsTFthG1nvWNq88l21DMhWRKYl6Mz-g_sRkGmoB2LzNwOFDRI20V49VsK1XZsWrTMuGGji39lkwZ10vWtthhk05yao9KfyAsq5haTChAZdCCp2Tn8oeHCdwcc6uYrnTy7g702Py6S2FqjWEo1h1RiFBcMj18zAcceHcXBJVXUFg3rJ-2bnUNAJ9e-G1lwm4n3euoYcYkkl7DdVxMF-3-1z9NS0bz6v3nLH2q54CwllQN5HDe65gtz8lHKmKnrzCtikqP7mdHvodoLHN3d-IfLuQiMsTe6lcT0SgXQ8763LxEVygqtSmsyeJSa1wfgWyqpU_hjSSTrncfNJGxnWDNzmIEaHIOKZuzT31i7_CEmDzhgslQHyI4kLxaSeQywGLwvPGsCk_8Nhqb3hzV60_-drtEim3T5lvWRL1_PVLErtm-2jxxx0CT4_uN5csCqdgaZr7KpbCxSEsQPTXGy8bssWHRlcxrLDn5q-hzqm53n_nePGeJf2HKYsj1oefmNvCVmbhaV0UeuFUsEaDpRWojyQS0orAC4KUwyO__lI95ig=w640-h1136-no" width="320">

#### <a>custom style</a>
<img src="https://lh3.googleusercontent.com/OCl6FoBuVWPc4iFFAZ5mhAom81QThVRLQz8hwvIVc2BcCGPc70erTSQwqjGbGqjLWY5c_MUhb0NQTV8WBkj1BzNKqa8Bd3FQoVsZsUhQDR__VB6tJlZMOBOFORR0OvJh32wjw9QmqodGKHtJfOZJW3_vRnBAzczO8GulIZ1YsNxB5J4E1faUvCAOpcUgi4qoSBSmQpR10LI34TGD9UHH7zXD_Z3WZn2hl3RYHQlwksckzPI2wxTUeqs7Oj5W5YfVR47nrhsuRIxgEW8lMYktbVH4i0b-jHEiKHVQ7PRHhaZloCva7Or-yYJIpoz0Npwc2S7QDCK9GW_2D01l2mWEE4JXRzpygqrmvaJyAUhcrv0WVOOgBpcvaIsQAmq3FNANczbQ3c2acElD0pI9I2mkvdiVT3rQuBeIIcV-eUHFXa8uUn-NaSMZvwAA38wwK8y7Osm6HEGZ0zpLuFyeLD76CCTlKd1MJpEIG7UYohh-pMHKaAKdciVfxelZdHrWwWFip0hEbcjFbuFjUnK9FRU0oEjfRKs31aykI64urEvkQpjcqy-ughyBcGJHjO7jAkaps_LZp-0PjHedUSIbKETIwmYBe27clko4gOkD49Ov2GQd9dDC63w=w640-h397-no" width="320">

#### <a>custom contentView</a>
<img src="https://lh3.googleusercontent.com/bA1VzeIgbaivSRZKsfHlJDh6lPVx2FNW1TsQzm48XrriNM4CgB8duHb6X06F8UBunc3RKkDVVyf5QVS9YtZe7j6yzCDE-IzJddiEabvIBTDXaz4of4yb0hoFQ2j-brKjFhUrVaQLOAgosRkpd25-5-n1klLKTVz0XvsY9w3eUEeo2-3Je7bP1EScOB27czq4aNrh33RkWGDMNEcTzpiIr8_flhAYPnhzKuLDWKyfn6q0PZVZHtiRRa63bNJmMgHoKaQ_P9DP_QxrzsXGE16sr3V7wOOPGy68v_rEuCMq4hqHWQPwZUdCluVHrnAupaOWt7gmlPopUQKYK9s6PZuB1WH4DvtjHVy86BSlVvT5rU_b1g5L7iODGEtw9WfqnVfaKM7yHhqqHbToCZrh5afoZ5frd2xDh9GCtli_9w2-VbpRbsB0DngxDhqz8-K4w2queZpk4vpErCxKhjw8afdZ1qEN-kccBpQRv7rdKKqZwgxLdk97gC7JUGCgMXUyYNoe01ibIT7d9BMuFgzD-JN4LidPeasFKBzYcfttSTtl-68B3xWgRtox7aSslewiwI_y5oAgbAzjbaI1Lt9z0KEDuxXloQjS9Papo5bYdoWSOtEwRsuHNFI=w640-h435-no" width="320">

#### <a>custom contentView and keyboard handle</a>
<img src="https://lh3.googleusercontent.com/IZLc82V2ilLJZYd4JypnJv1Q189ozZEQQEA0d1eS8_V7RsRVOdHdL1OSIDwPfoHbcf23j6O9qn2r0f3w0bm3xfPV5CeD4GR7wWf6K0ty11FAd5A_q8Ozi4EjDCGVDytDhz9NCSkZrcflAynp9AnUMKz4-bWupBBkioA03UAOZWnzCch95fGPhrQcZfqi8oozXlfPP4mtpRpJCssmgmjZKtd7kG_bcXcLjd4uK-JKgP1KJo3ZpG0Iclb3UaWTCWyVFKp5ImmBc4rJ4CfvFhwrzQy9uep19HEgT-bTJSZT5S5Ls6jHYvuQUPDqm2mG1T2tU0gwwu0grVWhqx9TYoxR9Y_3VjZt4R0vZ0tnDGAfinlSk_1oyK6tMyF-PVbk2bIWbfu7g4cUFftQa37OdLdNtWRBG-TY6TcbStZQn578C7nzx3dkl3nC1r3Nctd6nx2nbfVrMPEd99qrZtDqaqrKThmgkDC5fZ-QCV1dYbUOXKvH1uxI5RsEQ0v-zLZqueqpH8rMPAvIvzKcaJC9-GZ3jl-hVYbJD0q-PIqzxvY-Yrbrv4Q8qQQlIfaLZ_WVomPxdYmtXiZDEDMnd9tgLlHmDdrP4oJdH4EyN4KRoG_1RFsGUZl7Byk=w640-h1136-no" width="320">

#### <a>custom contentView and attributedstring</a>
<img src="https://lh3.googleusercontent.com/6g5KOma53BXaSyp7c0LRjD_CCiX3L28sCOgsbcS7qJvJa9Uv4FoQfLABjw38Mal_shS99rglSqUVKSPj5az7FoQL2Ewjr9TVSFup4nUo6aa0yd5lLHdFpqAZcQ1lf_gNDHumSqaxeuK2ZQbzcyzZ9k_7nNwkgP_oYvaKbpHlzBfSNygV0YA6Vzj7Z4gsBnDevXRnDrx0sBexDnouvUdjuxo_wkcHyLZjeOg6VD7Z5nz01SFIHs5Yacu1gLDo1Lza7r2K9ICrkWPGwRmXC2yzOzV1qOUk6hcgTp5v8oust4GeRtI1Xv6yNPCWYQymwV0j4BSQ5xJQVV27qeZwqyLMsKSLybzddmlNGMQPKYp4_HJS5MNhfU071iB4B9OzBpl7lyPUc50LdBGm_7ca1xtdYN8wDm3qooNuU4g55icbwP82CZRV9QoXrfY0K8G5RhrnajhUs23t1fgRHN9UIuYt_moyymU7BXTFvbqCZ4vkmhemne5zOltbBYZGkXG79PYW2YoVPydXM0G3g45yThAvMESWd5rLRIcWl3J-vWJLVTjoty23rEQlVhbzqjdu_10RYUGtAYWLmK5HnN9IPmz7dM3tiiRtXry4Q91wBTVX4kff2D1GM4g=w640-h388-no" width="320">


## Struct

```objc
.
|____.DS_Store
|____AlertView
| |____JCAlertView.h
| |____JCAlertView.m
|____ButtonItem
| |____JCAlertButtonItem.h
| |____JCAlertButtonItem.m
|____Category
| |____NSAttributedString+JCCalculateSize.h
| |____NSAttributedString+JCCalculateSize.m
| |____UIColor+JCHightlightedColor.h
| |____UIColor+JCHightlightedColor.m
| |____UIImage+JCColor2Image.h
| |____UIImage+JCColor2Image.m
| |____UIViewController+JCPresentQueue.h // present category
| |____UIViewController+JCPresentQueue.m
| |____UIWindow+JCBlur.h
| |____UIWindow+JCBlur.m
|____JCAlertController.h // import this
|____JCAlertController.m
|____Style
| |____JCAlertStyle.h
| |____JCAlertStyle.m
| |____JCAlertStyleAlertView.h
| |____JCAlertStyleAlertView.m
| |____JCAlertStyleBackground.h
| |____JCAlertStyleBackground.m
| |____JCAlertStyleButton.h
| |____JCAlertStyleButton.m
| |____JCAlertStyleButtonCancel.h
| |____JCAlertStyleButtonCancel.m
| |____JCAlertStyleButtonNormal.h
| |____JCAlertStyleButtonNormal.m
| |____JCAlertStyleButtonWarning.h
| |____JCAlertStyleButtonWarning.m
| |____JCAlertStyleContent.h
| |____JCAlertStyleContent.m
| |____JCAlertStyleSeparator.h
| |____JCAlertStyleSeparator.m
| |____JCAlertStyleTitle.h
| |____JCAlertStyleTitle.m
```

## Installation with CocoaPods

step 1
```objc
platform :ios, '7.0'
target 'your target' do
pod 'JCAlertController'
end
```

step 2
```objc
#import "JCAlertController.h"
```

## Usage

```objc
// LIFO: alert3 >> alert2 >> alert1
for (int i = 1; i<4; i++) {
JCAlertController *alert = [JCAlertController alertWithTitle:[NSString stringWithFormat:@"alert%zi", i] message:nil];
[alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
[self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
}
```

## Contact me

E-mail: hjaycee@163.com<br/>
Blog: http://www.jianshu.com/u/8bde69945e50
