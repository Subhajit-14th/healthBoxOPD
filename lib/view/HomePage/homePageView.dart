import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_box_opd/Common/appColor.dart';
import 'package:health_box_opd/Common/commonFun.dart';
import 'package:health_box_opd/Widgets/commonButton.dart';
import 'package:health_box_opd/Widgets/commonTextField.dart';
import 'package:health_box_opd/Widgets/specialitiesWidget.dart';
import 'package:health_box_opd/Widgets/topDoctorWidget.dart';
import 'package:health_box_opd/model/topDoctorDummyModel.dart';
import 'package:health_box_opd/view/SearchPage/searchPageView.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  List<String> names = ['HeartBeat', 'Dental-care', 'kidneys', 'Neurology'];
  List<TopDoctorModel> doctorDetails = [
    TopDoctorModel(
      image:
      'https://media.istockphoto.com/id/177373093/photo/indian-male-doctor.jpg?s=612x612&w=0&k=20&c=5FkfKdCYERkAg65cQtdqeO_D0JMv6vrEdPw3mX1Lkfg=',
      doctorName: 'Darren Elder',
      doctorSpecialist: 'Surgery',
      rating: '4.0',
      openTime: '10:00 AM',
      closeTime: '5:00 PM',
    ),
    TopDoctorModel(
      image:
      'https://i.pinimg.com/736x/b9/97/a5/b997a530822d0f2c03259070d4590d45.jpg',
      doctorName: 'Ruby Perrin',
      doctorSpecialist: 'Cardiologist',
      rating: '5.0',
      openTime: '10:00 AM',
      closeTime: '5:00 PM',
    ),
    TopDoctorModel(
      image:
      'https://t3.ftcdn.net/jpg/06/48/69/42/360_F_648694278_haC94bdL26EedqLMIbMpLACqzxwuvq4f.jpg',
      doctorName: 'Deborah Angle',
      doctorSpecialist: 'Cardiologist',
      rating: '3.5',
      openTime: '10:00 AM',
      closeTime: '5:00 PM',
    ),
  ];
  bool deptCheckbox = false;

  String selected = "";
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Neurologist",
    },
    {
      "id": 1,
      "value": false,
      "title": "Cardiology",
    },
    {
      "id": 2,
      "value": false,
      "title": "Gynaecology",
    },
    {
      "id": 3,
      "value": false,
      "title": "General Physician",
    },
    {
      "id": 4,
      "value": false,
      "title": "Gastroentrology",
    },
    {
      "id": 5,
      "value": false,
      "title": "Sexology",
    },
    {
      "id": 6,
      "value": false,
      "title": "Pediatricks",
    },
    {
      "id": 7,
      "value": false,
      "title": "ENT",
    },
    {
      "id": 8,
      "value": false,
      "title": "Urology",
    },
    {
      "id": 9,
      "value": false,
      "title": "Orthopedics",
    },
    {
      "id": 10,
      "value": false,
      "title": "Proctology",
    },
  ];

  final TextEditingController _doctorSearchController = TextEditingController();
  final TextEditingController _departmentSearchController = TextEditingController();
  final TextEditingController _selectSpecialitySearchController =
  TextEditingController();

  // Sample list of specialities
  final List<String> _specialities = [
    'Cardiology',
    'Dermatology',
    'Endocrinology',
    'Gastroenterology',
    'Neurology',
    'Oncology',
    'Pediatrics',
    'Psychiatry',
    'Radiology',
    'Surgery'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.appThemeColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Custom AppBar
            AnimatedContainer(
              // padding: const EdgeInsets.only(bottom: 18),
              duration: const Duration(seconds: 3),
              decoration: BoxDecoration(
                color: AppColor.appThemeColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Healthbox OPD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Image.network(
                        'https://healthboxopd.com/banner_images/1715863957Blue%20and%20White%20Modern%20Medical%20Facebook%20Fundraiser%20Cover%20Photo(12).png',
                        height: 280,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 14, right: 14, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// Location Search field
                            Container(
                              // width: getScreenWidth(context) / 1.35,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CommonTextField(
                                textEditingController: _doctorSearchController,
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search_rounded,
                                  ),
                                ),
                                labeltext: 'Search Location',
                                onClickButton: (val) {},
                              ),
                            ),
                            const Text(
                              'Based on your Location',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),

                            /// Department search field
                            Container(
                              // width: getScreenWidth(context) / 1.35,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CommonTextField(
                                textEditingController:
                                _departmentSearchController,
                                labeltext: 'Department',
                                onClickButton: (val) {},
                              ),
                            ),
                            const SizedBox(height: 6),

                            /// select speciality field
                            Container(
                              // width: getScreenWidth(context) / 1.35,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TypeAheadField<String>(
                                controller: _selectSpecialitySearchController,
                                builder: (context, controller, focusNode) {
                                  return TextFormField(
                                    controller: controller,
                                    focusNode: focusNode,
                                    obscureText: false,
                                    textAlign: TextAlign.left,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      contentPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 14),
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
                                      labelText: 'Select Speciality',
                                      labelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                                    ),
                                  );
                                },
                                suggestionsCallback: (pattern) {
                                  return _specialities
                                      .where((speciality) =>
                                      speciality
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
                                  _selectSpecialitySearchController.text =
                                      value;
                                },
                              ),
                              /*CommonTextField(
                                textEditingController:
                                _selectSpecialitySearchController,
                                labeltext: 'Select Speciality',
                              ),*/
                            ),
                            const Text(
                              'Select speciality',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),

                            /// Search Button
                            const SizedBox(height: 10),
                            CommonButton(
                              buttonText: 'Search',
                              onPressed: () {
                                if (_doctorSearchController.text != "" &&
                                    _selectSpecialitySearchController.text.isNotEmpty) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SearchPageView(
                                              placeName:
                                              _doctorSearchController.text,
                                              specialist: _selectSpecialitySearchController.text,
                                            ),
                                      ));
                                } else {
                                  var snackBar = const SnackBar(
                                      content:
                                      Text('Please select specialist'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Specialities row
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Specialities',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: AppColor.appThemeColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            /// Specialities Listview Row
            SizedBox(
              height: 130,
              width: getScreenWidth(context),
              child: ListView.builder(
                itemCount: names.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SpecialititesWidget(
                    name: names[index],
                  );
                },
              ),
            ),

            /// Top Doctor row
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Doctor',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: AppColor.appThemeColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            /// Top Doctor Listview Row
            SizedBox(
              height: getScreenHeight(context) * 0.3,
              child: ListView.builder(
                itemCount: doctorDetails.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
                itemBuilder: (context, index) {
                  return TopDoctorWidget(
                    doctorImage: doctorDetails[index].image,
                    doctorName: doctorDetails[index].doctorName,
                    doctorSpecialist: doctorDetails[index].doctorSpecialist,
                    rating: doctorDetails[index].rating,
                    openTime: doctorDetails[index].openTime,
                    closeTime: doctorDetails[index].closeTime,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
