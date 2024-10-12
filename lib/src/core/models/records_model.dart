import '/src/core/models/patient_model.dart';
import '/src/core/models/user_model.dart';

class Records {
  String? id;
  DateTime date;
  String therapist;
  String certificate;
  String patient;
  bool? isMale;
  bool? isPhysiotherapy;
  final VitalSigns vitalSigns;
  final WarmUp warmUp;
  final Exercises barrel;
  final Exercises cadillac;
  final Exercises stepChair;
  final Exercises reformer;
  final Exercises columpio;
  final Exercises solo;
  final Accessories accessories;
  final Physiotherapy physiotherapy;
  bool? intercurrences;
  String? comments;

  Records({
    this.id,
    required this.date,
    required this.therapist,
    required this.certificate,
    required this.patient,
    this.isMale,
    this.isPhysiotherapy,
    VitalSigns? vitalSigns,
    WarmUp? warmUp,
    Exercises? barrel,
    Exercises? cadillac,
    Exercises? stepChair,
    Exercises? reformer,
    Exercises? columpio,
    Exercises? solo,
    Accessories? accessories,
    Physiotherapy? physiotherapy,
    this.intercurrences,
    this.comments,
  })  : vitalSigns = vitalSigns ?? VitalSigns(),
        warmUp = warmUp ?? WarmUp(),
        barrel = barrel ?? Exercises(),
        cadillac = cadillac ?? Exercises(),
        stepChair = stepChair ?? Exercises(),
        reformer = reformer ?? Exercises(),
        columpio = columpio ?? Exercises(),
        solo = solo ?? Exercises(),
        accessories = accessories ?? Accessories(),
        physiotherapy = physiotherapy ?? Physiotherapy();

  factory Records.empty(User user, Patient patient, DateTime date) => Records(
        date: date,
        therapist: user.name,
        certificate: user.certificate,
        patient: patient.name,
        vitalSigns: VitalSigns(),
        warmUp: WarmUp(),
        barrel: Exercises(),
        cadillac: Exercises(),
        stepChair: Exercises(),
        reformer: Exercises(),
        columpio: Exercises(),
        solo: Exercises(),
        accessories: Accessories(),
        physiotherapy: Physiotherapy(),
      );

  Records copyWith(Records records) => Records(
        id: id,
        date: records.date,
        therapist: records.therapist,
        certificate: records.certificate,
        patient: records.patient,
        isMale: records.isMale,
        isPhysiotherapy: records.isPhysiotherapy,
        vitalSigns: records.vitalSigns,
        warmUp: records.warmUp,
        barrel: records.barrel,
        cadillac: records.cadillac,
        stepChair: records.stepChair,
        reformer: records.reformer,
        columpio: records.columpio,
        solo: records.solo,
        accessories: records.accessories,
        physiotherapy: records.physiotherapy,
        intercurrences: records.intercurrences,
        comments: records.comments,
      );

  bool isEqual(Records records) => [
        date == records.date,
        therapist == records.therapist,
        certificate == records.certificate,
        patient == records.patient,
        isMale == records.isMale,
        isPhysiotherapy == records.isPhysiotherapy,
        vitalSigns.isEqual(records.vitalSigns),
        warmUp.isEqual(records.warmUp),
        barrel.isEqual(records.barrel),
        cadillac.isEqual(records.cadillac),
        stepChair.isEqual(records.stepChair),
        reformer.isEqual(records.reformer),
        columpio.isEqual(records.columpio),
        solo.isEqual(records.solo),
        accessories.isEqual(records.accessories),
        physiotherapy.isEqual(records.physiotherapy),
        intercurrences == records.intercurrences,
        comments == records.comments,
      ].every((element) => element);

  Records getChanges(Records records) => Records(
        id: id,
        date: date,
        therapist: therapist,
        certificate: certificate,
        patient: patient,
        isMale: isMale == records.isMale ? null : records.isMale,
        isPhysiotherapy: isPhysiotherapy == records.isPhysiotherapy
            ? null
            : records.isPhysiotherapy,
        vitalSigns: vitalSigns.getChanges(records.vitalSigns),
        warmUp: warmUp.getChanges(records.warmUp),
        barrel: barrel.getChanges(records.barrel),
        cadillac: cadillac.getChanges(records.cadillac),
        stepChair: stepChair.getChanges(records.stepChair),
        reformer: reformer.getChanges(records.reformer),
        columpio: columpio.getChanges(records.columpio),
        solo: solo.getChanges(records.solo),
        accessories: accessories.getChanges(records.accessories),
        physiotherapy: physiotherapy.getChanges(records.physiotherapy),
        intercurrences: intercurrences == records.intercurrences
            ? null
            : records.intercurrences,
        comments: comments == records.comments ? null : records.comments,
      );

  void update(Records records) => this
    ..id = records.id
    ..date = records.date
    ..therapist = records.therapist
    ..certificate = records.certificate
    ..patient = records.patient
    ..isMale = records.isMale
    ..isPhysiotherapy = records.isPhysiotherapy
    ..vitalSigns.update(records.vitalSigns)
    ..warmUp.update(records.warmUp)
    ..barrel.update(records.barrel)
    ..cadillac.update(records.cadillac)
    ..stepChair.update(records.stepChair)
    ..reformer.update(records.reformer)
    ..columpio.update(records.columpio)
    ..solo.update(records.solo)
    ..accessories.update(records.accessories)
    ..physiotherapy.update(records.physiotherapy)
    ..intercurrences = records.intercurrences
    ..comments = records.comments;
}

class VitalSigns {
  double? pressure;
  double? heartRate;
  double? oxygenSaturation;

  VitalSigns({
    this.pressure,
    this.heartRate,
    this.oxygenSaturation,
  });

  bool isEqual(VitalSigns vitalSigns) => [
        pressure == vitalSigns.pressure,
        heartRate == vitalSigns.heartRate,
        oxygenSaturation == vitalSigns.oxygenSaturation,
      ].every((element) => element);

  VitalSigns getChanges(VitalSigns vitalSigns) => VitalSigns(
        pressure: pressure == vitalSigns.pressure ? null : vitalSigns.pressure,
        heartRate:
            heartRate == vitalSigns.heartRate ? null : vitalSigns.heartRate,
        oxygenSaturation: oxygenSaturation == vitalSigns.oxygenSaturation
            ? null
            : vitalSigns.oxygenSaturation,
      );

  void update(VitalSigns vitalSigns) => this
    ..pressure = vitalSigns.pressure
    ..heartRate = vitalSigns.heartRate
    ..oxygenSaturation = vitalSigns.oxygenSaturation;
}

class WarmUp {
  bool? functionalAerobic;
  bool? plyometricReformer;
  bool? plyometricWall;
  bool? swimmingSolo;
  bool? swimmingBarrel;
  bool? hundredSolo;
  bool? hundredReformer;
  String? other;

  WarmUp({
    this.functionalAerobic,
    this.plyometricReformer,
    this.plyometricWall,
    this.swimmingSolo,
    this.swimmingBarrel,
    this.hundredSolo,
    this.hundredReformer,
    this.other,
  });

  bool isEqual(WarmUp warmUp) => [
        functionalAerobic == warmUp.functionalAerobic,
        plyometricReformer == warmUp.plyometricReformer,
        plyometricWall == warmUp.plyometricWall,
        swimmingSolo == warmUp.swimmingSolo,
        swimmingBarrel == warmUp.swimmingBarrel,
        hundredSolo == warmUp.hundredSolo,
        hundredReformer == warmUp.hundredReformer,
        other == warmUp.other,
      ].every((element) => element);

  WarmUp getChanges(WarmUp warmUp) => WarmUp(
        functionalAerobic: functionalAerobic == warmUp.functionalAerobic
            ? null
            : warmUp.functionalAerobic,
        plyometricReformer: plyometricReformer == warmUp.plyometricReformer
            ? null
            : warmUp.plyometricReformer,
        plyometricWall: plyometricWall == warmUp.plyometricWall
            ? null
            : warmUp.plyometricWall,
        swimmingSolo:
            swimmingSolo == warmUp.swimmingSolo ? null : warmUp.swimmingSolo,
        swimmingBarrel: swimmingBarrel == warmUp.swimmingBarrel
            ? null
            : warmUp.swimmingBarrel,
        hundredSolo:
            hundredSolo == warmUp.hundredSolo ? null : warmUp.hundredSolo,
        hundredReformer: hundredReformer == warmUp.hundredReformer
            ? null
            : warmUp.hundredReformer,
        other: other == warmUp.other ? null : warmUp.other,
      );

  void update(WarmUp warmUp) => this
    ..functionalAerobic = warmUp.functionalAerobic
    ..plyometricReformer = warmUp.plyometricReformer
    ..plyometricWall = warmUp.plyometricWall
    ..swimmingSolo = warmUp.swimmingSolo
    ..swimmingBarrel = warmUp.swimmingBarrel
    ..hundredSolo = warmUp.hundredSolo
    ..hundredReformer = warmUp.hundredReformer
    ..other = warmUp.other;
}

class Exercises {
  bool? stretchCadAnt;
  bool? stretchCadPost;
  bool? stretchCadLat;
  bool? stretchCadCross;
  bool? stretchMmii;
  bool? stretchMmss;
  bool? strengthMmii;
  bool? strengthMmss;
  bool? strengthAbd;
  bool? strengthPara;
  bool? mobilitySpine;
  bool? mobilityShoulder;
  bool? mobilityHip;
  bool? mobilityAnkle;
  bool? mobilityWrist;
  bool? relaxation;
  bool? motorCoordination;
  bool? balance;
  bool? proprioception;
  String? other;

  Exercises({
    this.stretchCadAnt,
    this.stretchCadPost,
    this.stretchCadLat,
    this.stretchCadCross,
    this.stretchMmii,
    this.stretchMmss,
    this.strengthMmii,
    this.strengthMmss,
    this.strengthAbd,
    this.strengthPara,
    this.mobilitySpine,
    this.mobilityShoulder,
    this.mobilityHip,
    this.mobilityAnkle,
    this.mobilityWrist,
    this.relaxation,
    this.motorCoordination,
    this.balance,
    this.proprioception,
    this.other,
  });

  bool isEqual(Exercises exercises) => [
        stretchCadAnt == exercises.stretchCadAnt,
        stretchCadPost == exercises.stretchCadPost,
        stretchCadLat == exercises.stretchCadLat,
        stretchCadCross == exercises.stretchCadCross,
        stretchMmii == exercises.stretchMmii,
        stretchMmss == exercises.stretchMmss,
        strengthMmii == exercises.strengthMmii,
        strengthMmss == exercises.strengthMmss,
        strengthAbd == exercises.strengthAbd,
        strengthPara == exercises.strengthPara,
        mobilitySpine == exercises.mobilitySpine,
        mobilityShoulder == exercises.mobilityShoulder,
        mobilityHip == exercises.mobilityHip,
        mobilityAnkle == exercises.mobilityAnkle,
        mobilityWrist == exercises.mobilityWrist,
        relaxation == exercises.relaxation,
        motorCoordination == exercises.motorCoordination,
        balance == exercises.balance,
        proprioception == exercises.proprioception,
        other == exercises.other,
      ].every((element) => element);

  Exercises getChanges(Exercises exercises) => Exercises(
        stretchCadAnt: stretchCadAnt == exercises.stretchCadAnt
            ? null
            : exercises.stretchCadAnt,
        stretchCadPost: stretchCadPost == exercises.stretchCadPost
            ? null
            : exercises.stretchCadPost,
        stretchCadLat: stretchCadLat == exercises.stretchCadLat
            ? null
            : exercises.stretchCadLat,
        stretchCadCross: stretchCadCross == exercises.stretchCadCross
            ? null
            : exercises.stretchCadCross,
        stretchMmii:
            stretchMmii == exercises.stretchMmii ? null : exercises.stretchMmii,
        stretchMmss:
            stretchMmss == exercises.stretchMmss ? null : exercises.stretchMmss,
        strengthMmii: strengthMmii == exercises.strengthMmii
            ? null
            : exercises.strengthMmii,
        strengthMmss: strengthMmss == exercises.strengthMmss
            ? null
            : exercises.strengthMmss,
        strengthAbd:
            strengthAbd == exercises.strengthAbd ? null : exercises.strengthAbd,
        strengthPara: strengthPara == exercises.strengthPara
            ? null
            : exercises.strengthPara,
        mobilitySpine: mobilitySpine == exercises.mobilitySpine
            ? null
            : exercises.mobilitySpine,
        mobilityShoulder: mobilityShoulder == exercises.mobilityShoulder
            ? null
            : exercises.mobilityShoulder,
        mobilityHip:
            mobilityHip == exercises.mobilityHip ? null : exercises.mobilityHip,
        mobilityAnkle: mobilityAnkle == exercises.mobilityAnkle
            ? null
            : exercises.mobilityAnkle,
        mobilityWrist: mobilityWrist == exercises.mobilityWrist
            ? null
            : exercises.mobilityWrist,
        relaxation:
            relaxation == exercises.relaxation ? null : exercises.relaxation,
        motorCoordination: motorCoordination == exercises.motorCoordination
            ? null
            : exercises.motorCoordination,
        balance: balance == exercises.balance ? null : exercises.balance,
        proprioception: proprioception == exercises.proprioception
            ? null
            : exercises.proprioception,
        other: other == exercises.other ? null : exercises.other,
      );

  void update(Exercises exercises) => this
    ..stretchCadAnt = exercises.stretchCadAnt
    ..stretchCadPost = exercises.stretchCadPost
    ..stretchCadLat = exercises.stretchCadLat
    ..stretchCadCross = exercises.stretchCadCross
    ..stretchMmii = exercises.stretchMmii
    ..stretchMmss = exercises.stretchMmss
    ..strengthMmii = exercises.strengthMmii
    ..strengthMmss = exercises.strengthMmss
    ..strengthAbd = exercises.strengthAbd
    ..strengthPara = exercises.strengthPara
    ..mobilitySpine = exercises.mobilitySpine
    ..mobilityShoulder = exercises.mobilityShoulder
    ..mobilityHip = exercises.mobilityHip
    ..mobilityAnkle = exercises.mobilityAnkle
    ..mobilityWrist = exercises.mobilityWrist
    ..relaxation = exercises.relaxation
    ..motorCoordination = exercises.motorCoordination
    ..balance = exercises.balance
    ..proprioception = exercises.proprioception
    ..other = exercises.other;
}

class Accessories {
  bool? ball;
  bool? bosu;
  bool? comboBox;
  bool? proprioceptionDisk;
  bool? pushUpSupport;
  bool? foamRoller;
  bool? myofascialRoller;
  bool? beanBag;
  bool? pilatesRing;
  bool? pilatesWheel;
  bool? abdominalWheel;
  bool? stressBall;
  bool? massager;
  bool? baton;
  bool? elasticBand;
  double? dumbbell;
  double? tonningBall;

  Accessories({
    this.ball,
    this.bosu,
    this.comboBox,
    this.proprioceptionDisk,
    this.pushUpSupport,
    this.foamRoller,
    this.myofascialRoller,
    this.beanBag,
    this.pilatesRing,
    this.pilatesWheel,
    this.abdominalWheel,
    this.stressBall,
    this.massager,
    this.baton,
    this.elasticBand,
    this.dumbbell,
    this.tonningBall,
  });

  bool isEqual(Accessories accessories) => [
        ball == accessories.ball,
        bosu == accessories.bosu,
        comboBox == accessories.comboBox,
        proprioceptionDisk == accessories.proprioceptionDisk,
        pushUpSupport == accessories.pushUpSupport,
        foamRoller == accessories.foamRoller,
        myofascialRoller == accessories.myofascialRoller,
        beanBag == accessories.beanBag,
        pilatesRing == accessories.pilatesRing,
        pilatesWheel == accessories.pilatesWheel,
        abdominalWheel == accessories.abdominalWheel,
        stressBall == accessories.stressBall,
        massager == accessories.massager,
        baton == accessories.baton,
        elasticBand == accessories.elasticBand,
        dumbbell == accessories.dumbbell,
        tonningBall == accessories.tonningBall,
      ].every((element) => element);

  Accessories getChanges(Accessories accessories) => Accessories(
        ball: ball == accessories.ball ? null : accessories.ball,
        bosu: bosu == accessories.bosu ? null : accessories.bosu,
        comboBox:
            comboBox == accessories.comboBox ? null : accessories.comboBox,
        proprioceptionDisk: proprioceptionDisk == accessories.proprioceptionDisk
            ? null
            : accessories.proprioceptionDisk,
        pushUpSupport: pushUpSupport == accessories.pushUpSupport
            ? null
            : accessories.pushUpSupport,
        foamRoller: foamRoller == accessories.foamRoller
            ? null
            : accessories.foamRoller,
        myofascialRoller: myofascialRoller == accessories.myofascialRoller
            ? null
            : accessories.myofascialRoller,
        beanBag: beanBag == accessories.beanBag ? null : accessories.beanBag,
        pilatesRing: pilatesRing == accessories.pilatesRing
            ? null
            : accessories.pilatesRing,
        pilatesWheel: pilatesWheel == accessories.pilatesWheel
            ? null
            : accessories.pilatesWheel,
        abdominalWheel: abdominalWheel == accessories.abdominalWheel
            ? null
            : accessories.abdominalWheel,
        stressBall: stressBall == accessories.stressBall
            ? null
            : accessories.stressBall,
        massager:
            massager == accessories.massager ? null : accessories.massager,
        baton: baton == accessories.baton ? null : accessories.baton,
        elasticBand: elasticBand == accessories.elasticBand
            ? null
            : accessories.elasticBand,
        dumbbell:
            dumbbell == accessories.dumbbell ? null : accessories.dumbbell,
        tonningBall: tonningBall == accessories.tonningBall
            ? null
            : accessories.tonningBall,
      );

  void update(Accessories accessories) => this
    ..ball = accessories.ball
    ..bosu = accessories.bosu
    ..comboBox = accessories.comboBox
    ..proprioceptionDisk = accessories.proprioceptionDisk
    ..pushUpSupport = accessories.pushUpSupport
    ..foamRoller = accessories.foamRoller
    ..myofascialRoller = accessories.myofascialRoller
    ..beanBag = accessories.beanBag
    ..pilatesRing = accessories.pilatesRing
    ..pilatesWheel = accessories.pilatesWheel
    ..abdominalWheel = accessories.abdominalWheel
    ..stressBall = accessories.stressBall
    ..massager = accessories.massager
    ..baton = accessories.baton
    ..elasticBand = accessories.elasticBand
    ..dumbbell = accessories.dumbbell
    ..tonningBall = accessories.tonningBall;
}

class Physiotherapy {
  bool? stretching;
  bool? cryotherapy;
  bool? thermotherapy;
  bool? gaitTraining;
  bool? jointMobilization;
  bool? massotherapy;
  bool? williams;
  bool? codman;
  bool? mckenzie;
  bool? klapp;
  bool? rpg;
  bool? muscleStrengthening;
  bool? activeExercises;
  bool? passiveExercises;
  bool? assistedExercises;
  bool? bandage;
  bool? homework;
  bool? footwearChange;
  bool? isometricMmss;
  bool? isometricMmii;
  bool? isometricAbd;
  String? isometricOther;
  String? tens;
  String? fes;
  String? ultrasound;

  Physiotherapy({
    this.stretching,
    this.cryotherapy,
    this.thermotherapy,
    this.gaitTraining,
    this.jointMobilization,
    this.massotherapy,
    this.williams,
    this.codman,
    this.mckenzie,
    this.klapp,
    this.rpg,
    this.muscleStrengthening,
    this.activeExercises,
    this.passiveExercises,
    this.assistedExercises,
    this.bandage,
    this.homework,
    this.footwearChange,
    this.isometricMmss,
    this.isometricMmii,
    this.isometricAbd,
    this.isometricOther,
    this.tens,
    this.fes,
    this.ultrasound,
  });

  bool isEqual(Physiotherapy physiotherapy) => [
        stretching == physiotherapy.stretching,
        cryotherapy == physiotherapy.cryotherapy,
        thermotherapy == physiotherapy.thermotherapy,
        gaitTraining == physiotherapy.gaitTraining,
        jointMobilization == physiotherapy.jointMobilization,
        massotherapy == physiotherapy.massotherapy,
        williams == physiotherapy.williams,
        codman == physiotherapy.codman,
        mckenzie == physiotherapy.mckenzie,
        klapp == physiotherapy.klapp,
        rpg == physiotherapy.rpg,
        muscleStrengthening == physiotherapy.muscleStrengthening,
        activeExercises == physiotherapy.activeExercises,
        passiveExercises == physiotherapy.passiveExercises,
        assistedExercises == physiotherapy.assistedExercises,
        bandage == physiotherapy.bandage,
        homework == physiotherapy.homework,
        footwearChange == physiotherapy.footwearChange,
        isometricMmss == physiotherapy.isometricMmss,
        isometricMmii == physiotherapy.isometricMmii,
        isometricAbd == physiotherapy.isometricAbd,
        isometricOther == physiotherapy.isometricOther,
        tens == physiotherapy.tens,
        fes == physiotherapy.fes,
        ultrasound == physiotherapy.ultrasound,
      ].every((element) => element);

  Physiotherapy getChanges(Physiotherapy physiotherapy) => Physiotherapy(
        stretching: stretching == physiotherapy.stretching
            ? null
            : physiotherapy.stretching,
        cryotherapy: cryotherapy == physiotherapy.cryotherapy
            ? null
            : physiotherapy.cryotherapy,
        thermotherapy: thermotherapy == physiotherapy.thermotherapy
            ? null
            : physiotherapy.thermotherapy,
        gaitTraining: gaitTraining == physiotherapy.gaitTraining
            ? null
            : physiotherapy.gaitTraining,
        jointMobilization: jointMobilization == physiotherapy.jointMobilization
            ? null
            : physiotherapy.jointMobilization,
        massotherapy: massotherapy == physiotherapy.massotherapy
            ? null
            : physiotherapy.massotherapy,
        williams:
            williams == physiotherapy.williams ? null : physiotherapy.williams,
        codman: codman == physiotherapy.codman ? null : physiotherapy.codman,
        mckenzie:
            mckenzie == physiotherapy.mckenzie ? null : physiotherapy.mckenzie,
        klapp: klapp == physiotherapy.klapp ? null : physiotherapy.klapp,
        rpg: rpg == physiotherapy.rpg ? null : physiotherapy.rpg,
        muscleStrengthening:
            muscleStrengthening == physiotherapy.muscleStrengthening
                ? null
                : physiotherapy.muscleStrengthening,
        activeExercises: activeExercises == physiotherapy.activeExercises
            ? null
            : physiotherapy.activeExercises,
        passiveExercises: passiveExercises == physiotherapy.passiveExercises
            ? null
            : physiotherapy.passiveExercises,
        assistedExercises: assistedExercises == physiotherapy.assistedExercises
            ? null
            : physiotherapy.assistedExercises,
        bandage:
            bandage == physiotherapy.bandage ? null : physiotherapy.bandage,
        homework:
            homework == physiotherapy.homework ? null : physiotherapy.homework,
        footwearChange: footwearChange == physiotherapy.footwearChange
            ? null
            : physiotherapy.footwearChange,
        isometricMmss: isometricMmss == physiotherapy.isometricMmss
            ? null
            : physiotherapy.isometricMmss,
        isometricMmii: isometricMmii == physiotherapy.isometricMmii
            ? null
            : physiotherapy.isometricMmii,
        isometricAbd: isometricAbd == physiotherapy.isometricAbd
            ? null
            : physiotherapy.isometricAbd,
        isometricOther: isometricOther == physiotherapy.isometricOther
            ? null
            : physiotherapy.isometricOther,
        tens: tens == physiotherapy.tens ? null : physiotherapy.tens,
        fes: fes == physiotherapy.fes ? null : physiotherapy.fes,
        ultrasound: ultrasound == physiotherapy.ultrasound
            ? null
            : physiotherapy.ultrasound,
      );

  void update(Physiotherapy physiotherapy) => this
    ..stretching = physiotherapy.stretching
    ..cryotherapy = physiotherapy.cryotherapy
    ..thermotherapy = physiotherapy.thermotherapy
    ..gaitTraining = physiotherapy.gaitTraining
    ..jointMobilization = physiotherapy.jointMobilization
    ..massotherapy = physiotherapy.massotherapy
    ..williams = physiotherapy.williams
    ..codman = physiotherapy.codman
    ..mckenzie = physiotherapy.mckenzie
    ..klapp = physiotherapy.klapp
    ..rpg = physiotherapy.rpg
    ..muscleStrengthening = physiotherapy.muscleStrengthening
    ..activeExercises = physiotherapy.activeExercises
    ..passiveExercises = physiotherapy.passiveExercises
    ..assistedExercises = physiotherapy.assistedExercises
    ..bandage = physiotherapy.bandage
    ..homework = physiotherapy.homework
    ..footwearChange = physiotherapy.footwearChange
    ..isometricMmss = physiotherapy.isometricMmss
    ..isometricMmii = physiotherapy.isometricMmii
    ..isometricAbd = physiotherapy.isometricAbd
    ..isometricOther = physiotherapy.isometricOther
    ..tens = physiotherapy.tens
    ..fes = physiotherapy.fes
    ..ultrasound = physiotherapy.ultrasound;
}
