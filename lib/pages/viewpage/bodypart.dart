import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'package:rentapp/common/commonbutton.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/pages/detailscreen/detailspage.dart';

import 'package:rentapp/pages/filldetailspage/fillpropertydetails.dart';

class BodyPart extends StatefulWidget {
  const BodyPart({super.key});

  @override
  State<BodyPart> createState() => _BodyPartState();
}

class _BodyPartState extends State<BodyPart> {
  late Box<Property> box;

  @override
  void initState() {
    box = Hive.box('property');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: GridView.builder(
                  itemCount: provider.isSelected.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: CustomButton(
                          shadowColor: Colors.black,
                          onTap: () {
                            log('index at show dialog: $index');
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Your space is Empty'),
                                    content: const Text(
                                        'Do you want to add details?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancel')),
                                      TextButton(
                                        onPressed: () {
                                          log('First page before false: $index');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FillPropertyDetails(
                                                          getindex: index)));
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                });
                            if (provider.isSelected[index] == true &&
                                index == provider.property[index].index) {
                              log('First page true: $index');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          getdetails: provider.getDetails(
                                              provider
                                                  .property[index].index))));
                            }
                          },
                          text: (index + 1).toString(),
                          textColor: provider.isSelected[index] == true
                              ? Colors.white
                              : Colors.black,
                          color: provider.atIndex(index) == null
                              ? Colors.white
                              : provider.atIndex(index)!.status == 'empty'
                                  ? Colors.red
                                  : Colors.blue,
                          //     tables.elementAt(index).statusName == 'empty'
                          //         ? Colors.black
                          //         : Colors.white,
                          // color: tables.elementAt(index).statusName == 'paid'
                          //     ? const Color(0xFF3abd40)
                          //     : tables.elementAt(index).statusName == 'unpaid'
                          //         ? const Color(0xFFef4646)
                          //         : tables.elementAt(index).statusName ==
                          //                 'empty'
                          //             ? Colors.white
                          //             : Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
