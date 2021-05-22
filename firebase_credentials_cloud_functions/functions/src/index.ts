// import * as functions from "firebase-functions";
import * as admin from 'firebase-admin';
admin.initializeApp();

export * from './modules/onCreateUser';
export * from './modules/onCreatePassword';

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
