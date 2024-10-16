import '/src/core/models/patient_model.dart';
import '/src/core/models/user_model.dart';
import '/src/core/utils/helpers.dart';

class Records {
  String? id;
  DateTime date;
  String therapist;
  String certificate;
  String patient;
  bool isMale;
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
    required this.isMale,
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
        isMale: patient.isMale,
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

  Records copy() => Records(
        id: id,
        date: date,
        therapist: therapist,
        certificate: certificate,
        patient: patient,
        isMale: isMale,
        isPhysiotherapy: isPhysiotherapy,
        vitalSigns: vitalSigns.copy(),
        warmUp: warmUp.copy(),
        barrel: barrel.copy(),
        cadillac: cadillac.copy(),
        stepChair: stepChair.copy(),
        reformer: reformer.copy(),
        columpio: columpio.copy(),
        solo: solo.copy(),
        accessories: accessories.copy(),
        physiotherapy: physiotherapy.copy(),
        intercurrences: intercurrences,
        comments: comments,
      );

  bool isEqual(Records records, {bool considerDefaults = true}) => [
        date == records.date,
        therapist == records.therapist,
        certificate == records.certificate,
        considerDefaults ? patient == records.patient : true,
        considerDefaults ? isMale == records.isMale : true,
        considerDefaults ? isPhysiotherapy == records.isPhysiotherapy : true,
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
        considerDefaults ? intercurrences == records.intercurrences : true,
        comments == records.comments,
      ].every((element) => element);

  Records getChanges(Records records) => Records(
        id: id,
        date: date,
        therapist: therapist,
        certificate: certificate,
        patient: records.patient,
        isMale: records.isMale,
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
        comments: getDefaultValue(comments, records.comments),
      );

  void updateWith(Records records) => this
    ..id = records.id
    ..date = records.date
    ..therapist = records.therapist
    ..certificate = records.certificate
    ..patient = records.patient
    ..isMale = records.isMale
    ..isPhysiotherapy = records.isPhysiotherapy
    ..vitalSigns.updateWith(records.vitalSigns)
    ..warmUp.updateWith(records.warmUp)
    ..barrel.updateWith(records.barrel)
    ..cadillac.updateWith(records.cadillac)
    ..stepChair.updateWith(records.stepChair)
    ..reformer.updateWith(records.reformer)
    ..columpio.updateWith(records.columpio)
    ..solo.updateWith(records.solo)
    ..accessories.updateWith(records.accessories)
    ..physiotherapy.updateWith(records.physiotherapy)
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

  VitalSigns copy() => VitalSigns(
        pressure: pressure,
        heartRate: heartRate,
        oxygenSaturation: oxygenSaturation,
      );

  bool isEqual(VitalSigns vitalSigns) => [
        pressure == vitalSigns.pressure,
        heartRate == vitalSigns.heartRate,
        oxygenSaturation == vitalSigns.oxygenSaturation,
      ].every((element) => element);

  VitalSigns getChanges(VitalSigns vitalSigns) => VitalSigns(
        pressure: getDefaultValue(pressure, vitalSigns.pressure),
        heartRate: getDefaultValue(heartRate, vitalSigns.heartRate),
        oxygenSaturation: getDefaultValue(
          oxygenSaturation,
          vitalSigns.oxygenSaturation,
        ),
      );

  void updateWith(VitalSigns vitalSigns) => this
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

  WarmUp copy() => WarmUp(
        functionalAerobic: functionalAerobic,
        plyometricReformer: plyometricReformer,
        plyometricWall: plyometricWall,
        swimmingSolo: swimmingSolo,
        swimmingBarrel: swimmingBarrel,
        hundredSolo: hundredSolo,
        hundredReformer: hundredReformer,
        other: other,
      );

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
        functionalAerobic: getDefaultValue(
          functionalAerobic,
          warmUp.functionalAerobic,
        ),
        plyometricReformer: getDefaultValue(
          plyometricReformer,
          warmUp.plyometricReformer,
        ),
        plyometricWall: getDefaultValue(plyometricWall, warmUp.plyometricWall),
        swimmingSolo: getDefaultValue(swimmingSolo, warmUp.swimmingSolo),
        swimmingBarrel: getDefaultValue(swimmingBarrel, warmUp.swimmingBarrel),
        hundredSolo: getDefaultValue(hundredSolo, warmUp.hundredSolo),
        hundredReformer: getDefaultValue(
          hundredReformer,
          warmUp.hundredReformer,
        ),
        other: getDefaultValue(other, warmUp.other),
      );

  void updateWith(WarmUp warmUp) => this
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

  Exercises copy() => Exercises(
        stretchCadAnt: stretchCadAnt,
        stretchCadPost: stretchCadPost,
        stretchCadLat: stretchCadLat,
        stretchCadCross: stretchCadCross,
        stretchMmii: stretchMmii,
        stretchMmss: stretchMmss,
        strengthMmii: strengthMmii,
        strengthMmss: strengthMmss,
        strengthAbd: strengthAbd,
        strengthPara: strengthPara,
        mobilitySpine: mobilitySpine,
        mobilityShoulder: mobilityShoulder,
        mobilityHip: mobilityHip,
        mobilityAnkle: mobilityAnkle,
        mobilityWrist: mobilityWrist,
        relaxation: relaxation,
        motorCoordination: motorCoordination,
        balance: balance,
        proprioception: proprioception,
        other: other,
      );

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
        stretchCadAnt: getDefaultValue(stretchCadAnt, exercises.stretchCadAnt),
        stretchCadPost: getDefaultValue(
          stretchCadPost,
          exercises.stretchCadPost,
        ),
        stretchCadLat: getDefaultValue(stretchCadLat, exercises.stretchCadLat),
        stretchCadCross: getDefaultValue(
          stretchCadCross,
          exercises.stretchCadCross,
        ),
        stretchMmii: getDefaultValue(stretchMmii, exercises.stretchMmii),
        stretchMmss: getDefaultValue(stretchMmss, exercises.stretchMmss),
        strengthMmii: getDefaultValue(strengthMmii, exercises.strengthMmii),
        strengthMmss: getDefaultValue(strengthMmss, exercises.strengthMmss),
        strengthAbd: getDefaultValue(strengthAbd, exercises.strengthAbd),
        strengthPara: getDefaultValue(strengthPara, exercises.strengthPara),
        mobilitySpine: getDefaultValue(mobilitySpine, exercises.mobilitySpine),
        mobilityShoulder: getDefaultValue(
          mobilityShoulder,
          exercises.mobilityShoulder,
        ),
        mobilityHip: getDefaultValue(mobilityHip, exercises.mobilityHip),
        mobilityAnkle: getDefaultValue(mobilityAnkle, exercises.mobilityAnkle),
        mobilityWrist: getDefaultValue(mobilityWrist, exercises.mobilityWrist),
        relaxation: getDefaultValue(relaxation, exercises.relaxation),
        motorCoordination: getDefaultValue(
          motorCoordination,
          exercises.motorCoordination,
        ),
        balance: getDefaultValue(balance, exercises.balance),
        proprioception: getDefaultValue(
          proprioception,
          exercises.proprioception,
        ),
        other: getDefaultValue(other, exercises.other),
      );

  void updateWith(Exercises exercises) => this
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
  double? shinGuard;

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
    this.shinGuard,
  });

  Accessories copy() => Accessories(
        ball: ball,
        bosu: bosu,
        comboBox: comboBox,
        proprioceptionDisk: proprioceptionDisk,
        pushUpSupport: pushUpSupport,
        foamRoller: foamRoller,
        myofascialRoller: myofascialRoller,
        beanBag: beanBag,
        pilatesRing: pilatesRing,
        pilatesWheel: pilatesWheel,
        abdominalWheel: abdominalWheel,
        stressBall: stressBall,
        massager: massager,
        baton: baton,
        elasticBand: elasticBand,
        dumbbell: dumbbell,
        tonningBall: tonningBall,
        shinGuard: shinGuard,
      );

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
        shinGuard == accessories.shinGuard,
      ].every((element) => element);

  Accessories getChanges(Accessories accessories) => Accessories(
        ball: getDefaultValue(ball, accessories.ball),
        bosu: getDefaultValue(bosu, accessories.bosu),
        comboBox: getDefaultValue(comboBox, accessories.comboBox),
        proprioceptionDisk: getDefaultValue(
          proprioceptionDisk,
          accessories.proprioceptionDisk,
        ),
        pushUpSupport: getDefaultValue(
          pushUpSupport,
          accessories.pushUpSupport,
        ),
        foamRoller: getDefaultValue(foamRoller, accessories.foamRoller),
        myofascialRoller: getDefaultValue(
          myofascialRoller,
          accessories.myofascialRoller,
        ),
        beanBag: getDefaultValue(beanBag, accessories.beanBag),
        pilatesRing: getDefaultValue(pilatesRing, accessories.pilatesRing),
        pilatesWheel: getDefaultValue(pilatesWheel, accessories.pilatesWheel),
        abdominalWheel: getDefaultValue(
          abdominalWheel,
          accessories.abdominalWheel,
        ),
        stressBall: getDefaultValue(stressBall, accessories.stressBall),
        massager: getDefaultValue(massager, accessories.massager),
        baton: getDefaultValue(baton, accessories.baton),
        elasticBand: getDefaultValue(elasticBand, accessories.elasticBand),
        dumbbell: getDefaultValue(dumbbell, accessories.dumbbell),
        tonningBall: getDefaultValue(tonningBall, accessories.tonningBall),
        shinGuard: getDefaultValue(shinGuard, accessories.shinGuard),
      );

  void updateWith(Accessories accessories) => this
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
    ..tonningBall = accessories.tonningBall
    ..shinGuard = accessories.shinGuard;
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

  Physiotherapy copy() => Physiotherapy(
        stretching: stretching,
        cryotherapy: cryotherapy,
        thermotherapy: thermotherapy,
        gaitTraining: gaitTraining,
        jointMobilization: jointMobilization,
        massotherapy: massotherapy,
        williams: williams,
        codman: codman,
        mckenzie: mckenzie,
        klapp: klapp,
        rpg: rpg,
        muscleStrengthening: muscleStrengthening,
        activeExercises: activeExercises,
        passiveExercises: passiveExercises,
        assistedExercises: assistedExercises,
        bandage: bandage,
        homework: homework,
        footwearChange: footwearChange,
        isometricMmss: isometricMmss,
        isometricMmii: isometricMmii,
        isometricAbd: isometricAbd,
        isometricOther: isometricOther,
        tens: tens,
        fes: fes,
        ultrasound: ultrasound,
      );

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
        stretching: getDefaultValue(stretching, physiotherapy.stretching),
        cryotherapy: getDefaultValue(cryotherapy, physiotherapy.cryotherapy),
        thermotherapy: getDefaultValue(
          thermotherapy,
          physiotherapy.thermotherapy,
        ),
        gaitTraining: getDefaultValue(gaitTraining, physiotherapy.gaitTraining),
        jointMobilization: getDefaultValue(
          jointMobilization,
          physiotherapy.jointMobilization,
        ),
        massotherapy: getDefaultValue(massotherapy, physiotherapy.massotherapy),
        williams: getDefaultValue(williams, physiotherapy.williams),
        codman: getDefaultValue(codman, physiotherapy.codman),
        mckenzie: getDefaultValue(mckenzie, physiotherapy.mckenzie),
        klapp: getDefaultValue(klapp, physiotherapy.klapp),
        rpg: getDefaultValue(rpg, physiotherapy.rpg),
        muscleStrengthening: getDefaultValue(
          muscleStrengthening,
          physiotherapy.muscleStrengthening,
        ),
        activeExercises: getDefaultValue(
          activeExercises,
          physiotherapy.activeExercises,
        ),
        passiveExercises: getDefaultValue(
          passiveExercises,
          physiotherapy.passiveExercises,
        ),
        assistedExercises: getDefaultValue(
          assistedExercises,
          physiotherapy.assistedExercises,
        ),
        bandage: getDefaultValue(bandage, physiotherapy.bandage),
        homework: getDefaultValue(homework, physiotherapy.homework),
        footwearChange: getDefaultValue(
          footwearChange,
          physiotherapy.footwearChange,
        ),
        isometricMmss: getDefaultValue(
          isometricMmss,
          physiotherapy.isometricMmss,
        ),
        isometricMmii: getDefaultValue(
          isometricMmii,
          physiotherapy.isometricMmii,
        ),
        isometricAbd: getDefaultValue(isometricAbd, physiotherapy.isometricAbd),
        isometricOther: getDefaultValue(
          isometricOther,
          physiotherapy.isometricOther,
        ),
        tens: getDefaultValue(tens, physiotherapy.tens),
        fes: getDefaultValue(fes, physiotherapy.fes),
        ultrasound: getDefaultValue(ultrasound, physiotherapy.ultrasound),
      );

  void updateWith(Physiotherapy physiotherapy) => this
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
