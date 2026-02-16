import 'package:get/get.dart';

class ProfileController extends GetxController {
  // User data from registration - use observable
  final fullName = 'นายจิรายุส อาบทิ้ง'.obs;
  
  // Selected status index
  final selectedStatus = 0.obs;
  
  // Selected tab index
  final selectedTabIndex = 0.obs;
  
  // Selected bottom nav index
  final bottomNavIndex = 2.obs;

  // Status/Highlights data with images
  final statusList = [
    {
      'emoji': '😊',
      'label': 'สถานที่ทำงาน',
      'image': 'https://picsum.photos/id/1076/400/200',
    },
    {
      'emoji': '🏀',
      'label': 'กีฬา',
      'image': 'https://picsum.photos/id/1058/400/200',
    },
    {
      'emoji': '👕',
      'label': 'การแต่งกาย',
      'image': 'https://picsum.photos/id/1021/400/200',
    },
  ];

  // People list data for "สถานที่ท่องเที่ยว" tab
  final travelPeopleList = [
    {
      'name': 'Filipa Gaspar',
      'description': "I'm Going to Shake Your\nHand Way Too Hard",
      'image': 'https://picsum.photos/id/1015/200',
    },
    {
      'name': 'Jeremías del Pozo',
      'description': "I'm Going to Shake Your\nHand Way Too Hard",
      'image': 'https://picsum.photos/id/1016/200',
    },
    {
      'name': 'Ngô Hải Giang',
      'description': "I'm Going to Shake Your\nHand Way Too Hard",
      'image': 'https://picsum.photos/id/1018/200',
    },
  ];

  // People list data for "ธรรมชาติ" tab
  final naturePeopleList = [
    {
      'name': 'Maria Santos',
      'description': "Nature lover exploring\nbeautiful landscapes",
      'image': 'https://picsum.photos/id/1035/200',
    },
    {
      'name': 'Sora Tanaka',
      'description': "Mountain hiking and\nforest adventures",
      'image': 'https://picsum.photos/id/1039/200',
    },
    {
      'name': 'Anna Müller',
      'description': "Wildlife photography\nand camping trips",
      'image': 'https://picsum.photos/id/1043/200',
    },
  ];

  // Get current people list based on selected tab
  List<Map<String, String>> get currentPeopleList {
    return selectedTabIndex.value == 0 ? travelPeopleList : naturePeopleList;
  }

  @override
  void onInit() {
    super.onInit();
    // Get user data from arguments
    final args = Get.arguments;
    if (args != null && args['fullName'] != null) {
      fullName.value = args['fullName'];
    }
  }

  void setSelectedStatus(int index) => selectedStatus.value = index;
  void setSelectedTab(int index) => selectedTabIndex.value = index;
  void setBottomNavIndex(int index) => bottomNavIndex.value = index;
}
