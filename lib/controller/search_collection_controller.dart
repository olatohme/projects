import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:new_proj/models/search_collection_model.dart';

import '../consts/url.dart';



class SearchCollectionController extends GetxController {
  var name='';
 
  SearchCollection searchcollection =new SearchCollection(collections: []);
  var collectionlist = <Collection_search>[].obs;
  @override
  void onInit() {
    super.onInit();
  }
  Future fetchSearchCollection() async {
    final response = await http.get(
      Uri.parse('${Url.domain}/api/v1/collection/search?query=${name}'),
      headers: {

      },
    );
    print ("ppppppppppppp");
    if (response.statusCode == 200) {
      print ("200");
      
      searchcollection=searchCollectionFromJson(response.body);
      collectionlist.value=searchcollection.collections;
      print(response.body);
      
      }
    else {
      print(response.statusCode);
      print ("pppppppppp");
      // Handle error
      print('Failed to load products');
    }
    // isLoading.value = false;
  }

}
