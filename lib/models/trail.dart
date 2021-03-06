import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// Represents some descriptive information about a [Trail]..
import 'package:latlong/latlong.dart';
import 'fact.dart';

class Trail {

  final int id;
  final String name;
  final double lengthKM;
  final String imagePath;
  final List<Fact> facts;
  final List<LatLng> mapLocations;
  int attractionsVisited;


  Trail({
    this.id,
    this.name,
    this.lengthKM,
    this.imagePath,
    this.facts,
    this.mapLocations,
    this.attractionsVisited = 0
  });


  // Hardcoded trails --> needs to call a database in future version
  static List<Trail> fetchAll() {
    return [
      Trail(
          id: 1,
          name: 'Ydre Kronborg',
          lengthKM: 2.12,
          imagePath: 'assets/images/kronborg_strand.jpg',
          facts: [
            Fact('Spændende rute venter',
                'På denne rute har du muligheden for at se 4 attraktioner blandt andet the Garbage Fish og Herakles og Hydraen.'
                    '\n\n1. Følg den markerede rute på kortet, grøn cirkel indikere start og orange indikere mål.'
                    '\n2. Tryk på attraktions ikonet for at læse attraktions information.'
                    '\n3. Øverst til højre finder du antallet af besøgte attraktioner. '
                    'Du markere et attraktionsbesøg ved at trykke på attraktionsikonet, når du befinder dig i en radius af 20m fra attraktionen.'
                    '\n4. Færdiggør ruten ved at trykke på den orange mål cirkel, når du befinder dig i en radius af 20m fra mål.'
                    '\n5. Del din aktivitet og/eller gå på opdagelser på nye ruter.'),


          ],
          mapLocations: <LatLng>[
            new LatLng(56.0375214, 12.6145), new LatLng(56.0379105, 12.6150751), new LatLng(56.0382996, 12.6156502), new LatLng(56.0386505, 12.6160402),
            new LatLng(56.0387192, 12.61621), new LatLng(56.0385208, 12.6166496), new LatLng(56.0384903, 12.6170902), new LatLng(56.0380211, 12.6181898),
            new LatLng(56.0376587, 12.6189699), new LatLng(56.0371017, 12.6191502), new LatLng(56.0364685, 12.6193104), new LatLng(56.0364418, 12.6194096),
            new LatLng(56.0363007, 12.6194801), new LatLng(56.035759, 12.6196899), new LatLng(56.0354614, 12.6194696), new LatLng(56.03545, 12.6194696),
            new LatLng(56.0354309, 12.6194496), new LatLng(56.0353889, 12.6197395), new LatLng(56.0356216, 12.6201601), new LatLng(56.0359917, 12.6201801),
            new LatLng(56.0362511, 12.6202002), new LatLng(56.0364418, 12.6203203), new LatLng(56.0368004, 12.6204901), new LatLng(56.0369415, 12.6209803),
            new LatLng(56.0369415, 12.6209698), new LatLng(56.0369682, 12.62113), new LatLng(56.0367508, 12.6216898), new LatLng(56.0367393, 12.6217899),
            new LatLng(56.0367813, 12.6220102), new LatLng(56.0368309, 12.6220703), new LatLng(56.0372391, 12.6224098), new LatLng(56.0373306, 12.62255),
            new LatLng(56.0373688, 12.6226597), new LatLng(56.0373688, 12.6226501), new LatLng(56.0373802, 12.6226797), new LatLng(56.0375214, 12.6227198),
            new LatLng(56.0377808, 12.6230698), new LatLng(56.0378113, 12.6231403), new LatLng(56.0378113, 12.6233797), new LatLng(56.0378494, 12.6234102),
            new LatLng(56.037899, 12.6234102), new LatLng(56.0379982, 12.6233597), new LatLng(56.0382004, 12.6233397), new LatLng(56.0383301, 12.6233702),
            new LatLng(56.0383186, 12.6233702), new LatLng(56.0384903, 12.6234903), new LatLng(56.0386314, 12.6235104), new LatLng(56.038681, 12.6235504),
            new LatLng(56.0389709, 12.6239901), new LatLng(56.0390091, 12.6239996), new LatLng(56.0395584, 12.6232347), new LatLng(56.0401115, 12.6224699),
            new LatLng(56.0402298, 12.6223097), new LatLng(56.0402718, 12.62218), new LatLng(56.0402489, 12.6220303), new LatLng(56.0400887, 12.6217098),
            new LatLng(56.0404587, 12.6210604), new LatLng(56.0408287, 12.62041), new LatLng(56.0408516, 12.6202803), new LatLng(56.0408287, 12.6201601),
            new LatLng(56.0408287, 12.6201496), new LatLng(56.0407715, 12.62006), new LatLng(56.0406113, 12.6200104), new LatLng(56.0404816, 12.6201696),
            new LatLng(56.0406914, 12.6186104), new LatLng(56.04076, 12.61796), new LatLng(56.0406418, 12.6179304), new LatLng(56.0405617, 12.6178503),
            new LatLng(56.0404816, 12.6177597), new LatLng(56.0404282, 12.6176596), new LatLng(56.0403709, 12.6174603), new LatLng(56.0403099, 12.6174698),
            new LatLng(56.039959, 12.6163197), new LatLng(56.0399208, 12.61623), new LatLng(56.0398102, 12.6161203), new LatLng(56.0397415, 12.6161098),
            new LatLng(56.0396194, 12.6161699), new LatLng(56.0391998, 12.61691),
          ]),
      Trail(
        id: 2,
        name: 'Kyst Rute',
        lengthKM: 1.96,
        imagePath: 'assets/images/kronborg_kyst.jpeg',
        facts: [
          Fact('Spændende rute venter',
              'På denne rute har du muligheden for at se 4 attraktioner blandt andet the Garbage Fish og Herakles og Hydraen.'
                  '\n\n1. Følg den markerede rute på kortet, grøn cirkel indikere start og orange indikere mål.'
                  '\n2. Tryk på attraktions ikonet for at læse attraktions information.'
                  '\n3. Øverst til højre finder du antallet af besøgte attraktioner. '
                  'Du markere et attraktionsbesøg ved at trykke på attraktionsikonet, når du befinder dig i en radius af 20m fra attraktionen.'
                  '\n4. Færdiggør ruten ved at trykke på den orange mål cirkel, når du befinder dig i en radius af 20m fra mål.'
                  '\n5. Del din aktivitet og/eller gå på opdagelser på nye ruter.'),
        ],
        mapLocations: <LatLng>[
          new LatLng(56.0387192, 12.61621), new LatLng(56.0385208, 12.6166496), new LatLng(56.0384903, 12.6170902), new LatLng(56.0380211, 12.6181898),
          new LatLng(56.0376587, 12.6189699), new LatLng(56.0371017, 12.6191502), new LatLng(56.0364685, 12.6193104), new LatLng(56.0364418, 12.6194096),
          new LatLng(56.0363007, 12.6194801), new LatLng(56.035759, 12.6196899), new LatLng(56.0354614, 12.6194696), new LatLng(56.03545, 12.6194696),
          new LatLng(56.0354309, 12.6194496), new LatLng(56.0353889, 12.6197395), new LatLng(56.0356216, 12.6201601), new LatLng(56.0359917, 12.6201801),
          new LatLng(56.0362511, 12.6202002), new LatLng(56.0364418, 12.6203203), new LatLng(56.0365295, 12.6201496), new LatLng(56.0363007, 12.6194801),
          new LatLng(56.0364418, 12.6194096), new LatLng(56.0368004, 12.6202898), new LatLng(56.0368004, 12.6204901), new LatLng(56.0369415, 12.6209803),
          new LatLng(56.0369415, 12.6209698), new LatLng(56.0369682, 12.62113), new LatLng(56.0367508, 12.6216898), new LatLng(56.0367393, 12.6217899),
          new LatLng(56.0367813, 12.6220102), new LatLng(56.0368309, 12.6220703), new LatLng(56.0372391, 12.6224098), new LatLng(56.0373306, 12.62255),
          new LatLng(56.0373688, 12.6226597), new LatLng(56.0373688, 12.6226501), new LatLng(56.0373802, 12.6226797), new LatLng(56.0375214, 12.6227198),
          new LatLng(56.0377808, 12.6230698), new LatLng(56.0378113, 12.6231403), new LatLng(56.0378113, 12.6233797), new LatLng(56.0378494, 12.6234102),
          new LatLng(56.037899, 12.6234102), new LatLng(56.0379982, 12.6233597), new LatLng(56.0382004, 12.6233397), new LatLng(56.0383301, 12.6233702),
          new LatLng(56.0383186, 12.6233702), new LatLng(56.0384903, 12.6234903), new LatLng(56.0386314, 12.6235104), new LatLng(56.038681, 12.6235504),
          new LatLng(56.0389709, 12.6239901), new LatLng(56.0390091, 12.6239996), new LatLng(56.0395584, 12.6232347), new LatLng(56.0401115, 12.6224699),
          new LatLng(56.0402298, 12.6223097), new LatLng(56.0402718, 12.62218), new LatLng(56.0402489, 12.6220303), new LatLng(56.0400887, 12.6217098),
          new LatLng(56.0404587, 12.6210604), new LatLng(56.0408287, 12.62041), new LatLng(56.0408516, 12.6202803), new LatLng(56.0408287, 12.6201601),
          new LatLng(56.0408287, 12.6201496), new LatLng(56.0407715, 12.62006), new LatLng(56.0406113, 12.6200104), new LatLng(56.0404816, 12.6201696),
          new LatLng(56.0406914, 12.6186104), new LatLng(56.04076, 12.61796), new LatLng(56.0406418, 12.6179304), new LatLng(56.0405617, 12.6178503),
          new LatLng(56.0404816, 12.6177597), new LatLng(56.0404282, 12.6176596), new LatLng(56.0403709, 12.6174603), new LatLng(56.0403099, 12.6174698),
          new LatLng(56.039959, 12.6163197), new LatLng(56.0399208, 12.61623), new LatLng(56.0398102, 12.6161203), new LatLng(56.0397415, 12.6161098),
          new LatLng(56.0396194, 12.6161699), new LatLng(56.0391998, 12.61691),
        ]),
      Trail(
          id: 3,
          name: 'Nær Kronborg',
          lengthKM: 1.41,
          imagePath: 'assets/images/kronborg_nær.jpeg',
          facts: [
            Fact('Spændende rute venter',
                'På denne rute har du muligheden for at se 4 attraktioner blandt andet the Garbage Fish og Herakles og Hydraen.'
                    '\n\n1. Følg den markerede rute på kortet, grøn cirkel indikere start og orange indikere mål.'
                    '\n2. Tryk på attraktions ikonet for at læse attraktions information.'
                    '\n3. Øverst til højre finder du antallet af besøgte attraktioner. '
                    'Du markere et attraktionsbesøg ved at trykke på attraktionsikonet, når du befinder dig i en radius af 20m fra attraktionen.'
                    '\n4. Færdiggør ruten ved at trykke på den orange mål cirkel, når du befinder dig i en radius af 20m fra mål.'
                    '\n5. Del din aktivitet og/eller gå på opdagelser på nye ruter.'),
          ],
          mapLocations:
          <LatLng>[
            new LatLng(56.0391998, 12.61691 ), new LatLng(56.0395508, 12.6175203), new LatLng(56.0395699, 12.6176205), new LatLng(56.0395813, 12.6183395),
            new LatLng(56.0394592, 12.61971), new LatLng(56.0393486, 12.61971), new LatLng(56.0388794, 12.6198254), new LatLng(56.0384102, 12.6199398),
            new LatLng(56.0382881, 12.6200304), new LatLng(56.0381393, 12.6202097), new LatLng(56.0381088, 12.6203003), new LatLng(56.0378036, 12.6213446),
            new LatLng(56.0374985, 12.6223898), new LatLng(56.0378609, 12.6229696), new LatLng(56.0379295, 12.6230097), new LatLng(56.0385208, 12.6230803),
            new LatLng(56.0387383, 12.6231899), new LatLng(56.0387306, 12.6231899), new LatLng(56.0387993, 12.62321), new LatLng(56.0388718, 12.6231804),
            new LatLng(56.0390282, 12.6230602), new LatLng(56.0391388, 12.6230202), new LatLng(56.0394211, 12.6229897), new LatLng(56.0394897, 12.6229496),
            new LatLng(56.0395699, 12.6227903), new LatLng(56.0396614, 12.6220398), new LatLng(56.0397186, 12.6217299), new LatLng(56.0395889, 12.6216297),
            new LatLng(56.0393906, 12.6217003), new LatLng(56.0393486, 12.6224804), new LatLng(56.0385704, 12.6223698), new LatLng(56.03862, 12.6208696),
            new LatLng(56.03862, 12.6208601), new LatLng(56.0386314, 12.6208496), new LatLng(56.0394211, 12.6209602), new LatLng(56.0394096, 12.6209898),
            new LatLng(56.0393906, 12.6217003), new LatLng(56.0395889, 12.6216297), new LatLng(56.0397186, 12.6217299), new LatLng(56.0401382, 12.62045),
            new LatLng(56.0401611, 12.6202497), new LatLng(56.0401115, 12.6201801), new LatLng(56.0397301, 12.6199102)
          ]),
    ];
  }


  // In the future this will replaced by a proper API call to a database
  // Simple function that fetch all locations, then iterate them and when we find the location
  // with the ID we want, return it immediately
  static Trail fetchByID(int trailID) {
    List<Trail> trails = Trail.fetchAll();
    for (var i = 0 ; i < trails.length; i++) {
      if (trails[i].id == trailID){
        return trails[i];
      }
    }
    return null;
  }


}