import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/home/home_view_model.dart';

void main() {
  test('Stream이 잘 동작해야 한다.', () async {
    // ViewModel만 테스트할 수 있게 나눈 것이다.
    final viewModel = HomeViewModel(FakePhotoApiRepository()); // UI 분리했으니까!

    await viewModel.fetch('apple');

    var result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.state.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(microseconds: 500));
    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}


List<Map<String, dynamic>> fakeJson = [
  {
    "id": 256261,
    "pageURL":
    "https://pixabay.com/photos/apple-books-still-life-fruit-food-256261/",
    "type": "photo",
    "tags": "apple, books, still life",
    "previewURL":
    "https://cdn.pixabay.com/photo/2014/02/01/17/28/apple-256261_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
    "https://pixabay.com/get/g11b92f25344b9dd772d15acf45ff9e194c8c38bd61035ab0821832d3ff299c6a2b296729a8e3c87ed4526299e2372d89_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 423,
    "largeImageURL":
    "https://pixabay.com/get/g945ac4745b4734624cb60020a138cfac364e843bd281f8a67928cb6dc875f0c287002b8578dd39f4bcc505cac4e0231476765058823442919f84de14f9f074ed_1280.jpg",
    "imageWidth": 4928,
    "imageHeight": 3264,
    "imageSize": 2987083,
    "views": 389358,
    "downloads": 183897,
    "collections": 3392,
    "likes": 969,
    "comments": 218,
    "user_id": 143740,
    "user": "jarmoluk",
    "userImageURL":
    "https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg"
  },
  {
    "id": 1122537,
    "pageURL":
    "https://pixabay.com/photos/apple-water-droplets-fruit-moist-1122537/",
    "type": "photo",
    "tags": "apple, water droplets, fruit",
    "previewURL":
    "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg",
    "previewWidth": 150,
    "previewHeight": 95,
    "webformatURL":
    "https://pixabay.com/get/gdd8a155637cfd3ee969b3f8abe344dae75d22bc4244ce922b7ba114e33c402b4f75800700485557df4ddb4a861a70b51b5eca4a6503953241930b60c9774ecf6_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 409,
    "largeImageURL":
    "https://pixabay.com/get/g48b14378a5f79ff480cd222625e415d4400f6ba6c2339ea4ba98a4f60b644e15baafe7845a25592bc993985adcd1b2f7311ffeab44720ccf89ae5161098db37f_1280.jpg",
    "imageWidth": 4752,
    "imageHeight": 3044,
    "imageSize": 5213632,
    "views": 237077,
    "downloads": 133212,
    "collections": 3091,
    "likes": 1008,
    "comments": 156,
    "user_id": 1445608,
    "user": "mploscar",
    "userImageURL":
    "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
  }
];
