import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/common/global_variables.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/payment.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';
import 'package:rentapp/route/route.dart' as route;
import 'package:uuid/uuid.dart';

class FillPropertyDetails extends StatefulWidget {
  final int getindex;
  const FillPropertyDetails({Key? key, required this.getindex})
      : super(key: key);

  @override
  State<FillPropertyDetails> createState() => _FillPropertyDetailsState();
}

class _FillPropertyDetailsState extends State<FillPropertyDetails> {
  TextEditingController _propertyName = TextEditingController();
  TextEditingController _propertyAddress = TextEditingController();
  TextEditingController _propertySize = TextEditingController();
  TextEditingController _propertyDescription = TextEditingController();
  TextEditingController _propertyPrice = TextEditingController();
  TextEditingController _propertyAdvanceDeposit = TextEditingController();
  TextEditingController _agreementDateStart = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        title: const Text('Fill Property Details'),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
            left: 16,
            top: 8,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFFE0E5FF),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: IconButton(
                color: const Color(0xFFBDC1FF),
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pushNamed(context, route.RouteManager.home);
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Add Properties',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/home.png',
                    height: 23,
                  ),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Property Name',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _propertyName,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: GlobalVariables.textFieldbackgroundColor,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      hintText: 'Enter property name',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: GlobalVariables.textFieldborderColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Location',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _propertyAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: GlobalVariables.textFieldbackgroundColor,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      hintText: 'Enter property location',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: GlobalVariables.textFieldborderColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 135,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Size',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          textAlign: TextAlign.end,
                          controller: _propertySize,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: GlobalVariables.textFieldbackgroundColor,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintText: '/sq.ft',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: GlobalVariables.textFieldborderColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 135,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rent Cost',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: _propertyPrice,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: GlobalVariables.textFieldbackgroundColor,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: GlobalVariables.textFieldborderColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _propertyDescription,
                    minLines: 5,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: GlobalVariables.textFieldbackgroundColor,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: GlobalVariables.textFieldborderColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Agreement date start',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.none,
                          textAlign: TextAlign.start,
                          controller: _agreementDateStart,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: GlobalVariables.textFieldbackgroundColor,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            prefixIcon: const Icon(Icons.calendar_today),
                            hintText: 'Select date',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: GlobalVariables.textFieldborderColor,
                              ),
                            ),
                          ),
                          onTap: () async {
                            //helps to disable keyboard
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            if (date != null) {
                              setState(() {
                                _agreementDateStart.text =
                                    DateTime(date.year, date.month, date.day)
                                        .toString()
                                        .substring(0, 10);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Advance deposit',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: _propertyPrice,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: GlobalVariables.textFieldbackgroundColor,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: GlobalVariables.textFieldborderColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  provider.addProperty(
                    Property(
                      propertyName: _propertyName.text,
                      address: _propertyAddress.text,
                      description: _propertyDescription.text,
                      price: int.parse(_propertyPrice.text),
                      image: '',
                      size: _propertySize.text,
                      //yesai ho herna test garns cha
                      status: 'paid',
                      index: widget.getindex,
                      propertyId: const Uuid().v4(),
                      fieldStatus: true,
                      rentee: Rentee(
                          renteeId: const Uuid().v4(),
                          agreementimage: '',
                          businessdetail: '',
                          citizenimage: '',
                          renteeContact: '',
                          renteeEmail: '',
                          renteeName: '',
                          renteePayment: Payment(
                              paymentId: const Uuid().v4(),
                              paymentNote: '',
                              paymentDate: null)),
                    ),
                  );
                  print('Index at fill : ${widget.getindex}');
                  Navigator.pushNamed(context, route.RouteManager.home);
                  // provider.setboolVal(widget.getindex).then(
                  //       (value) => provider.getboolVal(),
                  //     );

                  //provider.getIndexTrue(widget.getindex);
                },
                child: const Text('Upload details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
