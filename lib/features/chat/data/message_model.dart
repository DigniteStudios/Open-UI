
class Message {
  final String? msg;
  final String? uid;
  final DateTime? createdAt;

  Message({
    this.msg,
    this.uid,
    this.createdAt,
  });

  // factory Message.fromFirestore(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //   return Message(
  //       msg: data['msg'],
  //       uid: data['uid'],
  //       createdAt: data['created_at'] is Timestamp
  //           ? (data['created_at'] as Timestamp).toDate()
  //           : null
  //   );
  // }
  //
  // Map<String, dynamic> toFirestore() {
  //   return {
  //     if (msg != null) "msg": msg,
  //     if (uid != null) "uid": uid,
  //     if (createdAt != null) "created_at": Timestamp.fromDate(createdAt!),
  //   };
  // }
}