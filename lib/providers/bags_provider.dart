import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemytest/data/dummy_data.dart';

final bagsProvider = Provider((ref) {
  return dummyBags;
});
