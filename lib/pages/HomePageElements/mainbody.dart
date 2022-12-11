import 'package:flutter/material.dart';

import 'bodypart.dart';

class mainbody extends StatefulWidget {
  const mainbody({super.key});

  @override
  State<mainbody> createState() => _mainbodyState();
}

class _mainbodyState extends State<mainbody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(
        //   height: 25,
        // ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20.0,
            left: 20,
            top: 80,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: PhysicalModel(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 7),
                        hintText: "Search",
                        hintStyle: const TextStyle(color: Color(0xFF9F9F9F)),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFF9F9F9F),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.13),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.13),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.13),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              PhysicalModel(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFF5B67FE),
                elevation: 5.0,
                shadowColor: const Color(0xFF5B67FE),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF5B67FE),
                  ),
                  height: 40,
                  width: 40,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.tune,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const bodypart(),
      ],
    );
  }
}
