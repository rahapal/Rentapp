import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'package:rentapp/common/commonbutton.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/screens/detailscreen/detailspage.dart';

import 'package:rentapp/screens/filldetailspage/fillpropertydetails.dart';
import 'package:rentapp/screens/viewpage/bodytoppart.dart';

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
            const BodyTopPart(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child:
                    Consumer<PropertyProvider>(builder: (context, val, child) {
                  return GridView.builder(
                    itemCount: 30,
                    //val.isSelected.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                              if (context
                                      .read<PropertyProvider>()
                                      .atIndex(index) ==
                                  null) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Your space is Empty'),
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
                                                              getindex:
                                                                  index)));
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    });
                              }

                              if (val.property[index].fieldStatus == true &&
                                  index == val.property[index].index) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      getdetails: context
                                          .read<PropertyProvider>()
                                          .getDetails(context
                                              .read<PropertyProvider>()
                                              .property[index]
                                              .index),
                                    ),
                                  ),
                                );
                              }
                            },
                            text: (index + 1).toString(),
                            textColor:
                                // val.property[index].fieldStatus == true
                                //?
                                Colors.red,
                            //:
                            // Colors.blue,
                            color: val.atIndex(index) == null
                                ? Colors.white
                                : val.property[index].fieldStatus == true
                                    ? Colors.black
                                    : val.property[index].propertyId.isEmpty
                                        ? Colors.white
                                        : Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
