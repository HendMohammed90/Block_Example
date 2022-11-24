import 'package:breaking_project/constats.dart';
import 'package:breaking_project/presintation/wedgites/characterCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/character_cubit.dart';
import '../../data/models/character.dart';

class CharcterScreen extends StatefulWidget {
  @override
  State<CharcterScreen> createState() => _CharcterScreenState();
}

class _CharcterScreenState extends State<CharcterScreen> {
  late List<Character> allCharacters;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacter();
  }

  Widget buildBlockWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
      if (state is CharacterLoaded) {
        allCharacters = (state).characterList;
        return buildLoadedListWidgets();
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Constants.KMaincolor,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
      itemBuilder: (ctx, index) {
        return CharacterItem(
          character: allCharacters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.KMainscolor,
        title: Text(
          'Bloc Example',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: buildBlockWidget(),
    );
  }
}
