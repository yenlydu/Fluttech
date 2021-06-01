import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

export const onDeleteUser = functions.auth.user().onDelete(async (user) => {
	await admin.firestore().doc(`users/${user.uid}`).delete();
});
