import 'package:blocs_provaider_list_consumer/bloc/cats_cubit.dart';
import 'package:blocs_provaider_list_consumer/bloc/cats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsCatView extends StatefulWidget {
  @override
  _BlocsCatViewState createState() => _BlocsCatViewState();
}

class _BlocsCatViewState extends State<BlocsCatView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatsCubit(),
      child: buidScaffold(),
    );
  }

  Scaffold buidScaffold() => Scaffold(

        appBar: AppBar(
          title: Text("Selam"),
        ),
        body: BlocConsumer<CatsCubit, CatsState>(

          listener: (context, state) {
            if(state is CatsError) {
              final snackBar = SnackBar(content: Text("hata meydana geldi"));

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            else if ( state is CatsCompleted) {
              final snackBar = SnackBar(content: Text("Giriş Yapıldı"));

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            else if ( state is CatsBack ) {
              final snackBar = SnackBar(content: Text("Geriye dönüldü"));

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          // ignore: missing_return
          builder: (context, state) {
            if (state is CatsInitial) {
              return Center(child: Column(
                children: [
                  Text("Giris yapıldı"),
                  buildFloatingActionButton(context),
                ],
              ),);
            }
            else if(state is CatsLoading){
              return CircularProgressIndicator();
            }
            else if(state is CatsCompleted){
              return buildListViewCats(state);
            }
            else {
              final error = state as CatsError;
              return Text(error.errorMessage);
            }
          },
        ),
      );
}

FloatingActionButton buildFloatingActionButton(BuildContext context){
  return FloatingActionButton(
    child: Icon(Icons.error),
    onPressed: () {
      BlocProvider.of<CatsCubit>(context).getCats();
    }
  );

}

ListView buildListViewCats(CatsCompleted state) {
  return ListView.builder(
    itemBuilder: (context,index) => Text(state.response[index]),
    itemCount: state.response.length,
  );
}



