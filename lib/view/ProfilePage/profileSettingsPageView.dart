import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:health_box_opd/utils/appColor.dart';
import 'package:health_box_opd/widgets/commonButton.dart';
import 'package:health_box_opd/widgets/commonTextField.dart';
import 'package:intl/intl.dart';

class ProfileSettingsPageView extends StatefulWidget {
  const ProfileSettingsPageView({super.key});

  @override
  State<ProfileSettingsPageView> createState() =>
      _ProfileSettingsPageViewState();
}

class _ProfileSettingsPageViewState extends State<ProfileSettingsPageView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  // Sample list of specialities
  final List<String> _bloodGroup = [
    'A-',
    'A+',
    'B-',
    'B+',
    'AB-',
    'AB+',
    'O-',
    'O+',
  ];

  // Gender list
  final List<String> _genderList = ['Male', 'Female', 'Trans Gender'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Profile Image change
          Row(
            children: [
              Image.asset(
                'assets/womendoctorOne.png',
                height: 80,
                width: 120,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      // width: 240,
                      decoration: BoxDecoration(
                          color: AppColor.appThemeColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.transparent,
                          )),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            splashFactory: NoSplash.splashFactory,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload,
                                color: Colors.white,
                              ),
                              Text(
                                'Change Photo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Urbanist-Bold',
                                  fontWeight: FontWeight.w700,
                                  // height: 0.09,
                                  // letterSpacing: 0.20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Allowed JPG, GIF or PNG.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// Full Name
          const Text(
            'Full Name',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.grey.withOpacity(.4),
              ),
            ),
            child: CommonTextField(
              textEditingController: _fullNameController,
              fillColor: Colors.transparent,
              labeltext: 'Enter your name',
              onClickButton: (val) {},
            ),
          ),

          /// Email Id
          const Text(
            'Email ID',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.grey.withOpacity(.4),
              ),
            ),
            child: CommonTextField(
              textEditingController: _emailIdController,
              fillColor: Colors.transparent,
              labeltext: 'Enter email',
              onClickButton: (val) {},
            ),
          ),

          /// Date of Birth
          const Text(
            'Date of Birth',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            padding: const EdgeInsets.only(left: 14),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.withOpacity(.4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedDate,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _pickDate(context);
                  },
                  icon: const Icon(
                    Icons.date_range_rounded,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          /// Blood Group
          const Text(
            'Blood Group',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            // width: getScreenWidth(context) / 1.35,
            height: 45,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.withOpacity(.4),
              ),
            ),
            child: TypeAheadField<String>(
              controller: _bloodGroupController,
              builder: (context, controller, focusNode) {
                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 14),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.5,
                      ),
                    ),
                    labelText: 'Select blood group',
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                );
              },
              suggestionsCallback: (pattern) {
                return _bloodGroup
                    .where((speciality) => speciality
                        .toLowerCase()
                        .contains(pattern.toLowerCase()))
                    .toList();
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(
                    suggestion,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
              hideOnEmpty: true,
              hideOnError: true,
              onSelected: (String value) {
                _bloodGroupController.text = value;
              },
            ),
          ),

          /// Gender
          const Text(
            'Gender',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            // width: getScreenWidth(context) / 1.35,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.withOpacity(.4),
              ),
            ),
            child: TypeAheadField<String>(
              controller: _genderController,
              builder: (context, controller, focusNode) {
                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 14),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.5,
                      ),
                    ),
                    labelText: 'Select blood group',
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                );
              },
              suggestionsCallback: (pattern) {
                return _genderList
                    .where((speciality) => speciality
                        .toLowerCase()
                        .contains(pattern.toLowerCase()))
                    .toList();
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(
                    suggestion,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
              hideOnEmpty: true,
              hideOnError: true,
              onSelected: (String value) {
                _genderController.text = value;
              },
            ),
          ),

          /// Mobile
          const Text(
            'Mobile',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.grey.withOpacity(.4),
              ),
            ),
            child: CommonTextField(
              textEditingController: _mobileController,
              fillColor: Colors.transparent,
              labeltext: 'Enter phone',
              onClickButton: (val) {},
            ),
          ),

          /// Save Changes
          CommonButton(
            buttonText: 'Save Changes',
            width: 180,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  /// Date picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectedDate = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }
}
