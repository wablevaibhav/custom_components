import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Components'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              const CustomTextInput(
                  hintText: "Enter Value",
                  labelText: "Value",
                  prefixIcon: Icon(Icons.person),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
              const Gap(20),
              const CustomSearchDropdown(
                items: [
                  "Item 1",
                  "Item 2",
                  "Item 3",
                  "Item 4",
                  "Item 5",
                ],
                showSearchBox: false,
                isMenu: true,
                title: "Select Item",
              ),
              const Gap(20),
              CustomElevatedButton(
                onPressed: () {},
                title: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
