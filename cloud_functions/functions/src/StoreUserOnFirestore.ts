import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

export const StoreUserOnFirestore = functions.auth.user().onCreate(async (user) => {
	// Get only the name and the last name of the email and then uppercase the first letter !
	var firstName = user.email!.split("@")[0].split(".")[0].charAt(0).toUpperCase() + user.email!.split("@")[0].split(".")[0].slice(1)
	var lastName = user.email!.split("@")[0].split(".")[1].charAt(0).toUpperCase() + user.email!.split("@")[0].split(".")[1].slice(1)

	await admin.firestore().doc(`Users/${user.uid}`).create({
		firebaseID: user.uid,
		email: user.email,
		role: "Student",
		firstName: firstName,
		lastName: lastName,
		appointementList: [],
		currentCredits: 0,
		gpa: 0,
		maxAvailable: 60,
		phoneNumber: user.phoneNumber,
		subscribedProject: [],
		subscribedUnit: [],
		userID: "",
	});
});
