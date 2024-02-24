import 'package:flutter/material.dart';
import 'package:newsapi/setting/setting_section.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Initial Selected Value
  String languagevalue = "Arabic";
  String themevalue = "Light";

  // List of items in our dropdown menu
  var languagesitems = ["Arabic", "English"];
  var themesitems = ["Light", "Dark"];
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenHeight / 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration:  BoxDecoration(
              //color: Colors.green.shade100,
              color: const Color(0xFF66C649).withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(8),
            child: Text(

              "Settings",
              style: TextStyle(
                  fontSize: screenHeight / 35),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight / 30,
        ),
        SettingSection(
          title: 'theme',
          children: [
            ListTile(
              title: const Text("Themes"),
              trailing: DropdownButton(
                // Initial Value
                value: themevalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: themesitems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: TextStyle(
                          color: items == themevalue
                              ? const Color(0xFF66C649)
                              : Colors.black),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    themevalue = newValue!;
                  });
                },
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        SettingSection(
          title: 'language',
          children: [
            ListTile(
              title: const Text("Languages"),
              trailing: DropdownButton(
                // Initial Value
                value: languagevalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: languagesitems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: TextStyle(
                          color: items == languagevalue
                              ? const Color(0xFF66C649)
                              : Colors.black),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    languagevalue = newValue!;
                  });
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
