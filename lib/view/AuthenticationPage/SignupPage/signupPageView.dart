import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_box_opd/Common/appColor.dart';
import 'package:health_box_opd/Common/commonFun.dart';
import 'package:health_box_opd/Widgets/commonButton.dart';
import 'package:health_box_opd/Widgets/commonTextField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SingupPageView extends StatefulWidget {
  const SingupPageView({super.key});

  @override
  State<SingupPageView> createState() => _SingupPageViewState();
}

class _SingupPageViewState extends State<SingupPageView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);

  String selectedDate = 'Date of Brith';

  final ImagePicker _picker = ImagePicker();
  String _uploadProfileImage = 'No file chosen';
  String _uploadAdharPanImage = 'No file chosen';
  final String _imageName = '';

  static const platform = MethodChannel('com.healthbox.opd/path');

  // DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// App icon
                Center(
                  child: Image.asset(
                    'assets/healthboxOPD.png',
                    height: 80,
                  ),
                ),
                const SizedBox(height: 24),

                /// Registration text
                const Text(
                  'Registration',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                /// Registration sub text
                const Text(
                  'Welcome to our digital health service',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 16),

                /// Email textfield
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CommonTextField(
                    textEditingController: _emailController,
                    fillColor: Colors.grey.withOpacity(.1),
                    labeltext: 'Enter Email',
                    onClickButton: (val) {},
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.03),

                /// Password textfield
                ValueListenableBuilder<bool>(
                  valueListenable: isPasswordVisible,
                  builder: (context, value, child) {
                    return Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CommonTextField(
                        textEditingController: _passwordController,
                        fillColor: Colors.grey.withOpacity(.1),
                        labeltext: 'Enter Password',
                        passwordVisible: true,
                        isPassField: true,
                        isPassIconChange: isPasswordVisible.value,
                        onClickButton: (val) {
                          isPasswordVisible.value = val;
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: getScreenHeight(context) * 0.03),

                /// Name textfield
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CommonTextField(
                    textEditingController: _nameController,
                    fillColor: Colors.grey.withOpacity(.1),
                    labeltext: 'Enter Name',
                    onClickButton: (val) {},
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.03),

                /// Phone number textfield
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CommonTextField(
                    textEditingController: _phoneNumberController,
                    fillColor: Colors.grey.withOpacity(.1),
                    labeltext: 'Enter Phone Number',
                    onClickButton: (val) {},
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.03),

                /// Blood textfield
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CommonTextField(
                    textEditingController: _bloodGroupController,
                    fillColor: Colors.grey.withOpacity(.1),
                    labeltext: 'Select Your Blood Group',
                    onClickButton: (val) {},
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.03),

                /// Gender textfield
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CommonTextField(
                    textEditingController: _genderController,
                    fillColor: Colors.grey.withOpacity(.1),
                    labeltext: 'Select Your Gender',
                    onClickButton: (val) {},
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.03),

                /// Date of birth
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        selectedDate,
                        style: TextStyle(
                          color: selectedDate == "Date of Brith"
                              ? Colors.grey
                              : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _pickDate(context);
                        },
                        icon: const Icon(
                          Icons.date_range_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.03),

                /// Upload Profile Image
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.8,
                    ),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _pickImage('Profile');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 14),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.4),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Choose File',
                          ),
                        ),
                      ),
                      Text(
                        _uploadProfileImage,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text('Upload Profile Image'),
                SizedBox(height: getScreenHeight(context) * 0.03),

                /// Upload Adhar/PAN Image
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.8,
                    ),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _pickImage('AdharPAN');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 14),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.4),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Choose File',
                          ),
                        ),
                      ),
                      Text(
                        _uploadAdharPanImage,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text('Adhar/PAN'),
                SizedBox(height: getScreenHeight(context) * 0.03),

                /// Sign Up Button
                CommonButton(
                  buttonText: 'Sign Up',
                  onPressed: () {},
                  height: 45,
                ),
                SizedBox(height: getScreenHeight(context) * 0.04),

                /// Already have an account text & etc,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.appThemeColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Date picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1985),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectedDate = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  /// Image Picker
  Future<void> _pickImage(String isProfileOrAdharPan) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      debugPrint('My image path is: ${image.path}');
      String fileName = await _getFileName(image.path);
      if (isProfileOrAdharPan == 'Profile') {
        setState(() {
          _uploadProfileImage = image.path;
          _uploadProfileImage = fileName;
          // _uploadProfileImage = path.basename(_uploadProfileImage);
        });
      } else {
        setState(() {
          _uploadAdharPanImage = image.path;
          _uploadAdharPanImage = fileName;
          // _uploadAdharPanImage = path.basename(_uploadAdharPanImage);
        });
      }
      print('Image Path: $_uploadProfileImage');
    }
  }

  /// Method channel for get original image name
  Future<String> _getFileName(String filePath) async {
    try {
      final String fileName =
          await platform.invokeMethod('getFileName', {"path": filePath});
      debugPrint('My image file path is: $fileName');
      return fileName;
    } on PlatformException catch (e) {
      print("Failed to get file name: '${e.message}'.");
      return "Unknown";
    }
  }
}
