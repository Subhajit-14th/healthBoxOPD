import 'package:flutter/material.dart';
import 'package:health_box_opd/widgets/commonButton.dart';
import 'package:health_box_opd/models/openTicketsModel.dart';
import 'package:health_box_opd/view/ProfilePage/OpenTicketDialog/openTicketPageView.dart';
import 'package:intl/intl.dart';

class ProfileSupportsPageView extends StatefulWidget {
  const ProfileSupportsPageView({super.key});

  @override
  State<ProfileSupportsPageView> createState() =>
      _ProfileSupportsPageViewState();
}

class _ProfileSupportsPageViewState extends State<ProfileSupportsPageView> {
  List<OpenTicketsModel> openTicketsList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Ticket Raise Row
          Row(
            children: [
              const Text(
                'Tickets',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.2),
              Expanded(
                child: CommonButton(
                  height: 40,
                  buttonText: 'Open New Tickets',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return OpenTicketsDialogPageView(
                          details: (details) {
                            openTicketsList.add(
                              OpenTicketsModel(
                                  details: details,
                                  openedOn: formatDate(DateTime.now()),
                                  lastUpdated: lastUpdatedFormatDateTime(
                                      DateTime.now())),
                            );
                            setState(() {});
                          },
                        );
                      },
                    );
                  },
                  color: const Color(0xFF09e5ab),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// Tickets Details
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '#',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                const Text(
                  'Opened On',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                const Text(
                  'Last Updated',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              itemCount: openTicketsList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                      Text(
                        openTicketsList[index].details,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                      Text(
                        openTicketsList[index].openedOn,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                      Text(
                        openTicketsList[index].lastUpdated,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    final daySuffix = _getDayOfMonthSuffix(date.day);
    final formattedDay = '${date.day}$daySuffix';
    final dateFormat = DateFormat('MMMM yyyy');
    return '$formattedDay ${dateFormat.format(date)}';
  }

  String lastUpdatedFormatDateTime(DateTime dateTime) {
    final daySuffix = _getDayOfMonthSuffix(dateTime.day);
    final formattedDay = '${dateTime.day}$daySuffix';
    final dateFormat = DateFormat('MMMM yyyy h:mm:ss a');
    return '$formattedDay ${dateFormat.format(dateTime)}';
  }

  String _getDayOfMonthSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
