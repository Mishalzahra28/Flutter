import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String title;
  final bool hideText;
  final Function setValue;
  const CustomTextField(
      {super.key,
      required this.setValue,
      required this.hideText,
      required this.hintText,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                  fontSize: 15.0,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 1.0),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Colors.indigo, width: 0.5, style: BorderStyle.solid),
            ),
          ),
          padding: const EdgeInsets.only(left: 0.0, right: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "This field is required*";
                    }
                    if (title == "EMAIL" && !value.contains("@")) {
                      return "Invalid email address*";
                    }
                    if (title == "PASSWORD" && value.length < 7) {
                      return "Password is too weak*";
                    }

                    return null;
                  },
                  onSaved: (value) {
                    setValue(value!.trim());
                  },
                  obscureText: hideText,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
