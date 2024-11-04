import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ministry_health/features/register_screen/presentation/view/widgets/custom_text_field.dart';

class PassTextfield extends StatefulWidget {
  const PassTextfield({super.key, required this.hintText});
  final String hintText;

  @override
  State<PassTextfield> createState() => _PassTextfieldState();
}
bool visible = true;
class _PassTextfieldState extends State<PassTextfield> {
  @override
  Widget build(BuildContext context) {
    return   Customtextfield(
                    suffixIcon: GestureDetector(
                      onTap:() {
                        setState(() {
                          visible=!visible;
                        });
                      } ,
                    child: visible? const Icon(FontAwesomeIcons.eye):const Icon(FontAwesomeIcons.eyeSlash),) ,
                    prefixIcon: Icons.password,
                    hintText: widget.hintText, borderColor:Colors.blue, obscure: visible);
  }
}