class Records {
  final String id;
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

  const Records({
    required this.id,
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
}
