import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'data/entities.dart';
import 'utils/utils_functions.dart';

const String fakeProduct1 =
    'https://dkstatics-public.digikala.com/digikala-products/181659703f20beae274e023159a359a56e26ecb5_1597229334.jpg?x-oss-process=image/resize,h_1600/quality,q_80/watermark,image_ZGstdy8xLnBuZw==,t_90,g_nw,x_15,y_15';

const String fakeProduct2 =
    'https://dkstatics-public.digikala.com/digikala-products/01b2300a3d51d5593ad3b897c879cfe582d4509e_1597229331.jpg?x-oss-process=image/resize,h_1600/quality,q_80/watermark,image_ZGstdy8xLnBuZw==,t_90,g_nw,x_15,y_15';

const String fakeProduct3 =
    'https://dkstatics-public.digikala.com/digikala-products/1321eec7aa862d5e2b5ffcb46c8b2c04b596b757_1597229337.jpg?x-oss-process=image/resize,h_1600/quality,q_80/watermark,image_ZGstdy8xLnBuZw==,t_90,g_nw,x_15,y_15';

const String fakeSale1 =
    'https://dkstatics-public.digikala.com/digikala-adservice-banners/5d153e6b7d8f4f32f26cb7a18a9afe244c67f46c_1603547559.jpg?x-oss-process=image/quality,q_80';

const String fakeSale2 = 'https://www.digikala.com/mag/wp-content/uploads/2018/09/amazing-offer.jpg';
const String fakeSale3 = 'https://vahabonline.ir/wp-content/uploads/2019/10/AmazingSuggestion.jpg';
const String fakeSale4 = 'https://www.digikala.com/mag/wp-content/uploads/2016/11/822-522-mag-amazing-friday.jpg';

List<String> fakeSales = [fakeSale1, fakeSale2, fakeSale3, fakeSale4];
List<String> fakeProductsImages = [fakeProduct1, fakeProduct2, fakeProduct3];

List<AmazingDeal> fakeAmazingDeals = [
  AmazingDeal(
    1,
    [
      'https://nyazco.com/wp-content/uploads/2019/11/tabriz-men-sport-shoes-anfalos-model-a-600x600.jpg',
      'https://nyazco.com/wp-content/uploads/2019/11/tabriz-men-sport-shoes-anfalos-model-b-600x600.jpg',
      'https://nyazco.com/wp-content/uploads/2019/11/tabriz-men-sport-shoes-anfalos-model-d-600x600.jpg'
    ],
    'Nike Shoes',
    250000,
    162000,
    35,
    DateTime.now().tomorrow,
  ),
  AmazingDeal(
    1,
    [
      'https://dkstatics-public.digikala.com/digikala-products/116717967.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_80'
    ],
    'T-Shirt',
    55000,
    44000,
    20,
    DateTime.now().tomorrow,
  ),
  AmazingDeal(
    1,
    ['https://janebi.com/janebi/9fd2/files/236927.jpg'],
    'MI Charger',
    120000,
    90000,
    25,
    DateTime.now().tomorrow,
  ),
  AmazingDeal(
    1,
    [
      'https://memorybazar.com/wp-content/uploads/2020/03/SSD-Samsung-860-Evo-500G.jpg',
      'https://www.pardisstore.com/wp-content/uploads/2018/11/2543146.jpg'
    ],
    'EVO 500 Samsung SSD',
    1690000,
    1605500,
    5,
    DateTime.now().tomorrow,
  ),
];

var fakerFa = Faker(provider: FakerDataProviderFa());

List<Comment> fakeComments = List.generate(
  12,
  (index) => Comment(
    index,
    fakerFa.lorem.words(3).join(' '),
    fakerFa.lorem.sentences(2).join(' '),
    DateTime.now(),
    faker.person.name(),
  ),
);
