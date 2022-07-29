import 'package:bus_hexa/loader/getAPI.dart';


busnoList() async {
    List busNo = await getAPILaneToTracks();
    var numbers = await Map<int,String>.fromIterable(busNo,
    key: (element) => element['id'] ,
    value: (element) => element['bus_name']);
    return numbers;
    }
//  }
infoList() async {
  List arrivalInfo = await getAPIUlsanBusArrivalInfos();
  Map busNomap = await busnoList();
  var infos = Map<dynamic, Map>.fromIterable(arrivalInfo,
  key: (element) => busNomap[element['route_key_usb']],
  value: (element) => element
  );
  return infos;
}

inputData() async {
  Map busNomap = await busnoList();
  Map busInfomap = await infoList();
  List dataList = [];
  Map special = {};
  special['bus_no'] = busNomap[2];
  special['info'] = busInfomap[busNomap[1]];
  dataList.add(special);

  for (int i = 3; i < 10; i++) {
    Map elements = {};
    elements['bus_no'] = busNomap[i];
    elements['info'] = busInfomap[busNomap[i]];
    dataList.add(elements);
  }
  return dataList;
}