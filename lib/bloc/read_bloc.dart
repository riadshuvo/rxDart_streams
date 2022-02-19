import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;


class ReaderBloc {

  final _dartStream = StreamController<String>();
  final _publishStream = PublishSubject<String>();
  final _behaviorStream = BehaviorSubject<String>();
  final _replayStream = ReplaySubject<String>(maxSize: 4);

  //Get
  Stream<String> get dartStream => _dartStream.stream.asBroadcastStream();
  Stream<String> get publishStream => _publishStream.stream;
  Stream<String> get behaviorStream => _behaviorStream.stream;
  Stream<String> get replayStream => _replayStream.stream.map((l) => _replayStream.values.join("\n"));

  startReading() async {

    var contents = [
    "1. When I have seen by Time's fell hand defaced",
    "2. The rich proud cost of outworn buried age",
    "3. When sometime lofty towers I see down-razed",
    "4. And brass eternal slave to mortal rage",
    "5. When I have seen the hungry ocean gain"
    "6. Advantage on the kingdom of the shore",
    "7. And the firm soil win of the watery main",
    "8. Increasing store with loss, and loss with store",
    "9. When I have seen such interchange of state",
    "10. Or state itself confounded to decay",
    "11. Ruin hath taught me thus to ruminate",
    "12. That Time will come and take my love away.",
    "13. This thought is as a death which cannot choose",
    "14. But weep to have that which it fears to lose"
    ];

    for(String l in contents){
      log(l);

      //Add Line to Streams
      _dartStream.sink.add(l);
      _publishStream.add(l);
      _behaviorStream.add(l);
      _replayStream.add(l);

      await Future.delayed(const Duration(milliseconds: 2500));
    }

  }


  dispose(){
    _dartStream.close();
    _publishStream.close();
    _behaviorStream.close();
    _replayStream.close();
  }

}