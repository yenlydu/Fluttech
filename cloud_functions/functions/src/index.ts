import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();

export * from "./onCreateUser";
export * from "./onDeleteUser";
export * from "./StoreUserOnFirestore";
export * from "./Units";

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//

export const helloWorld = functions.https.onRequest((request, response) => {
	functions.logger.info("Hello logs!", { structuredData: true });
	response.send("testdqdsdqsdqdqd from Firebase !");
});
