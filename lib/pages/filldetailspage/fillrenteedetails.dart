import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';
import 'package:rentapp/route/route.dart' as route;

class FillRenteeDetails extends StatefulWidget {
  Property getDetails;
  FillRenteeDetails({Key? key, required this.getDetails}) : super(key: key);

  @override
  State<FillRenteeDetails> createState() => _FillRenteeDetailsState();
}

class _FillRenteeDetailsState extends State<FillRenteeDetails> {
  final TextEditingController _renteeName = TextEditingController();
  final TextEditingController _renteeContact = TextEditingController();
  final TextEditingController _renteeEmail = TextEditingController();
  final TextEditingController _renteebusinessdetails = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill Property Details'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _renteeName,
            decoration: const InputDecoration(
              hintText: 'Rentee Name',
            ),
          ),
          TextFormField(
            controller: _renteeEmail,
            decoration: const InputDecoration(
              hintText: 'Rentee Email',
            ),
          ),
          TextFormField(
            controller: _renteeContact,
            decoration: const InputDecoration(
              hintText: 'Rentee Contact',
            ),
          ),
          TextFormField(
            controller: _renteebusinessdetails,
            decoration: const InputDecoration(
              hintText: 'Rentee business details',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final property = Property(
                propertyId: widget.getDetails.propertyId,
                name: widget.getDetails.name,
                price: widget.getDetails.price,
                address: widget.getDetails.address,
                size: widget.getDetails.size,
                index: widget.getDetails.index,
                rentee: Rentee(
                  renteeId: widget.getDetails.rentee.renteeId,
                  renteeName: _renteeName.text,
                  renteeEmail: _renteeEmail.text,
                  renteeContact: _renteeContact.text,
                  businessdetail: _renteebusinessdetails.text,
                  agreementimage: '',
                  citizenimage: '',
                ),
                description: '',
                image: '',
                status: '',
              );

              provider.addProperty(property);
              Navigator.pushNamed(context, route.RouteManager.home);
            },
            child: const Text('Save'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, route.RouteManager.home);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
