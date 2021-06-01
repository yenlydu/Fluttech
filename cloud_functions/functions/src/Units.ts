import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const runtimeOpts = {
	timeoutSeconds: 30,
};

// Create new unit
export const addUnit = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { name, creditAvailable, registerEnd, unitStart, unitEnd, description } = req.body;

	await admin
		.firestore()
		.collection(`Units`)
		.add({
			appointementList: [],
			creditAvailable: creditAvailable,
			description: description,
			id: "",
			name: name,
			projectList: [],
			registerEnd: registerEnd,
			skillsToBeAcquired: [],
			teachers: [],
			unitStart: unitStart,
			unitEnd: unitEnd,
			managerCreatorID: "",
			managerCreatorName: "",
			usersID: [],
		})
		.catch((error) => {
			console.log(error);
			res.status(500).send(error);
		});
	const snapshot = await admin.firestore().collection("Units").where("name", "==", name).get();
	snapshot.forEach((doc) => {
		admin.firestore().collection(`Units`).doc(`${doc.id}`).update({
			id: doc.id,
		});
	});
	res.status(200).send(`Successfully added new unit : ${name}`);
});

// Update unit
export const updateUnit = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { unitID, name, creditAvailable, registerEnd, unitStart, unitEnd, description, skillsToBeAcquired, appointementList, managerCreatorID, managerCreatorName } = req.body;

	await admin
		.firestore()
		.collection(`Units`)
		.doc(unitID)
		.update({
			appointementList: appointementList,
			creditAvailable: creditAvailable,
			description: description,
			name: name,
			registerEnd: registerEnd,
			skillsToBeAcquired: skillsToBeAcquired,
			unitStart: unitStart,
			unitEnd: unitEnd,
			managerCreatorID: managerCreatorID,
			managerCreatorName: managerCreatorName,
		})
		.catch((error) => {
			console.log(error);
			res.status(500).send(error);
		});
	res.status(200).send(`Successfully updated unit : ${name}`);
});

// Delete unit
export const deleteUnit = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { unitID } = req.body;
	await admin
		.firestore()
		.collection(`Units`)
		.doc(`${unitID}`)
		.delete()
		.catch((error) => {
			console.log(error);
			res.status(500).send(error);
		});
	res.status(200).send(`Unit successfully deleted`);
});

// Get the list of all units
export const getUnits = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const snapshot = await admin.firestore().collection("Units").get();
	var units = [];
	snapshot.forEach((unit) => {
		units.push(unit.data());
	});
	res.status(200).send(units);
});

// Add a Teacher to unit
export const addTeacherToUnit = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { unitID, teacherID } = req.body;

	await admin
		.firestore()
		.collection(`Units`)
		.doc(unitID)
		.update({
			teachers: admin.firestore.FieldValue.arrayUnion(teacherID),
		})
		.catch((error) => {
			console.log(error);
			res.status(500).send(error);
		});
	res.status(200).send(`Successfully added teacher`);
});

// Remove a Teacher to unit
export const removeTeacherToUnit = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { unitID, teacherID } = req.body;

	await admin
		.firestore()
		.collection(`Units`)
		.doc(unitID)
		.update({
			teachers: admin.firestore.FieldValue.arrayRemove(teacherID),
		})
		.catch((error) => {
			console.log(error);
			res.status(500).send(error);
		});
	res.status(200).send(`Successfully added teacher`);
});
