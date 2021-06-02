import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const runtimeOpts = {
	timeoutSeconds: 30,
};

// Find a user by his email
export const getUserByEmail = functions.runWith(runtimeOpts).https.onCall(async (data, context) => {
	const { email } = data;
	var user;
	const snapshot = await admin.firestore().collection("Users").where("email", "==", email.toLowerCase()).get();
	snapshot.forEach((doc) => {
		user = doc.data().firebaseID;
	});
	console.log(user);
	if (user) return(user);
	else return("No user found !");
});

// Create user in Auth
export const createUser = functions.https.onCall(async (data, context) => {
	const { displayName, email, phoneNumber, photoURL, disabled, emailVerified, password } = data;

	console.log("Adding user", email);

	if (!email || !password) {
		return({ message: "Missing fields" });
	}

	try {
		const auth = admin.auth();

		// Creates the user first
		const user = await auth.createUser({
			displayName,
			email,
			password,
			phoneNumber,
			photoURL,
			disabled,
			emailVerified,
		});

		//  the newely created user record
		return(user);
	} catch (err) {
		return({ message: `${err.code} - ${err.message}` });
	}
});

// Store user in firestore after created
export const StoreUserOnFirestore = functions.auth.user().onCreate(async (user) => {
	// Get only the name and the last name of the email and then uppercase the first letter !
	var firstName = user.email!.split("@")[0].split(".")[0].charAt(0).toUpperCase() + user.email!.split("@")[0].split(".")[0].slice(1);
	var lastName = user.email!.split("@")[0].split(".")[1].charAt(0).toUpperCase() + user.email!.split("@")[0].split(".")[1].slice(1);

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
	});
});

// Delete user
export const onDeleteUser = functions.auth.user().onDelete(async (user) => {
	await admin.firestore().doc(`users/${user.uid}`).delete();
});

// Register user to unit
export const addUserToUnit = functions.runWith(runtimeOpts).https.onCall(async (data, context) => {
	const { unitID, userID } = data;
	await admin
		.firestore()
		.collection("Units")
		.doc(`${unitID}`)
		.update({
			usersID: admin.firestore.FieldValue.arrayUnion(userID),
		});
	await admin
		.firestore()
		.collection("Users")
		.doc(`${userID}`)
		.update({
			subscribedUnit: admin.firestore.FieldValue.arrayUnion(unitID),
		});
	return("User successfully added to unit");
});

// Remove user to unit
export const deleteUserToUnit = functions.runWith(runtimeOpts).https.onCall(async (data, context) => {
	const { unitID, userID } = data;
	await admin
		.firestore()
		.collection("Units")
		.doc(`${unitID}`)
		.update({
			usersID: admin.firestore.FieldValue.arrayRemove(userID),
		});
	return("User successfully removed to unit");
});

// Register user to project
export const addUserToProject = functions.runWith(runtimeOpts).https.onCall(async (data, context) => {
	const { userID, projectID } = data;
	await admin
		.firestore()
		.collection(`Projects`)
		.doc(`${projectID}`)
		.update({
			usersID: admin.firestore.FieldValue.arrayUnion(userID),
		})
		.catch((error) => {
			console.log(error);
		});
	await admin
		.firestore()
		.collection("Users")
		.doc(`${userID}`)
		.update({
			subscribedUnit: admin.firestore.FieldValue.arrayUnion(projectID),
		})
		.catch((error) => {
			console.log(error);
		});

	return("User successfully added to project");
});

// remove user to project
export const removeUserToProject = functions.runWith(runtimeOpts).https.onCall(async (data, context) => {
	const { userID, projectID } = data;
	await admin
		.firestore()
		.collection(`Projects`)
		.doc(`${projectID}`)
		.update({
			usersID: admin.firestore.FieldValue.arrayRemove(userID),
		})
		.catch((error) => {
			console.log(error);
		});
	return("User successfully removed to project");
});
