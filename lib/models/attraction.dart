/// Represents some descriptive information about a [Attraction].
import 'package:latlong/latlong.dart';
import 'fact.dart';

class Attraction {

  final int id;
  final String name;
  final String imagePath;
  final List<Fact> facts;
  final LatLng mapLocation;

  Attraction({
    this.id,
    this.name,
    this.imagePath,
    this.facts,
    this.mapLocation
  });

  // Hardcoded attractions --> needs to call a database in future version
  static List<Attraction> fetchAll() {
    return [
      Attraction(
          id: 1,
          name: 'Kronborg Slot',
          imagePath: 'assets/images/kronborg-slot.png',
          facts:[
            Fact('Om Kronborg',
                'I år 2000 blev Kronborg optaget på Unescos verdensarvsliste. Kronborg fik den eftertragtede status, fordi slottet er et enestående eksempel på et renæssanceslot, og har som fæstning og kongeslot spillet en central rolle i Nordeuropas historie i det 16. og 18. århundrede.'
            ),
            Fact('Historie',
                'I over 400 år er slottet hovedsæde for opkrævningen af øresundstolden. Kronborg er en legende i sin storhedstid i slutningen af 1500-tallet. Med slottets truende kanoner, der peger direkte mod skibene i Øresund, tør de søfarende ikke andet end at betale kongen for at sejle forbi. De fylder kongens kiste, og Frederik 2. forskønner slottet med spir, tårne, sandsten og kobbertag. Kronborg Slot bliver et af renæssancens fineste slotte. Sørejsende, handelsmænd, diplomater og kongelige beretter om det storslåede slot og hof i Helsingør med pomp, pragt og kanonskåler.'
                    'Det overdådige hofliv forsvinder gradvist fra slottet efter branden i 1629. Her æder flammerne det meste af slottets dyrebare møbler, malerierne og kobbertaget. Efter den dag går slottet mørke tider i møde. Den svenske konge, Karl Gustav, besætter og plyndrer Kronborg i 1658-1660. De næste 300 år bliver Kronborg mest brugt som fæstning og som militærkaserne.'
                    'I dag er der en ny slags liv på slottet, hvor 325.000 gæster fra hele verden besøger Kronborg.'
            )],
          mapLocation: new LatLng(11.11, 11.11),
      ),
      Attraction(
          id: 2,
          name: "Herakles og Hydraen",
          imagePath: "assets/images/herakles-og-hydraen.jpg",
          facts: [
            Fact("Om Herakles og Hydraen",
                "På havnen i Helsingør, nærmere bestemt på nordre mole ud mod Øresund står Rudolph Tegners statue Herakles og Hydraen. Kunstneren begyndte at arbejde på statuen i 1919. Det tog omkring to år for ham og et par medarbejdere at fremstille statuen i gips. I 1930 tog Rudolph Tegner selv initiativ til at foreslå borgmester Peder Christensen at statuen, når den var støbt i bronze, skulle stå i Helsingør på stenbarrieren ud til Øresund. Herakles og Hydraen kom dog ikke til at stå i vandkanten. Da den blev afsløret den 20. november 1932, stod statuen på en høj granitsokkel i en kumme af granit med lavt broncerækværk - tegnet af arkitekt Emil Engell. Statuen stod godt nok ved Øresund, men ikke helt ude i vandkanten, men derimod på land og tæt på jernbanestationen og færgerne. Her stod statuen indtil november 1990, hvor den på grund af etableringen af nye gangbroer til færgerne måtte fjernes. Efter at have været opmagasineret nogle år, blev statuen genindviet den 25. maj 1994 på sin nuværende plads på nordre mole."
            ),
            Fact('Græsk betydning',
                'I den græske gudeverden er Herakles en helt som kæmper mod alle mulige dyr, virkelige som uvirkelige, og her en enorm vandslange med ni hoveder. I Helsingør elskede man ikke ligefrem skulpturen dengang den blev sat op, og den fik da da også "kælenavnet" Den lille Mands Kamp mod Skattevæsenet.'
            )],
          mapLocation: new LatLng(56.035364, 12.619877)
      ),
      Attraction(
          id: 3,
          name: "Holger Danske",
          imagePath: "assets/images/holger-danske.jpg",
          facts: [
            Fact('Om Holger Danske',
                'I kasematternes dybe, underjordiske gange sover nationalhelten Holger Danske som en sten. Han har sovet i hundreder af år, og ifølge et gammelt sagn vil han vågne den dag, Danmark trues af fjender. Først da slår han øjnene op, rejser sig og hæver sit sværd.'
            ),
            Fact('Historie',
                'Inden han faldt i en dyb søvn, rejste han verden rundt og udmærkede sig som en slagkraftig kriger. Sagnet om Holger Danske (eller Ogier le Danois) er oprindeligt fransk og snart over 1000 år gammelt. I løbet af 1800-tallet blev Holger Danske et stærkt dansk nationalsymbol. Det var den danske forfatter H. C. Andersen, der i 1846 i et eventyr placerede Holger Danske på Kronborg. Statuen i Kasematterne er en afstøbning af originalen til en bronzestatue lavet af den danske billedhugger H. P. Pedersen-Dan i 1907.'
            )],
          mapLocation: new LatLng(56.039212, 12.621574)
      ),
      Attraction(
          id: 4,
          name: "Hamlet Scenen",
          imagePath: "assets/images/hamlet-scenen.jpg",
          facts: [
            Fact("Om Hamlet Scenen",
                "HamletScenen forvalter en unik og umistelig kulturarv med afsæt i den altid mesterlige William Shakespeares værker, der gennem århundrederne vedbliver at være dybt vedkommende for enhver refleksion over den menneskelige tilstand og eksistens i går, i dag og i morgen. I en tid hvor døden er tabuiseret som aldrig før, og eksistens er noget de færreste funderer over mellem smartphones og småbørns-putning, insisterer HamletScenen på at skabe og præsentere teater, der tager favntag med livets store spørgsmål."
            ),
            Fact("Historie",
                "DEN KULTURELLE BRO MELLEM ENGLANDS SHAKESPEARE OG DANMARKS KRONBORG SLOT. "
                    "I sensommeren 1586 rejste tre skuespillere, William Kemp, Thomas Pope og George Bryan hjem til London efter endt sommersæson på Kronborg slot i Helsingør, hvor de var blevet ansat af Danmarks teater og kunstelskende konge, Frederik II. Tilbage i London mødte de den unge karismatiske skuespiller og spirende manuskriptforfatter, William Shakespeare, og de blev hurtigt en del af hans teater, the Lord Chamberlain’s Men. I begyndelsen af 1590’erne præsenterede teatret Shakespeares første egne værker, heriblandt Henry VI og Richard III. I løbet af kort tid voksede den unge William Shakespeares berømmelse med sine verdslige, underholdende og historiske dramaer. "
            )],
      mapLocation: new LatLng(56.038033, 12.620118)
      ),
      Attraction(
          id: 5,
          name: "Garbage Fish",
          imagePath: "assets/images/garbage_fish.png",
          facts: [
            Fact("Om Garbage Fish",
                    "Denne flotte....."            ),
            Fact("Historie",
              "Dens historie....."
            )],
          mapLocation: new LatLng(56.037861, 12.615442)
      ),
      Attraction(
          id: 6,
          name: "Han Statue",
          imagePath: "assets/images/han_statue.jpeg",
          facts: [
            Fact("Om Han Statuen",
                "Han statuen er"
            ),
            Fact("Historie",
                "Dengang"
            )],
          mapLocation: new LatLng(56.037361, 12.615805)
      ),
      Attraction(
          id: 7,
          name: "Kronværkerne",
          imagePath: "assets/images/kronværkerne.jpg",
          facts: [
            Fact("Om Kronværkerne",
                "Kronværkerne er"
            )],
          mapLocation: new LatLng(56.039220, 12.619523)
      ),
      Attraction(
          id: 8,
          name: "Souvenir Shop",
          imagePath: "assets/images/souvenir.jpg",
          facts: [
            Fact("Velkommen ind",
                "Her kan du købe..."
            )],
          mapLocation: new LatLng(56.039602, 12.619342)
      ),


    ];
  }



  // In the future this will replaced by a proper API call to a database
  // Simple function that fetch all locations, then iterate them and when we find the location
  // with the ID we want, return it immediately
  static Attraction fetchByID(int attractionID) {
    List<Attraction> attractions = Attraction.fetchAll();
    for (var i = 0 ; i < attractions.length; i++) {
      if (attractions[i].id == attractionID){
        return attractions[i];
      }
    }
    return null;
  }

}