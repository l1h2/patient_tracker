import '/src/core/models/records_model.dart' as model;

class RecordsDocument {
  final String? id;
  final DateTime date;
  final String therapist;
  final String certificate;
  final String patient;
  final bool? isMale;
  final bool? isPhysiotherapy;
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
  final bool? intercurrences;
  final String? comments;

  const RecordsDocument({
    this.id,
    required this.date,
    required this.therapist,
    required this.certificate,
    required this.patient,
    this.isMale,
    this.isPhysiotherapy,
    required this.vitalSigns,
    required this.warmUp,
    required this.barrel,
    required this.cadillac,
    required this.stepChair,
    required this.reformer,
    required this.columpio,
    required this.solo,
    required this.accessories,
    required this.physiotherapy,
    this.intercurrences,
    this.comments,
  });

  factory RecordsDocument.fromMap(Map<String, dynamic> map) => RecordsDocument(
        id: map[RecordAttrs.id],
        date: map[RecordAttrs.date],
        therapist: map[RecordAttrs.therapist],
        certificate: map[RecordAttrs.certificate],
        patient: map[RecordAttrs.patient],
        isMale: map[RecordAttrs.isMale],
        isPhysiotherapy: map[RecordAttrs.isPhysiotherapy],
        vitalSigns: VitalSigns.fromMap(map[RecordAttrs.vitalSigns]),
        warmUp: WarmUp.fromMap(map[RecordAttrs.warmUp]),
        barrel: Exercises.fromMap(map[RecordAttrs.barrel]),
        cadillac: Exercises.fromMap(map[RecordAttrs.cadillac]),
        stepChair: Exercises.fromMap(map[RecordAttrs.stepChair]),
        reformer: Exercises.fromMap(map[RecordAttrs.reformer]),
        columpio: Exercises.fromMap(map[RecordAttrs.columpio]),
        solo: Exercises.fromMap(map[RecordAttrs.solo]),
        accessories: Accessories.fromMap(map[RecordAttrs.accessories]),
        physiotherapy: Physiotherapy.fromMap(map[RecordAttrs.physiotherapy]),
        intercurrences: map[RecordAttrs.intercurrences],
        comments: map[RecordAttrs.observations],
      );

  RecordsDocument copyWith({required Map<String, dynamic> newAttrs}) {
    if (newAttrs.isEmpty) {
      return this;
    }

    return RecordsDocument(
      id: newAttrs[RecordAttrs.id] ?? id,
      date: newAttrs[RecordAttrs.date] ?? date,
      therapist: newAttrs[RecordAttrs.therapist] ?? therapist,
      certificate: newAttrs[RecordAttrs.certificate] ?? certificate,
      patient: newAttrs[RecordAttrs.patient] ?? patient,
      isMale: newAttrs[RecordAttrs.isMale] ?? isMale,
      isPhysiotherapy: newAttrs[RecordAttrs.isPhysiotherapy] ?? isPhysiotherapy,
      vitalSigns: newAttrs[RecordAttrs.vitalSigns] ?? vitalSigns,
      warmUp: newAttrs[RecordAttrs.warmUp] ?? warmUp,
      barrel: newAttrs[RecordAttrs.barrel] ?? barrel,
      cadillac: newAttrs[RecordAttrs.cadillac] ?? cadillac,
      stepChair: newAttrs[RecordAttrs.stepChair] ?? stepChair,
      reformer: newAttrs[RecordAttrs.reformer] ?? reformer,
      columpio: newAttrs[RecordAttrs.columpio] ?? columpio,
      solo: newAttrs[RecordAttrs.solo] ?? solo,
      accessories: newAttrs[RecordAttrs.accessories] ?? accessories,
      physiotherapy: newAttrs[RecordAttrs.physiotherapy] ?? physiotherapy,
      intercurrences: newAttrs[RecordAttrs.intercurrences] ?? intercurrences,
      comments: newAttrs[RecordAttrs.observations] ?? comments,
    );
  }

  Map<String, dynamic> toMap() {
    final map = {
      RecordAttrs.date: date,
      RecordAttrs.therapist: therapist,
      RecordAttrs.certificate: certificate,
      RecordAttrs.patient: patient,
      RecordAttrs.isMale: isMale,
      RecordAttrs.isPhysiotherapy: isPhysiotherapy,
      RecordAttrs.vitalSigns: vitalSigns.toMap(),
      RecordAttrs.warmUp: warmUp.toMap(),
      RecordAttrs.barrel: barrel.toMap(),
      RecordAttrs.cadillac: cadillac.toMap(),
      RecordAttrs.stepChair: stepChair.toMap(),
      RecordAttrs.reformer: reformer.toMap(),
      RecordAttrs.columpio: columpio.toMap(),
      RecordAttrs.solo: solo.toMap(),
      RecordAttrs.accessories: accessories.toMap(),
      RecordAttrs.physiotherapy: physiotherapy.toMap(),
      RecordAttrs.intercurrences: intercurrences,
      RecordAttrs.observations: comments,
    };

    map.removeWhere((key, value) => value == null);
    return map;
  }

  model.Records toRecords() => model.Records(
        id: id!,
        date: date,
        therapist: therapist,
        certificate: certificate,
        patient: patient,
        isMale: isMale,
        isPhysiotherapy: isPhysiotherapy,
        vitalSigns: vitalSigns.toModel(),
        warmUp: warmUp.toModel(),
        barrel: barrel.toModel(),
        cadillac: cadillac.toModel(),
        stepChair: stepChair.toModel(),
        reformer: reformer.toModel(),
        columpio: columpio.toModel(),
        solo: solo.toModel(),
        accessories: accessories.toModel(),
        physiotherapy: physiotherapy.toModel(),
        intercurrences: intercurrences,
        comments: comments,
      );
}

class RecordAttrs {
  static const String id = 'id';
  static const String date = 'date';
  static const String therapist = 'therapist';
  static const String certificate = 'certificate';
  static const String patient = 'patient';
  static const String isMale = 'isMale';
  static const String isPhysiotherapy = 'isPhysiotherapy';
  static const String vitalSigns = 'vitalSigns';
  static const String warmUp = 'warmUp';
  static const String barrel = 'barrel';
  static const String cadillac = 'cadillac';
  static const String stepChair = 'stepChair';
  static const String reformer = 'reformer';
  static const String columpio = 'columpio';
  static const String solo = 'solo';
  static const String accessories = 'accessories';
  static const String physiotherapy = 'physiotherapy';
  static const String intercurrences = 'intercurrences';
  static const String observations = 'observations';
}

class VitalSigns {
  final double? pressure;
  final double? cardiacFrequency;
  final double? oxygenSaturation;

  const VitalSigns({
    this.pressure,
    this.cardiacFrequency,
    this.oxygenSaturation,
  });

  factory VitalSigns.fromMap(Map<String, dynamic> map) => VitalSigns(
        pressure: map[VitalSignsAttrs.pressure],
        cardiacFrequency: map[VitalSignsAttrs.cardiacFrequency],
        oxygenSaturation: map[VitalSignsAttrs.oxygenSaturation],
      );

  Map<String, dynamic> toMap() {
    final map = {
      VitalSignsAttrs.pressure: pressure,
      VitalSignsAttrs.cardiacFrequency: cardiacFrequency,
      VitalSignsAttrs.oxygenSaturation: oxygenSaturation,
    };

    map.removeWhere((key, value) => value == null);
    return map;
  }

  model.VitalSigns toModel() => model.VitalSigns(
        pressure: pressure,
        cardiacFrequency: cardiacFrequency,
        oxygenSaturation: oxygenSaturation,
      );
}

class VitalSignsAttrs {
  static const String pressure = 'pressure';
  static const String cardiacFrequency = 'cardiacFrequency';
  static const String respiratoryRate = 'respiratoryRate';
  static const String oxygenSaturation = 'oxygenSaturation';
}

class WarmUp {
  final bool? functionalAerobic;
  final bool? plyometricReformer;
  final bool? plyometricWall;
  final bool? swimmingSolo;
  final bool? swimmingBarrel;
  final bool? hundredSolo;
  final bool? hundredReformer;
  final String? other;

  const WarmUp({
    this.functionalAerobic,
    this.plyometricReformer,
    this.plyometricWall,
    this.swimmingSolo,
    this.swimmingBarrel,
    this.hundredSolo,
    this.hundredReformer,
    this.other,
  });

  factory WarmUp.fromMap(Map<String, dynamic> map) => WarmUp(
        functionalAerobic: map[WarmUpAttrs.functionalAerobic],
        plyometricReformer: map[WarmUpAttrs.plyometricReformer],
        plyometricWall: map[WarmUpAttrs.plyometricWall],
        swimmingSolo: map[WarmUpAttrs.swimmingSolo],
        swimmingBarrel: map[WarmUpAttrs.swimmingBarrel],
        hundredSolo: map[WarmUpAttrs.hundredSolo],
        hundredReformer: map[WarmUpAttrs.hundredReformer],
        other: map[WarmUpAttrs.other],
      );

  Map<String, dynamic> toMap() {
    final map = {
      WarmUpAttrs.functionalAerobic: functionalAerobic,
      WarmUpAttrs.plyometricReformer: plyometricReformer,
      WarmUpAttrs.plyometricWall: plyometricWall,
      WarmUpAttrs.swimmingSolo: swimmingSolo,
      WarmUpAttrs.swimmingBarrel: swimmingBarrel,
      WarmUpAttrs.hundredSolo: hundredSolo,
      WarmUpAttrs.hundredReformer: hundredReformer,
      WarmUpAttrs.other: other,
    };

    map.removeWhere((key, value) => value == null);
    return map;
  }

  model.WarmUp toModel() => model.WarmUp(
        functionalAerobic: functionalAerobic,
        plyometricReformer: plyometricReformer,
        plyometricWall: plyometricWall,
        swimmingSolo: swimmingSolo,
        swimmingBarrel: swimmingBarrel,
        hundredSolo: hundredSolo,
        hundredReformer: hundredReformer,
        other: other,
      );
}

class WarmUpAttrs {
  static const String functionalAerobic = 'functionalAerobic';
  static const String plyometricReformer = 'plyometricReformer';
  static const String plyometricWall = 'plyometricWall';
  static const String swimmingSolo = 'swimmingSolo';
  static const String swimmingBarrel = 'swimmingBarrel';
  static const String hundredSolo = 'hundredSolo';
  static const String hundredReformer = 'hundredReformer';
  static const String other = 'other';
}

class Exercises {
  final bool? stretchCadAnt;
  final bool? stretchCadPost;
  final bool? stretchCadLat;
  final bool? stretchCadCross;
  final bool? stretchMmii;
  final bool? stretchMmss;
  final bool? strengthMmii;
  final bool? strengthMmss;
  final bool? strengthAbd;
  final bool? strengthPara;
  final bool? mobilityColumn;
  final bool? mobilityShoulder;
  final bool? mobilityHip;
  final bool? mobilityAnkle;
  final bool? mobilityWrist;
  final bool? relaxation;
  final bool? motorCoordination;
  final bool? balance;
  final bool? proprioception;
  final String? other;

  const Exercises({
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
    this.mobilityColumn,
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

  factory Exercises.fromMap(Map<String, dynamic> map) => Exercises(
        stretchCadAnt: map[ExercisesAttrs.stretchCadAnt],
        stretchCadPost: map[ExercisesAttrs.stretchCadPost],
        stretchCadLat: map[ExercisesAttrs.stretchCadLat],
        stretchCadCross: map[ExercisesAttrs.stretchCadCross],
        stretchMmii: map[ExercisesAttrs.stretchMmii],
        stretchMmss: map[ExercisesAttrs.stretchMmss],
        strengthMmii: map[ExercisesAttrs.strengthMmii],
        strengthMmss: map[ExercisesAttrs.strengthMmss],
        strengthAbd: map[ExercisesAttrs.strengthAbd],
        strengthPara: map[ExercisesAttrs.strengthPara],
        mobilityColumn: map[ExercisesAttrs.mobilityColumn],
        mobilityShoulder: map[ExercisesAttrs.mobilityShoulder],
        mobilityHip: map[ExercisesAttrs.mobilityHip],
        mobilityAnkle: map[ExercisesAttrs.mobilityAnkle],
        mobilityWrist: map[ExercisesAttrs.mobilityWrist],
        relaxation: map[ExercisesAttrs.relaxation],
        motorCoordination: map[ExercisesAttrs.motorCoordination],
        balance: map[ExercisesAttrs.balance],
        proprioception: map[ExercisesAttrs.proprioception],
        other: map[ExercisesAttrs.other],
      );

  Map<String, dynamic> toMap() {
    final map = {
      ExercisesAttrs.stretchCadAnt: stretchCadAnt,
      ExercisesAttrs.stretchCadPost: stretchCadPost,
      ExercisesAttrs.stretchCadLat: stretchCadLat,
      ExercisesAttrs.stretchCadCross: stretchCadCross,
      ExercisesAttrs.stretchMmii: stretchMmii,
      ExercisesAttrs.stretchMmss: stretchMmss,
      ExercisesAttrs.strengthMmii: strengthMmii,
      ExercisesAttrs.strengthMmss: strengthMmss,
      ExercisesAttrs.strengthAbd: strengthAbd,
      ExercisesAttrs.strengthPara: strengthPara,
      ExercisesAttrs.mobilityColumn: mobilityColumn,
      ExercisesAttrs.mobilityShoulder: mobilityShoulder,
      ExercisesAttrs.mobilityHip: mobilityHip,
      ExercisesAttrs.mobilityAnkle: mobilityAnkle,
      ExercisesAttrs.mobilityWrist: mobilityWrist,
      ExercisesAttrs.relaxation: relaxation,
      ExercisesAttrs.motorCoordination: motorCoordination,
      ExercisesAttrs.balance: balance,
      ExercisesAttrs.proprioception: proprioception,
      ExercisesAttrs.other: other,
    };

    map.removeWhere((key, value) => value == null);
    return map;
  }

  model.Exercises toModel() => model.Exercises(
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
        mobilityColumn: mobilityColumn,
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
}

class ExercisesAttrs {
  static const String stretchCadAnt = 'stretchCadAnt';
  static const String stretchCadPost = 'stretchCadPost';
  static const String stretchCadLat = 'stretchCadLat';
  static const String stretchCadCross = 'stretchCadCross';
  static const String stretchMmii = 'stretchMmii';
  static const String stretchMmss = 'stretchMmss';
  static const String strengthMmii = 'strengthMmii';
  static const String strengthMmss = 'strengthMmss';
  static const String strengthAbd = 'strengthAbd';
  static const String strengthPara = 'strengthPara';
  static const String mobilityColumn = 'mobilityColumn';
  static const String mobilityShoulder = 'mobilityShoulder';
  static const String mobilityHip = 'mobilityHip';
  static const String mobilityAnkle = 'mobilityAnkle';
  static const String mobilityWrist = 'mobilityWrist';
  static const String relaxation = 'relaxation';
  static const String motorCoordination = 'motorCoordination';
  static const String balance = 'balance';
  static const String proprioception = 'proprioception';
  static const String other = 'other';
}

class Accessories {
  final bool? ball;
  final bool? bosu;
  final bool? comboBox;
  final bool? proprioceptionDisk;
  final bool? pushUpSupport;
  final bool? foamRoller;
  final bool? myofascialRoller;
  final bool? beanBag;
  final bool? pilatesRing;
  final bool? pilatesWheel;
  final bool? abdominalWheel;
  final bool? stressBall;
  final bool? massager;
  final bool? baton;
  final bool? elasticBand;
  final int? dumbbell;
  final int? tonningBall;

  const Accessories({
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

  factory Accessories.fromMap(Map<String, dynamic> map) => Accessories(
        ball: map[AccessoriesAttrs.ball],
        bosu: map[AccessoriesAttrs.bosu],
        comboBox: map[AccessoriesAttrs.comboBox],
        proprioceptionDisk: map[AccessoriesAttrs.proprioceptionDisk],
        pushUpSupport: map[AccessoriesAttrs.pushUpSupport],
        foamRoller: map[AccessoriesAttrs.foamRoller],
        myofascialRoller: map[AccessoriesAttrs.myofascialRoller],
        beanBag: map[AccessoriesAttrs.beanBag],
        pilatesRing: map[AccessoriesAttrs.pilatesRing],
        pilatesWheel: map[AccessoriesAttrs.pilatesWheel],
        abdominalWheel: map[AccessoriesAttrs.abdominalWheel],
        stressBall: map[AccessoriesAttrs.stressBall],
        massager: map[AccessoriesAttrs.massager],
        baton: map[AccessoriesAttrs.baton],
        elasticBand: map[AccessoriesAttrs.elasticBand],
        dumbbell: map[AccessoriesAttrs.dumbbell],
        tonningBall: map[AccessoriesAttrs.tonningBall],
      );

  Map<String, dynamic> toMap() {
    final map = {
      AccessoriesAttrs.ball: ball,
      AccessoriesAttrs.bosu: bosu,
      AccessoriesAttrs.comboBox: comboBox,
      AccessoriesAttrs.proprioceptionDisk: proprioceptionDisk,
      AccessoriesAttrs.pushUpSupport: pushUpSupport,
      AccessoriesAttrs.foamRoller: foamRoller,
      AccessoriesAttrs.myofascialRoller: myofascialRoller,
      AccessoriesAttrs.beanBag: beanBag,
      AccessoriesAttrs.pilatesRing: pilatesRing,
      AccessoriesAttrs.pilatesWheel: pilatesWheel,
      AccessoriesAttrs.abdominalWheel: abdominalWheel,
      AccessoriesAttrs.stressBall: stressBall,
      AccessoriesAttrs.massager: massager,
      AccessoriesAttrs.baton: baton,
      AccessoriesAttrs.elasticBand: elasticBand,
      AccessoriesAttrs.dumbbell: dumbbell,
      AccessoriesAttrs.tonningBall: tonningBall,
    };

    map.removeWhere((key, value) => value == null);
    return map;
  }

  model.Accessories toModel() => model.Accessories(
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
      );
}

class AccessoriesAttrs {
  static const String ball = 'ball';
  static const String bosu = 'bosu';
  static const String comboBox = 'comboBox';
  static const String proprioceptionDisk = 'proprioceptionDisk';
  static const String pushUpSupport = 'pushUpSupport';
  static const String foamRoller = 'foamRoller';
  static const String myofascialRoller = 'myofascialRoller';
  static const String beanBag = 'beanBag';
  static const String pilatesRing = 'pilatesRing';
  static const String pilatesWheel = 'pilatesWheel';
  static const String abdominalWheel = 'abdominalWheel';
  static const String stressBall = 'stressBall';
  static const String massager = 'massager';
  static const String baton = 'baton';
  static const String elasticBand = 'elasticBand';
  static const String dumbbell = 'dumbbell';
  static const String tonningBall = 'tonningBall';
}

class Physiotherapy {
  final bool? stretching;
  final bool? cryotherapy;
  final bool? thermotherapy;
  final bool? gaitTraining;
  final bool? jointMobilization;
  final bool? massotherapy;
  final bool? williams;
  final bool? codman;
  final bool? mckenzie;
  final bool? klapp;
  final bool? rpg;
  final bool? muscleStrengthening;
  final bool? activeExercises;
  final bool? passiveExercises;
  final bool? assistedExercises;
  final bool? bandage;
  final bool? homework;
  final bool? footwearChange;
  final bool? isometricMmss;
  final bool? isometricMmii;
  final bool? isometricAbd;
  final String? isometricOther;
  final String? tens;
  final String? fes;
  final String? ultrasound;

  const Physiotherapy({
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

  factory Physiotherapy.fromMap(Map<String, dynamic> map) => Physiotherapy(
        stretching: map[PhysiotherapyAttrs.stretching],
        cryotherapy: map[PhysiotherapyAttrs.cryotherapy],
        thermotherapy: map[PhysiotherapyAttrs.thermotherapy],
        gaitTraining: map[PhysiotherapyAttrs.gaitTraining],
        jointMobilization: map[PhysiotherapyAttrs.jointMobilization],
        massotherapy: map[PhysiotherapyAttrs.massotherapy],
        williams: map[PhysiotherapyAttrs.williams],
        codman: map[PhysiotherapyAttrs.codman],
        mckenzie: map[PhysiotherapyAttrs.mckenzie],
        klapp: map[PhysiotherapyAttrs.klapp],
        rpg: map[PhysiotherapyAttrs.rpg],
        muscleStrengthening: map[PhysiotherapyAttrs.muscleStrengthening],
        activeExercises: map[PhysiotherapyAttrs.activeExercises],
        passiveExercises: map[PhysiotherapyAttrs.passiveExercises],
        assistedExercises: map[PhysiotherapyAttrs.assistedExercises],
        bandage: map[PhysiotherapyAttrs.bandage],
        homework: map[PhysiotherapyAttrs.homework],
        footwearChange: map[PhysiotherapyAttrs.footwearChange],
        isometricMmss: map[PhysiotherapyAttrs.isometricMmss],
        isometricMmii: map[PhysiotherapyAttrs.isometricMmii],
        isometricAbd: map[PhysiotherapyAttrs.isometricAbd],
        isometricOther: map[PhysiotherapyAttrs.isometricOther],
        tens: map[PhysiotherapyAttrs.tens],
        fes: map[PhysiotherapyAttrs.fes],
        ultrasound: map[PhysiotherapyAttrs.ultrasound],
      );

  Map<String, dynamic> toMap() {
    final map = {
      PhysiotherapyAttrs.stretching: stretching,
      PhysiotherapyAttrs.cryotherapy: cryotherapy,
      PhysiotherapyAttrs.thermotherapy: thermotherapy,
      PhysiotherapyAttrs.gaitTraining: gaitTraining,
      PhysiotherapyAttrs.jointMobilization: jointMobilization,
      PhysiotherapyAttrs.massotherapy: massotherapy,
      PhysiotherapyAttrs.williams: williams,
      PhysiotherapyAttrs.codman: codman,
      PhysiotherapyAttrs.mckenzie: mckenzie,
      PhysiotherapyAttrs.klapp: klapp,
      PhysiotherapyAttrs.rpg: rpg,
      PhysiotherapyAttrs.muscleStrengthening: muscleStrengthening,
      PhysiotherapyAttrs.activeExercises: activeExercises,
      PhysiotherapyAttrs.passiveExercises: passiveExercises,
      PhysiotherapyAttrs.assistedExercises: assistedExercises,
      PhysiotherapyAttrs.bandage: bandage,
      PhysiotherapyAttrs.homework: homework,
      PhysiotherapyAttrs.footwearChange: footwearChange,
      PhysiotherapyAttrs.isometricMmss: isometricMmss,
      PhysiotherapyAttrs.isometricMmii: isometricMmii,
      PhysiotherapyAttrs.isometricAbd: isometricAbd,
      PhysiotherapyAttrs.isometricOther: isometricOther,
      PhysiotherapyAttrs.tens: tens,
      PhysiotherapyAttrs.fes: fes,
      PhysiotherapyAttrs.ultrasound: ultrasound,
    };

    map.removeWhere((key, value) => value == null);
    return map;
  }

  model.Physiotherapy toModel() => model.Physiotherapy(
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
}

class PhysiotherapyAttrs {
  static const String stretching = 'stretching';
  static const String cryotherapy = 'cryotherapy';
  static const String thermotherapy = 'thermotherapy';
  static const String gaitTraining = 'gaitTraining';
  static const String jointMobilization = 'jointMobilization';
  static const String massotherapy = 'massotherapy';
  static const String williams = 'williams';
  static const String codman = 'codman';
  static const String mckenzie = 'mckenzie';
  static const String klapp = 'klapp';
  static const String rpg = 'rpg';
  static const String muscleStrengthening = 'muscleStrengthening';
  static const String activeExercises = 'activeExercises';
  static const String passiveExercises = 'passiveExercises';
  static const String assistedExercises = 'assistedExercises';
  static const String bandage = 'bandage';
  static const String homework = 'homework';
  static const String footwearChange = 'footwearChange';
  static const String isometricMmss = 'isometricMmss';
  static const String isometricMmii = 'isometricMmii';
  static const String isometricAbd = 'isometricAbd';
  static const String isometricOther = 'isometricOther';
  static const String tens = 'tens';
  static const String fes = 'fes';
  static const String ultrasound = 'ultrasound';
}
