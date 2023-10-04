import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return //Container(
        //color: colors.primary,
        SafeArea(
      bottom: false,
      child: Padding(
        //padding: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 45),
        //child: Container(
        //color: colors.secondary,
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 10),
              Text('Cinemapedia', style: titleStyle),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
        ),
      ),
    );
    //);
    //);
  }
}
