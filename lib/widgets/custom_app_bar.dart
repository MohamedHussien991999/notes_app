import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 2,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(
          flex: 1,
        ),
        BlocConsumer<NotesCubit, NotesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SizedBox(
              height: 45,
              width: 45,
              child: Switch(
                value: BlocProvider.of<NotesCubit>(context).isDark,
                activeColor: Colors.green,
                onChanged: (bool value) {
                  BlocProvider.of<NotesCubit>(context).changeThem(value);
                },
              ),
            );
          },
        ),
        CustomIcon(
          icon: icon,
          onPressed: onPressed,
        
        ),
      ],
    );
  }
}
