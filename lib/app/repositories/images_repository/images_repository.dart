import 'package:js_guru/app/models/image_model.dart';

import '../../../network_module/api_path.dart';
import '../../../network_module/http_client.dart';

class ImagesRepository {
  Future<List<ImageModel>> getImages(String start, String limit) async {
    List<ImageModel> _images;
    final dynamic response =
        await HTTPClient.instance.fetchData(ApiPathHelper.getValue(ApiPath.images, concatValue: start, concatValue2: limit));
    final List<dynamic> responseJson = response as List<dynamic>;
    _images = responseJson.map((dynamic value) => ImageModel.fromJson(value)).toList();
    return _images;
  }
}
