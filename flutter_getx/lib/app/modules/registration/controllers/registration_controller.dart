import 'package:get/get.dart';

class RegistrationController extends GetxController {
  // Form fields - set default values
  final selectedTitle = 'นาย'.obs;
  final firstName = 'จิรายุส'.obs;
  final lastName = 'อาบทิ้ง'.obs;
  final phone = '081 234 5678'.obs;
  final birthDate = DateTime(2025, 1, 1).obs;

  // Title options
  final titleOptions = ['นาย', 'นาง', 'นางสาว'];

  @override
  void onInit() {
    super.onInit();
    // Initialize with default values
  }

  void setTitle(String? value) {
    if (value != null) {
      selectedTitle.value = value;
    }
  }

  void setFirstName(String value) => firstName.value = value;
  void setLastName(String value) => lastName.value = value;
  void setPhone(String value) => phone.value = value;
  void setBirthDate(DateTime date) => birthDate.value = date;

  String get formattedBirthDate {
    final d = birthDate.value;
    return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
  }

  String get fullName => '${selectedTitle.value}${firstName.value} ${lastName.value}';

  void saveRegistration() {
    // Navigate to profile page with user data
    Get.toNamed('/profile', arguments: {
      'fullName': fullName,
      'title': selectedTitle.value,
      'firstName': firstName.value,
      'lastName': lastName.value,
      'phone': phone.value,
      'birthDate': birthDate.value,
    });
  }
}
