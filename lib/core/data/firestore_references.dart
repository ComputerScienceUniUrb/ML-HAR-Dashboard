import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreReference {
  static CollectionReference get sessionsCollection =>
      FirebaseFirestore.instance.collection('sessions');

  static DocumentReference sessionDoc(String sessionId) {
    return sessionsCollection.doc(sessionId);
  }

  static CollectionReference get tracksCollection =>
      FirebaseFirestore.instance.collection('tracks');

  static DocumentReference trackDoc(String trackId) {
    return tracksCollection.doc(trackId);
  }

  static CollectionReference get tensorFlowModelCollection =>
      FirebaseFirestore.instance.collection('tf_models');

  static DocumentReference tensorFlowModelDoc(String modelId) {
    return tensorFlowModelCollection.doc(modelId);
  }

  static CollectionReference sessionStepsCollection(String sessionId) =>
      sessionDoc(sessionId).collection('steps');

  static DocumentReference stepDoc(String sessionId, String stepId) {
    return sessionStepsCollection(sessionId).doc(stepId);
  }

  static CollectionReference sessionPlayersCollection(String sessionId) =>
      sessionDoc(sessionId).collection('players');

  static playerDoc(String sessionId, String playerId) {
    return sessionPlayersCollection(sessionId).doc(playerId);
  }
}
