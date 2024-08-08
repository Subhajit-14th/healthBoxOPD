/*
import 'package:flutter/material.dart';

class CommonDocumentViewer extends StatefulWidget {
  const CommonDocumentViewer(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLines,
      required this.labelName,
      this.contentPaddingLeft,
      this.contentPaddingRight,
      this.contentPaddingTop,
      this.contentPaddingBottom,
      this.labelNameTextSize});

  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final String labelName;
  final double? contentPaddingLeft;
  final double? contentPaddingRight;
  final double? contentPaddingTop;
  final double? contentPaddingBottom;
  final double? labelNameTextSize;

  @override
  State<CommonDocumentViewer> createState() => _CommonDocumentViewerState();
}

class _CommonDocumentViewerState extends State<CommonDocumentViewer> {
  String _filePath = '';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelName,
          style: TextStyle(
            color: theme.colorScheme.secondaryContainer,
            fontSize: widget.labelNameTextSize ?? 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 3),
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: widget.maxLines ?? 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  left: widget.contentPaddingLeft ?? 12,
                  right: widget.contentPaddingRight ?? 0,
                  top: widget.contentPaddingTop ?? 0,
                  bottom: widget.contentPaddingBottom ?? 0),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: theme.textTheme.labelSmall?.color,
                fontSize: theme.textTheme.labelMedium?.fontSize,
                fontWeight: theme.textTheme.labelSmall?.fontWeight,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: _filePath.isEmpty
                  ? InkWell(
                      onTap: () async {
                        debugPrint('---- Picked File');
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                        );
                        if (result != null) {
                          final filePath = result.files.first;
                          setState(() {
                            _filePath = filePath.path!;
                            // You can also update the text field with the selected file path
                            widget.controller.text = _filePath;
                          });
                          debugPrint('---- File path: $_filePath');
                          final newFile = await saveFilePermanently(filePath);
                          debugPrint('---- New File path: ${newFile.path}');
                        }
                      },
                      child: Container(
                        width: 60,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        decoration: const BoxDecoration(
                            color: Color(0xFF1921C4),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0))),
                        child: const Text(
                          'Browse',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () async {
                        debugPrint('---- Open File');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PDFViewer(filePath: _filePath)),
                        );
                      },
                      child: Container(
                        width: 40,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        decoration: const BoxDecoration(
                            color: Color(0xFF1921C4),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0))),
                        child: const Text(
                          'Open',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await provider.getExternalStorageDirectory();
    debugPrint('---- AppStorage: $appStorage');
    final newFile = File('${appStorage?.path}/${file.path}');
    return File(file.path!).copy(newFile.path);
  }
}
*/
