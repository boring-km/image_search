import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'pixabay_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('Pixabay Api에서 iphone 데이터를 잘 가져와야 한다.', () async {
    const query = 'iphone';
    final client = MockClient();
    final api = PhotoApiRepositoryImpl(PixabayApi(client));

    when(client.get(Uri.parse(
        '${PixabayApi.baseUrl}?key=${PixabayApi.key}&q=$query&image_type=photo&pretty=true')))
        .thenAnswer((_) async => http.Response(fakeJsonBody, 200));

    final Result<List<Photo>> result = await api.fetch('iphone');

    expect((result as Success<List<Photo>>).data.length, 20);

    verify(client.get(Uri.parse(
      '${PixabayApi.baseUrl}?key=${PixabayApi.key}&q=$query&image_type=photo&pretty=true',)));
  });
}

String fakeJsonBody = """
{
    "total":1419,
    "totalHits":500,
    "hits":[
        {
            "id":620817,
            "pageURL":"https://pixabay.com/photos/office-notes-notepad-entrepreneur-620817/",
            "type":"photo",
            "tags":"office, notes, notepad",
            "previewURL":"https://cdn.pixabay.com/photo/2015/02/02/11/08/office-620817_150.jpg",
            "previewWidth":150,
            "previewHeight":99,
            "webformatURL":"https://pixabay.com/get/g17f926039c2d05f38a524378ae89c44dd6d5f935733fe344edef0962ab69abf1e5baa43592ca9e4b2eff25f6e05bb17e_640.jpg",
            "webformatWidth":640,
            "webformatHeight":425,
            "largeImageURL":"https://pixabay.com/get/ga0b3ac267704dd358312f35a3d7ec74b4042e699846e3de58dfdf6eefc4cb1145cfd7023386df297cdfe276d88119e1150cc1ae5f3be3b63f04e411be70ad8d2_1280.jpg",
            "imageWidth":4288,
            "imageHeight":2848,
            "imageSize":2800224,
            "views":646002,
            "downloads":276298,
            "collections":3818,
            "likes":1076,
            "comments":244,
            "user_id":663163,
            "user":"Firmbee",
            "userImageURL":"https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"
        },
        {
            "id":410311,
            "pageURL":"https://pixabay.com/photos/iphone-hand-screen-smartphone-apps-410311/",
            "type":"photo",
            "tags":"iphone, hand, screen",
            "previewURL":"https://cdn.pixabay.com/photo/2014/08/05/10/27/iphone-410311_150.jpg",
            "previewWidth":150,
            "previewHeight":99,
            "webformatURL":"https://pixabay.com/get/gf646268cc093774c50123f2d0b024cb57b51fbb7b21a6dd155a1e8bb673d667c1b0fe0c630960007dbf6c738f96b168f_640.jpg",
            "webformatWidth":640,
            "webformatHeight":426,
            "largeImageURL":"https://pixabay.com/get/g58436b63940a4e90b479dbf4258e197e64b8e01f05bac860e3f44b82461a59d038135e1aa970add04189906e41ff203889a3f6b9a84d5a9e733ef9372ead7f27_1280.jpg",
            "imageWidth":1920,
            "imageHeight":1280,
            "imageSize":416413,
            "views":454398,
            "downloads":220921,
            "collections":3640,
            "likes":586,
            "comments":148,
            "user_id":264599,
            "user":"JESHOOTS-com",
            "userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
        },
        {
            "id":410324,
            "pageURL":"https://pixabay.com/photos/iphone-smartphone-apps-apple-inc-410324/",
            "type":"photo",
            "tags":"iphone, smartphone, apps",
            "previewURL":"https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_150.jpg",
            "previewWidth":150,
            "previewHeight":99,
            "webformatURL":"https://pixabay.com/get/g1925e20fcc63aabb2f225203d58b11036e5f2019263be43b5f9de45244b5edf1e98118027f2ba4bd314fc9d787e24d0d_640.jpg",
            "webformatWidth":640,
            "webformatHeight":426,
            "largeImageURL":"https://pixabay.com/get/g193f8d53efed68fd77bce54baee30602396c807b24c42ed69c46991438fed50dabb058baa46f8d37dc9590d6683cd3c72becc8f7ae55d56594adb21a0260a85d_1280.jpg",
            "imageWidth":2180,
            "imageHeight":1453,
            "imageSize":477025,
            "views":587486,
            "downloads":326060,
            "collections":4391,
            "likes":765,
            "comments":186,
            "user_id":264599,
            "user":"JESHOOTS-com",
            "userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
        },
        {
            "id":4106766,
            "pageURL":"https://pixabay.com/photos/astronaut-moon-space-nasa-planet-4106766/",
            "type":"photo",
            "tags":"astronaut, moon, space",
            "previewURL":"https://cdn.pixabay.com/photo/2019/04/06/06/44/astronaut-4106766_150.jpg",
            "previewWidth":100,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/g559aa339c52cec897bbce54161b928266187598a7645bcff00dd23734cb4b1a0788980917e7657f5f0bad6397b4f3d198b65ead99b62943d196995958fc16a5b_640.jpg",
            "webformatWidth":426,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/g239d173f881ea1c27a3d2268db675b616c4f7fee4e9d47140c36e7c5fa0915f102d2ecb4dc9cd66a94b444ccb0ee875131dab3335c195c4736ebd87202c55d8f_1280.jpg",
            "imageWidth":4000,
            "imageHeight":6000,
            "imageSize":2047424,
            "views":447556,
            "downloads":340769,
            "collections":4820,
            "likes":897,
            "comments":98,
            "user_id":12044322,
            "user":"pizar_kestrap",
            "userImageURL":""
        },
        {
            "id":2846221,
            "pageURL":"https://pixabay.com/photos/business-computer-mobile-smartphone-2846221/",
            "type":"photo",
            "tags":"business, computer, mobile",
            "previewURL":"https://cdn.pixabay.com/photo/2017/10/12/22/17/business-2846221_150.jpg",
            "previewWidth":150,
            "previewHeight":99,
            "webformatURL":"https://pixabay.com/get/g80a2702373030dedc29080d62f794db99d2eea038d5a06f171ba2d4f4ffb4ae93a769abcb490ec619ca28a990569f87bd5fe67607f9d4bcb793b432d4b620be9_640.jpg",
            "webformatWidth":640,
            "webformatHeight":426,
            "largeImageURL":"https://pixabay.com/get/g61f31b4fe4fd778a8fcab959fef309e3b0011359483be6b61570f60e1c778823cb1d8c556eecde3095c0adc357ca34a2b0695880e54fc155478826232021b7ab_1280.jpg",
            "imageWidth":4608,
            "imageHeight":3072,
            "imageSize":2543501,
            "views":324212,
            "downloads":229747,
            "collections":2679,
            "likes":572,
            "comments":84,
            "user_id":6689062,
            "user":"6689062",
            "userImageURL":""
        },
        {
            "id":6588614,
            "pageURL":"https://pixabay.com/photos/woman-butterflies-fashion-people-6588614/",
            "type":"photo",
            "tags":"woman, butterflies, fashion",
            "previewURL":"https://cdn.pixabay.com/photo/2021/08/31/11/58/woman-6588614_150.jpg",
            "previewWidth":106,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/gb404c5c14f4024555d0fa4d73f0f7721c5f5025be5ead06bbece2220f925a4e5a3309d8ae5ce58dc87cb7840bd6207128d4d97eea7b7aae79d9c970e174ec725_640.jpg",
            "webformatWidth":453,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/g9585e1cf9e920211f1e6e72be20fc220fa858a2a443c18c0b3738cbf945951b0eb1dade5d0c1669a325275d5bd0d98a0af9c5bab388b5a48f5a8358b2e685ad0_1280.jpg",
            "imageWidth":4000,
            "imageHeight":5645,
            "imageSize":3056377,
            "views":120100,
            "downloads":105745,
            "collections":2271,
            "likes":169,
            "comments":22,
            "user_id":23172418,
            "user":"Wangphan",
            "userImageURL":"https://cdn.pixabay.com/user/2021/08/31/11-28-28-241_250x250.jpg"
        },
        {
            "id":913046,
            "pageURL":"https://pixabay.com/photos/night-stars-moon-human-universe-913046/",
            "type":"photo",
            "tags":"night, stars, moon",
            "previewURL":"https://cdn.pixabay.com/photo/2015/08/29/13/23/night-913046_150.jpg",
            "previewWidth":100,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/g0be5897843c7c5256071a846e5f7aba7e6d7d4adbbddc85a895df5f5675f8ac467de51916086ccf7d2308b63d87ca8fc_640.jpg",
            "webformatWidth":426,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/g05809fa9417652e5db0e9cee6af4f906e20051a031ad56f617109d46661f1752075df3c78c101f8f14488973ebb287d3ea9e529b151d57d22a47ab8084d66cfc_1280.jpg",
            "imageWidth":4000,
            "imageHeight":6000,
            "imageSize":1431240,
            "views":190547,
            "downloads":123500,
            "collections":1739,
            "likes":485,
            "comments":52,
            "user_id":8988,
            "user":"fill",
            "userImageURL":"https://cdn.pixabay.com/user/2018/04/11/18-49-08-660_250x250.jpg"
        },
        {
            "id":1807521,
            "pageURL":"https://pixabay.com/photos/hot-air-balloons-bagan-sunset-1807521/",
            "type":"photo",
            "tags":"hot air balloons, bagan, sunset",
            "previewURL":"https://cdn.pixabay.com/photo/2016/11/08/05/18/hot-air-balloons-1807521_150.jpg",
            "previewWidth":105,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/g38e724a54f2a9bce4110111d938ada93209b7d323d32db122f229f3492e296b7252119628b68aad3c643b5b4c269589a3e81b2d34e1574ac8e8d191a2765332e_640.jpg",
            "webformatWidth":450,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/g33a5570dcbd9752297367ff5ee3ae3142ea04c8e3334324dcf5f54456817e0c48d33f6ca0b6079b3e8db5fa70c192f8013ad5b6a7d51992c287ccac0ce65f402_1280.jpg",
            "imageWidth":2504,
            "imageHeight":3558,
            "imageSize":2054554,
            "views":385845,
            "downloads":229373,
            "collections":1775,
            "likes":455,
            "comments":32,
            "user_id":3639875,
            "user":"sasint",
            "userImageURL":"https://cdn.pixabay.com/user/2016/10/30/05-50-54-750_250x250.jpg"
        },
        {
            "id":1979674,
            "pageURL":"https://pixabay.com/photos/relaxing-lounging-saturday-cozy-1979674/",
            "type":"photo",
            "tags":"relaxing, lounging, saturday",
            "previewURL":"https://cdn.pixabay.com/photo/2017/01/14/15/11/relaxing-1979674_150.jpg",
            "previewWidth":150,
            "previewHeight":102,
            "webformatURL":"https://pixabay.com/get/g5c5a3882c2c62ff8e2bfb3163c67109924d09bd42561a4bb5f24fc951367c1c72fbc33891ca2266e92d29594b6af9ca25fc9e9dd66e0792d0bae602680965f1b_640.jpg",
            "webformatWidth":640,
            "webformatHeight":438,
            "largeImageURL":"https://pixabay.com/get/g16eae514f03ba672aede3c60fc6b054f2d2d2d2a5f584dec5e3f2b96fb9e848105527d5e2b6d0789f2949c834c9122dd9ff8664e63791c9f50cc9d8b4af0d8f5_1280.jpg",
            "imageWidth":5310,
            "imageHeight":3637,
            "imageSize":3751070,
            "views":357709,
            "downloads":205657,
            "collections":3192,
            "likes":1070,
            "comments":131,
            "user_id":334088,
            "user":"JillWellington",
            "userImageURL":"https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
        },
        {
            "id":6589852,
            "pageURL":"https://pixabay.com/photos/forest-nature-trees-woods-outdoors-6589852/",
            "type":"photo",
            "tags":"forest, nature, trees",
            "previewURL":"https://cdn.pixabay.com/photo/2021/08/31/18/51/forest-6589852_150.jpg",
            "previewWidth":100,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/g82b212b2a0508543864db9607a369557f907642a7c02a4acd00bb2daba9d53b8d4c054c1becf3f1e93fbde3912347b710c4689bde5f57466d35d453200124303_640.jpg",
            "webformatWidth":427,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/g0527082c4d1129e059d08bcc67576bd4bc26671ed157d03ad46b6e676be59577b7f4f3389cc222f6984039a37c6dfcc70d692269debc95f05cf72acc01a0fd1b_1280.jpg",
            "imageWidth":3969,
            "imageHeight":5953,
            "imageSize":10130472,
            "views":40833,
            "downloads":34139,
            "collections":1253,
            "likes":96,
            "comments":12,
            "user_id":1537217,
            "user":"daschorsch",
            "userImageURL":"https://cdn.pixabay.com/user/2021/08/18/19-58-17-834_250x250.jpg"
        },
        {
            "id":1851497,
            "pageURL":"https://pixabay.com/photos/bicycle-building-city-1851497/",
            "type":"photo",
            "tags":"bicycle, building, city",
            "previewURL":"https://cdn.pixabay.com/photo/2016/11/23/00/39/bicycle-1851497_150.jpg",
            "previewWidth":105,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/g2182275fcf668670f99623de9309ed6127492c0400624b80dd16a512890667853f7cb733d98a9118458f27f9eafd52dbeea1b406c704fa90f4c335fea019b1ad_640.jpg",
            "webformatWidth":447,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/g75d4ba4a5c057989c9670bcaf2c7bad38eb50377873bbe280234ba95b6482ad3610cf50624ef038680c66e4366af5ab75ce546a581453db927abf0fc1995552d_1280.jpg",
            "imageWidth":2859,
            "imageHeight":4096,
            "imageSize":2369529,
            "views":239121,
            "downloads":171627,
            "collections":2104,
            "likes":441,
            "comments":40,
            "user_id":2286921,
            "user":"Pexels",
            "userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
        },
        {
            "id":791450,
            "pageURL":"https://pixabay.com/photos/iphone-iphone-6-iphone-6-plus-apple-791450/",
            "type":"photo",
            "tags":"iphone, iphone 6, iphone 6 plus",
            "previewURL":"https://cdn.pixabay.com/photo/2015/05/31/12/14/iphone-791450_150.jpg",
            "previewWidth":150,
            "previewHeight":99,
            "webformatURL":"https://pixabay.com/get/g37abe6a3a0d1811b6f9fb5a1090384ea7197e8ca8cf019645a0e4d50b7a6d4e1da93dcd043ee7715d1c5d860313e3f30_640.jpg",
            "webformatWidth":640,
            "webformatHeight":426,
            "largeImageURL":"https://pixabay.com/get/g0764e79c8839e3d0c470cbfe3533073bc6384a6c5743fbce6e3f2dac42484306ee524cc4934db945afe7aae06f47366b1952c4676e3b9330a723d0d3918480c6_1280.jpg",
            "imageWidth":5254,
            "imageHeight":3503,
            "imageSize":1909143,
            "views":127693,
            "downloads":81583,
            "collections":1696,
            "likes":341,
            "comments":58,
            "user_id":1013994,
            "user":"kaboompics",
            "userImageURL":"https://cdn.pixabay.com/user/2018/04/09/00-31-22-504_250x250.jpg"
        },
        {
            "id":459196,
            "pageURL":"https://pixabay.com/photos/macbook-laptop-google-display-459196/",
            "type":"photo",
            "tags":"macbook, laptop, google",
            "previewURL":"https://cdn.pixabay.com/photo/2014/09/24/14/29/macbook-459196_150.jpg",
            "previewWidth":150,
            "previewHeight":92,
            "webformatURL":"https://pixabay.com/get/g37c0d9c2f64d32bd596038f0a5b5477f174bb7137db0d204268ff91610ab4a9060ddecbc9be130193c297ee2fd284234_640.jpg",
            "webformatWidth":640,
            "webformatHeight":396,
            "largeImageURL":"https://pixabay.com/get/g7a8bb0d3b04d34f9ac7d9270cd500d3bae6645ae61076ec807ec47ae58b392ee45f08fbf16c050c26b6a666ba811b333fb40d214d04e6d3ffbbbe3bb25d71682_1280.jpg",
            "imageWidth":3888,
            "imageHeight":2406,
            "imageSize":2883743,
            "views":473413,
            "downloads":232775,
            "collections":3600,
            "likes":737,
            "comments":189,
            "user_id":377053,
            "user":"377053",
            "userImageURL":""
        },
        {
            "id":2707528,
            "pageURL":"https://pixabay.com/photos/lighthouse-sunset-coast-tower-2707528/",
            "type":"photo",
            "tags":"lighthouse, sunset, coast",
            "previewURL":"https://cdn.pixabay.com/photo/2017/09/02/15/10/lighthouse-2707528_150.jpg",
            "previewWidth":100,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/g2f1cc7bd10a14020a965988cb0b709e9e427032fe97f6cf1506e6ea416c672093b4aee42e8f2df1ffec2fbe247aa4c1b1c2c9767fa3457dbb3f438722e9d0977_640.jpg",
            "webformatWidth":426,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/g05d09f7aab2e22444da41fb4a47f6d7b1b5bc86297053a282cb45b6659db1bc6bd3f470237fd5c75283701c3eaf70fe31939f784120c2dc11f8684d81cb86b1d_1280.jpg",
            "imageWidth":1333,
            "imageHeight":2000,
            "imageSize":319283,
            "views":236129,
            "downloads":103119,
            "collections":1409,
            "likes":420,
            "comments":26,
            "user_id":12019,
            "user":"12019",
            "userImageURL":""
        },
        {
            "id":1213475,
            "pageURL":"https://pixabay.com/photos/heart-clouds-sky-blue-sky-love-1213475/",
            "type":"photo",
            "tags":"heart, clouds, sky",
            "previewURL":"https://cdn.pixabay.com/photo/2016/02/21/12/09/heart-1213475_150.jpg",
            "previewWidth":100,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/g60c070da3bc38b3e205a5d62dde5513b4b0fa8d0738c289f91ab47a5aae0dc8bd11d35fb9fdf8a21e48d2d7e052855510cc308e4f14734f17ec2244f2c4ac475_640.jpg",
            "webformatWidth":427,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/gcf8fedff44cef8d50f5d3be12ffed0469c5ad4b1d4b0ba55836d2098cf50697eb1998106d61f03e58dbe276d228d10f222df3b1cb3956b27d00bf649b91129fc_1280.jpg",
            "imageWidth":1667,
            "imageHeight":2500,
            "imageSize":656080,
            "views":474533,
            "downloads":328759,
            "collections":2230,
            "likes":679,
            "comments":93,
            "user_id":848168,
            "user":"oo11o",
            "userImageURL":""
        },
        {
            "id":3076954,
            "pageURL":"https://pixabay.com/photos/desk-smartphone-iphone-notebook-3076954/",
            "type":"photo",
            "tags":"desk, smartphone, iphone",
            "previewURL":"https://cdn.pixabay.com/photo/2018/01/11/21/27/desk-3076954_150.jpg",
            "previewWidth":150,
            "previewHeight":99,
            "webformatURL":"https://pixabay.com/get/g7b430e3b5b7e02b1083e8cda1ff4b699be95582bdd178c11e959a460dc842c932518084904548df9c40e07b477c981595dd27a89fbe7c5b28b509b9153b25468_640.jpg",
            "webformatWidth":640,
            "webformatHeight":426,
            "largeImageURL":"https://pixabay.com/get/g3c215a7ec32db02910097789fafe4392fc4d3b22c35be8beb3fb3b5b05db08e5cd577a597cb61c117a170f34833b8acf408af2a9adf479d865347eb850e0b59e_1280.jpg",
            "imageWidth":5304,
            "imageHeight":3531,
            "imageSize":2258922,
            "views":199719,
            "downloads":126966,
            "collections":2353,
            "likes":520,
            "comments":95,
            "user_id":2218222,
            "user":"Ylanite",
            "userImageURL":"https://cdn.pixabay.com/user/2021/11/18/21-11-44-855_250x250.png"
        },
        {
            "id":1867761,
            "pageURL":"https://pixabay.com/photos/home-office-computer-desk-display-1867761/",
            "type":"photo",
            "tags":"home office, computer, desk",
            "previewURL":"https://cdn.pixabay.com/photo/2016/11/29/06/18/home-office-1867761_150.jpg",
            "previewWidth":150,
            "previewHeight":100,
            "webformatURL":"https://pixabay.com/get/g5c3aa55eb407aa208d6a190652f1d52d2e5a87f2724627b2ec0caa4d111437723be9466ce10fec89318bef73846f60d67ff4791aacdba4ba6f9150eeb8c889dd_640.jpg",
            "webformatWidth":640,
            "webformatHeight":427,
            "largeImageURL":"https://pixabay.com/get/ga2e2f893a514b4b87a9cc789f363a452ed42680b5b1fd6f1558cc4964a2aef5e111658f6e41fb361f15871137bdda2bec4841e7902ffb3395977827651d01c5e_1280.jpg",
            "imageWidth":4000,
            "imageHeight":2669,
            "imageSize":2381783,
            "views":156811,
            "downloads":94385,
            "collections":1712,
            "likes":338,
            "comments":45,
            "user_id":2286921,
            "user":"Pexels",
            "userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
        },
        {
            "id":3113279,
            "pageURL":"https://pixabay.com/photos/internet-whatsapp-smartphone-3113279/",
            "type":"photo",
            "tags":"internet, whatsapp, smartphone",
            "previewURL":"https://cdn.pixabay.com/photo/2018/01/28/10/59/internet-3113279_150.jpg",
            "previewWidth":150,
            "previewHeight":99,
            "webformatURL":"https://pixabay.com/get/gedcb52a81729fa76f09f63a39ae5c91be56ea7cba3d798c13e220973bd31cb4d344b3739d6e82f66630e78e15158105bac3f90cb7aff22409b9a3d438b0afc2d_640.jpg",
            "webformatWidth":640,
            "webformatHeight":426,
            "largeImageURL":"https://pixabay.com/get/g85187c5d5c42a0071d8ee8195224ed98cf3387b32873b221b88c3fe2a455df38781c709daabf565878c43db118f72536eba8f267acd897106aed4eb96148f4d7_1280.jpg",
            "imageWidth":5616,
            "imageHeight":3744,
            "imageSize":2904510,
            "views":202733,
            "downloads":116879,
            "collections":2243,
            "likes":345,
            "comments":67,
            "user_id":13838,
            "user":"LoboStudioHamburg",
            "userImageURL":"https://cdn.pixabay.com/user/2012/11/18/16-48-54-297_250x250.jpg"
        },
        {
            "id":3713473,
            "pageURL":"https://pixabay.com/photos/asia-rain-street-illumination-3713473/",
            "type":"photo",
            "tags":"asia, rain, street",
            "previewURL":"https://cdn.pixabay.com/photo/2018/09/30/13/17/asia-3713473_150.jpg",
            "previewWidth":120,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/ga8b44b2011d2f43159d3954d8f96f475a537ddea00b7c6cfc765a127b925d60059127b416062bd29fb93ba2f6ecd3378bc138ca124c078635ea348454db56742_640.jpg",
            "webformatWidth":512,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/gf1d072ae42587b20a4be68f6de0da80648f85a9724fbc8d416f3c6354864ed654ad5976980cc45929e29518d5d6213dacd16e33f6939700e541eddcf79933537_1280.jpg",
            "imageWidth":2410,
            "imageHeight":3013,
            "imageSize":1813305,
            "views":110295,
            "downloads":63311,
            "collections":1458,
            "likes":218,
            "comments":19,
            "user_id":4601460,
            "user":"4601460",
            "userImageURL":""
        },
        {
            "id":1867636,
            "pageURL":"https://pixabay.com/photos/water-pool-turquoise-background-1867636/",
            "type":"photo",
            "tags":"water, pool, turquoise",
            "previewURL":"https://cdn.pixabay.com/photo/2016/11/29/05/49/water-1867636_150.jpg",
            "previewWidth":100,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/g7734d60754d2b24d606564ec2c590e53a4f11d4b799b8bd9f42f0f9cff9883a6b87700f80a9e8b3a86c0063550fded442ba55bfa27cb86d239057a6778f00e20_640.jpg",
            "webformatWidth":426,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/g90326ba874563dc6a53989a56a3ba8a1ea01da720fd02bdf11c7b61282cbd2bca5dcc7e9dd897ba230f8011b1705c98cb0be31c344f2fb1e6f9849f89f56f3a5_1280.jpg",
            "imageWidth":3648,
            "imageHeight":5472,
            "imageSize":8220680,
            "views":155748,
            "downloads":99518,
            "collections":1141,
            "likes":239,
            "comments":10,
            "user_id":2286921,
            "user":"Pexels",
            "userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
        }
    ]
}
""";
