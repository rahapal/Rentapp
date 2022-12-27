import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/model/property.dart';

import '../../controller/provider.dart';
import '../filldetailspage/fillrenteedetails.dart';

class UserDetail extends StatefulWidget {
  Property getdetails;
  UserDetail({super.key, required this.getdetails});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.getdetails.rentee.renteeName.isEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FillRenteeDetails(getDetails: widget.getdetails),
            ),
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 25,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(35),
                      child: Image.asset(
                        'assets/userface.png',
                        // height: 58,
                        // width: 58,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.getdetails.rentee.renteeName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.getdetails.rentee.renteeContact,
                        style: const TextStyle(
                          color: Color(0xFF9f9f9f),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              PhysicalModel(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                elevation: 5.0,
                shadowColor: const Color(0xFF69AC65),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF69AC65),
                  ),
                  child: IconButton(
                    onPressed: () {
                      //show details name which is at index 0
                      //print(Rbox.getAt(0)!.name);
                    },
                    icon: const Icon(
                      Icons.message_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
