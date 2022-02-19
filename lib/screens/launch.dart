import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart_provider/bloc/read_bloc.dart';
import 'package:rxdart_provider/screens/read.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  ReaderBloc readerBloc = ReaderBloc();

  @override
  void dispose() {
    readerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    readerBloc = Provider.of<ReaderBloc>(context);

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300.0,
          child: Column(
            children: <Widget>[
              const Text('Shakespeare\'s Sonnets',style:TextStyle(fontSize: 26.0)),
              const Text('Sonnet 64',style:TextStyle(fontSize: 15.0)),
              const SizedBox(height: 80.0,),
              TextButton(
                child:Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(8),
                    child: const Text('Engage', style: TextStyle(color: Colors.white))),
                onPressed: () {
                  readerBloc.startReading();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Read()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


