// import '../../model/user_model.dart';
//
// Future<UserModel> getUserProfile(){
//   UserModel model = UserModel();
//   val currentUID = auth.currentID;
//   val data = await Firestore.instance
//       .collection('users')
//       .document('${currentUID}')
//       .get()
//   if(data.exists){
//     return model;
//   }else if(data.data().length){
//     return model;
//   }
//   model = model.copyWith(data.data());
//   return model;
// }
// class ConsignmentModel {
//   bool hasConsignment = false;
//   Timestamp time;
//   String consignmentType = "";
//   String clientName = "";
//   String salesOrderNo = "";
//   String consignmentNo = "";
//   List<Photos> photos = [];
//   String podName = "";
//   String podSignature = "";
//   List<File> photosLocalFile = [];
//   Uint8List signatureLocalFile;
//   ConsignmentModel({
//     this.hasConsignment,
//     this.time,
//     this.consignmentType,
//     this.clientName,
//     this.salesOrderNo,
//     this.consignmentNo,
//     this.photos,
//     this.podName,
//     this.podSignature,
//     this.photosLocalFile,
//     this.signatureLocalFile,
//   });
//   ConsignmentModel.fromJson(Map<String, dynamic> valueMap) {
//     print("fromStringJson-----> \n${valueMap}");
//     hasConsignment = valueMap['hasConsignment'];
//     time = valueMap['time'];
//     consignmentType = valueMap['consignmentType'];
//     clientName = valueMap['clientName'];
//     consignmentNo = valueMap['consignmentNo'];
//     salesOrderNo = valueMap['salesOrderNo'];
//     if (valueMap['photos'] != null) {
//       photos = valueMap['photos'];
//     }
//     podName = valueMap['podName'];
//     if (valueMap['podSignature'] != null) {
//       podSignature = valueMap['podSignature'];
//     }
//     //print("toMap-------> ${data}");
//   }
//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['hasConsignment'] = this.hasConsignment;
//     data['time'] = this.time;
//     if (this.hasConsignment) {
//       data['consignmentType'] = this.consignmentType.toLowerCase();
//       data['clientName'] = this.clientName;
//       data['salesOrderNo'] = this.salesOrderNo;
//       data['consignmentNo'] = this.consignmentNo;
//       if (this.photos != null) {
//         data['photos'] = this.photos.map((element) => element.toMap()).toList();
//       }
//       //this.photos.toMap();
//       data['podName'] = this.podName;
//       data['podSignature'] = this.podSignature;
//     }
//     print("toMap-------> ${data}");
//     return data;
//   }
// }Future<UserModel> getUserProfile(){
//   UserModel model = UserModel();
//   val currentUID = auth.currentID;
//   val data = await Firestore.instance
//       .collection('users')
//       .document('${currentUID}')
//       .get()
//   if(data.exists){
//     return model;
//   }else if(data.data().length){
//     return model;
//   }
//   model = model.copyWith(data.data());
//   return model;
// }
// class ConsignmentModel {
//   bool hasConsignment = false;
//   Timestamp time;
//   String consignmentType = "";
//   String clientName = "";
//   String salesOrderNo = "";
//   String consignmentNo = "";
//   List<Photos> photos = [];
//   String podName = "";
//   String podSignature = "";
//   List<File> photosLocalFile = [];
//   Uint8List signatureLocalFile;
//   ConsignmentModel({
//     this.hasConsignment,
//     this.time,
//     this.consignmentType,
//     this.clientName,
//     this.salesOrderNo,
//     this.consignmentNo,
//     this.photos,
//     this.podName,
//     this.podSignature,
//     this.photosLocalFile,
//     this.signatureLocalFile,
//   });
//   ConsignmentModel.fromJson(Map<String, dynamic> valueMap) {
//     print("fromStringJson-----> \n${valueMap}");
//     hasConsignment = valueMap['hasConsignment'];
//     time = valueMap['time'];
//     consignmentType = valueMap['consignmentType'];
//     clientName = valueMap['clientName'];
//     consignmentNo = valueMap['consignmentNo'];
//     salesOrderNo = valueMap['salesOrderNo'];
//     if (valueMap['photos'] != null) {
//       photos = valueMap['photos'];
//     }
//     podName = valueMap['podName'];
//     if (valueMap['podSignature'] != null) {
//       podSignature = valueMap['podSignature'];
//     }
//     //print("toMap-------> ${data}");
//   }
//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['hasConsignment'] = this.hasConsignment;
//     data['time'] = this.time;
//     if (this.hasConsignment) {
//       data['consignmentType'] = this.consignmentType.toLowerCase();
//       data['clientName'] = this.clientName;
//       data['salesOrderNo'] = this.salesOrderNo;
//       data['consignmentNo'] = this.consignmentNo;
//       if (this.photos != null) {
//         data['photos'] = this.photos.map((element) => element.toMap()).toList();
//       }
//       //this.photos.toMap();
//       data['podName'] = this.podName;
//       data['podSignature'] = this.podSignature;
//     }
//     print("toMap-------> ${data}");
//     return data;
//   }
// }
