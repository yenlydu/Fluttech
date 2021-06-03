import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const runtimeOpts = {
	timeoutSeconds: 30,
};

export const Start = functions.runWith(runtimeOpts).https.onCall(async (data, context) => {
	try {
		const auth = admin.auth();
		// Creates the user first
		await auth.createUser({
			displayName: "Jean",
			email: "Jean.student@epitech.eu",
			password: "jeanPassword",
			phoneNumber: "+33621458963",
			photoURL: null,
			disabled: true,
		});
		await auth.createUser({
			displayName: "admin",
			email: "admin.admin@epitech.eu",
			password: "adminPassword",
			phoneNumber: "+33621458563",
			photoURL: null,
			disabled: true,
		});
		await auth.createUser({
			displayName: "Scarlet",
			email: "Scarlet.teacher@epitech.eu",
			password: "scarletPassword",
			phoneNumber: "+33621458963",
			photoURL: null,
			disabled: true,
		});
		await admin
			.firestore()
			.collection(`Units`)
			.add({
				appointementList: [],
				creditAvailable: 15,
				description: "Example of module description",
				id: "",
				name: "Example of module name",
				projectList: [],
				registerEnd: Math.round(new Date().getTime() / 1000),
				skillsToBeAcquired: [],
				teachers: [],
				unitStart: Math.round(new Date().getTime() / 1000),
				unitEnd: Math.round(new Date().getTime() / 1000),
				managerCreatorID: "",
				managerCreatorName: "",
				usersID: [],
			})
			.catch((error) => {
				console.log("l'error :", error);
				return error;
			});
		var unitId;
		const snapshot = await admin.firestore().collection("Units").where("name", "==", name).get();
		snapshot.forEach((doc) => {
			unitId = doc.id;
			admin.firestore().collection(`Units`).doc(`${doc.id}`).update({
				id: doc.id,
			});
		});
		await admin
			.firestore()
			.collection(`Projects`)
			.add({
				appointementList: [],
				description: "This is an example of the project description",
				id: "",
				name: "Example Project",
				registerEnd: Math.round(new Date().getTime() / 1000),
				projectStart: Math.round(new Date().getTime() / 1000),
				projectEnd: Math.round(new Date().getTime() / 1000),
				usersID: [],
				unitID: unitId,
			})
			.catch((error) => {
				console.log(error);
				return error;
			});
		const snapshot2 = await admin.firestore().collection(`Projects`).where("name", "==", name).get();
		snapshot2.forEach(async (project) => {
			await admin
				.firestore()
				.collection(`Projects`)
				.doc(`${project.id}`)
				.update({
					id: project.id,
				})
				.catch((error) => {
					console.log(error);
					return error;
				});
			await admin
				.firestore()
				.collection(`Units/`)
				.doc(`${unitId}`)
				.update({
					projectList: admin.firestore.FieldValue.arrayUnion(project.id),
				})
				.catch((error) => {
					console.log(error);
					return error;
				});
		});
		return "all done";
		// 	});
	} catch (err) {
		// }
		return { message: `${err.code} - ${err.message}` };
	}
});

export const Start2 = functions.runWith(runtimeOpts).https.onRequest(async (data, res) => {
	try {
		const auth = admin.auth();
		// Creates the user first
		await auth.createUser({
			displayName: "Jean",
			email: "Jean.student@epitech.eu",
			password: "jeanPassword",
			phoneNumber: "+33621458963",
			photoURL: undefined,
			disabled: false,
		});
		await auth.createUser({
			displayName: "admin",
			email: "admin.admin@epitech.eu",
			password: "adminPassword",
			phoneNumber: "+33621458563",
			photoURL: undefined,
			disabled: false,
		});
		await auth.createUser({
			displayName: "Scarlet",
			email: "Scarlet.teacher@epitech.eu",
			password: "scarletPassword",
			phoneNumber: "+33671458963",
			photoURL: undefined,
			disabled: false,
		});
		await admin
			.firestore()
			.collection(`Units`)
			.add({
				appointementList: [],
				creditAvailable: 15,
				description: "Example of module description",
				id: "",
				name: "Example of module name",
				projectList: [],
				registerEnd: Math.round(new Date().getTime() / 1000),
				skillsToBeAcquired: [],
				teachers: [],
				unitStart: Math.round(new Date().getTime() / 1000),
				unitEnd: Math.round(new Date().getTime() / 1000),
				managerCreatorID: "",
				managerCreatorName: "",
				usersID: [],
			})
			.catch((error) => {
				console.log("l'error :", error);
				res.send(error);
			});
		var unitId;
		const snapshot = await admin.firestore().collection("Units").where("name", "==", "Example of module name").get();
		snapshot.forEach((doc) => {
			unitId = doc.id;
			admin.firestore().collection(`Units`).doc(`${doc.id}`).update({
				id: doc.id,
			});
		});
		await admin
			.firestore()
			.collection(`Projects`)
			.add({
				appointementList: [],
				description: "This is an example of the project description",
				id: "",
				name: "Example Project",
				registerEnd: Math.round(new Date().getTime() / 1000),
				projectStart: Math.round(new Date().getTime() / 1000),
				projectEnd: Math.round(new Date().getTime() / 1000),
				usersID: [],
				unitID: unitId,
			})
			.catch((error) => {
				console.log(error);
				res.send(error);
			});
		const snapshot2 = await admin.firestore().collection(`Projects`).where("name", "==", "Example Project").get();
		snapshot2.forEach(async (project) => {
			await admin
				.firestore()
				.collection(`Projects`)
				.doc(`${project.id}`)
				.update({
					id: project.id,
				})
				.catch((error) => {
					console.log(error);
					res.send(error);
				});
			await admin
				.firestore()
				.collection(`Units/`)
				.doc(`${unitId}`)
				.update({
					projectList: admin.firestore.FieldValue.arrayUnion(project.id),
				})
				.catch((error) => {
					console.log(error);
					res.send(error);
				});
		});
		res.send("all done");
		// 	});
	} catch (err) {
		// }
		res.send({ message: `${err.code} - ${err.message}` });
	}
});
