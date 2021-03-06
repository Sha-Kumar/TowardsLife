import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'controllers/controllers.dart';
import 'data/provider/fireApi.dart';
import 'data/repository/fireRepository.dart';
import 'views/views.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const homeRoute = '/home';
  static const adminRoute = '/admin';
  static const kuralsListRoute = '/Thirukkural';
  static const aathichidiListRoute = '/Athichudi';
  static const searchRoute = '/Search';

  static final pages = [
    GetPage(
      title: 'Home',
      name: homeRoute,
      page: () => HomeView(),
      binding: BindingsBuilder.put(
        () => HomeController(),
      ),
    ),
    GetPage(
      title: 'Aathichudi',
      name: aathichidiListRoute,
      page: () => AathichudiListView(),
      binding: BindingsBuilder(
        () => Get.create(
          () => LibraryController(
            repository: FireRepository(
              apiClient: FireApiClient(firestore: FirebaseFirestore.instance),
            ),
          ),
        ),
      ),
      parameter: {"type": "kural"},
    ),
    GetPage(
      title: 'Kurals',
      name: kuralsListRoute,
      page: () => KuralsListView(),
      binding: BindingsBuilder(
        () => Get.create(
          () => LibraryController(
            repository: FireRepository(
              apiClient: FireApiClient(firestore: FirebaseFirestore.instance),
            ),
          ),
        ),
      ),
      parameter: {"type": "kural"},
    ),
    GetPage(
      title: 'Admin',
      name: adminRoute,
      page: () => AdminView(),
      binding: BindingsBuilder(
        () => Get.lazyPut<AdminController>(
          () => AdminController(
            repository: FireRepository(
              apiClient: FireApiClient(firestore: FirebaseFirestore.instance),
            ),
          ),
        ),
      ),
    ),
  ];
}
