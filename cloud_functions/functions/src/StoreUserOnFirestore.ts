import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

export const StoreUserOnFirestore = functions.auth.user().onCreate(async (user) => {
	await admin.firestore().doc(`users/${user.uid}`).create({ email: user.email, isAdmin: false });
});
