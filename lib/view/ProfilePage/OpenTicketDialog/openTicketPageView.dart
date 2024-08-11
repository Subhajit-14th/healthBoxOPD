import 'package:flutter/material.dart';
import 'package:health_box_opd/widgets/commonButton.dart';
import 'package:health_box_opd/widgets/commonTextField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class OpenTicketsDialogPageView extends StatefulWidget {
  OpenTicketsDialogPageView({super.key, required this.details});

  Function(String) details;

  @override
  State<OpenTicketsDialogPageView> createState() =>
      _OpenTicketsDialogPageViewState();
}

class _OpenTicketsDialogPageViewState extends State<OpenTicketsDialogPageView> {
  final TextEditingController _describeIssueController =
      TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String _uploadIssueImage = 'No file chosen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        child: Container(
          // height: MediaQuery.of(context).size.height / 1.8,
          width: MediaQuery.of(context).size.width / 1.120,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Heading and Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Open a New Ticket',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Divider(),
              const SizedBox(height: 16),

              /// Issue textField
              Container(
                width: double.infinity,
                // height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: CommonTextField(
                  maxLines: 4,
                  textEditingController: _describeIssueController,
                  fillColor: Colors.white,
                  labeltext: 'Describe your issue in short...',
                  passwordVisible: false,
                  isPassField: false,
                  onClickButton: (val) {},
                ),
              ),
              const SizedBox(height: 16),

              /// Upload Issue Image
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
                        _pickImage();
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
                      _uploadIssueImage,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// Close Submit Buttons
              Row(
                children: [
                  CommonButton(
                    width: 100,
                    buttonText: 'Close',
                    onPressed: () {},
                    color: Colors.grey,
                    height: 45,
                  ),
                  const SizedBox(width: 10),
                  CommonButton(
                    width: 100,
                    buttonText: 'Submit',
                    onPressed: () {
                      widget.details(_describeIssueController.text);
                      Navigator.pop(context);
                    },
                    color: const Color(0xFF09e5ab),
                    height: 45,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Image Picker
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      debugPrint('My image path is: ${image.path}');

      setState(() {
        _uploadIssueImage = image.path;
        // _uploadProfileImage = fileName;
        _uploadIssueImage = path.basename(_uploadIssueImage);
      });
      print('Image Path: $_uploadIssueImage');
    }
  }
}
