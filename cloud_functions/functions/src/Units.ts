import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const runtimeOpts = {
	timeoutSeconds: 3,
};

// Create new unit
export const addUnit = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { name, creditAvailable, registerEnd, unitStart, unitEnd } = req.body;

	await admin
		.firestore()
		.collection(`Units`)
		.add({
			appointementList: [],
			creditAvailable: creditAvailable,
			description: "Module description ici !!!!!",
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

// Register user to unit
export const addUserToUnit = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { unitID, userID } = req.body;
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
	res.status(200).send("User successfully added to unit");
});

// Remove user to unit
export const deleteUserToUnit = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { unitID, userID } = req.body;
	await admin
		.firestore()
		.collection("Units")
		.doc(`${unitID}`)
		.update({
			usersID: admin.firestore.FieldValue.arrayRemove(userID),
		});
	res.status(200).send("User successfully removed to unit");
});

// Create new project in unit
export const addProject = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { name, registerEnd, projectStart, projectEnd, unitID, description } = req.body;
	await admin
		.firestore()
		.collection(`Projects`)
		.add({
			appointementList: [],
			description: description,
			id: "",
			name: name,
			registerEnd: registerEnd,
			projectStart: projectStart,
			projectEnd: projectEnd,
			usersID: [],
			unitID: unitID,
		})
		.catch((error) => {
			console.log(error);
			res.status(500).send(error);
		});
	const snapshot = await admin.firestore().collection(`Projects`).where("name", "==", name).get();
	snapshot.forEach(async (project) => {
		await admin
			.firestore()
			.collection(`Projects`)
			.doc(`${project.id}`)
			.update({
				id: project.id,
			})
			.catch((error) => {
				console.log(error);
				res.status(500).send(error);
			});
		await admin
			.firestore()
			.collection(`Units/`)
			.doc(`${unitID}`)
			.update({
				projectList: admin.firestore.FieldValue.arrayUnion(project.id),
			})
			.catch((error) => {
				console.log(error);
				res.status(500).send(error);
			});
	});
	res.status(200).send(`Successfully added new Project : ${name}`);
});

// Update project in unit
export const updateProject = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { name, registerEnd, projectStart, projectEnd, description, appointementList, projectID } = req.body;

	await admin
		.firestore()
		.collection(`Projects`)
		.doc(projectID)
		.update({
			appointementList: appointementList,
			description: description,
			name: name,
			registerEnd: registerEnd,
			projectStart: projectStart,
			projectEnd: projectEnd,
		})
		.catch((error) => {
			console.log(error);
			res.status(500).send(error);
		});
	res.status(200).send(`Successfully updated project : ${name}`);
});

// Delete project in unit
export const deleteProject = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { projectID } = req.body;
	const projectInfo = await admin.firestore().collection(`Projects`).doc(`${projectID}`).get();
	// console.log(projectInfo.data())
	await admin
		.firestore()
		.collection(`Projects`)
		.doc(projectInfo.data().id)
		.delete()
		.catch((error) => {
			console.log(error);
			res.status(500).send(error);
		});
	await admin
		.firestore()
		.collection(`Units/`)
		.doc(`${projectInfo.data().unitID}`)
		.update({
			projectList: admin.firestore.FieldValue.arrayRemove(projectID),
		})
		.catch((error) => {
			console.log(error);
			res.status(500).send(error);
		});
	res.status(200).send(`Successfully deleted Project`);
});

// Get the list of all Projects in 1 specific unit
export const getProjects = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { unitID } = req.body;
	const unitSnapshot = await admin.firestore().collection(`Units/`).doc(`${unitID}`).get();
	var projectList = [];
	unitSnapshot.data().projectList.forEach((project) => {
		projectList.push(project);
	});
	console.log("Project list :\n", projectList);
	var allProjects = [];
	var promise = new Promise((resolve, reject) => {
		projectList.forEach(async (project, index, array) => {
			const projectSnapshot = await admin.firestore().collection(`Projects/`).doc(project).get();
			allProjects.push(projectSnapshot.data());
			if (index === array.length -1) resolve();
		});
	});
	promise.then(() => {
		res.status(200).send(allProjects);
	});
});

// Register user to project
export const addUserToProject = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { unitID, userID, projectID } = req.body;
	await admin
		.firestore()
		.collection(`Units/${unitID}/Projects`)
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

	res.status(200).send("User successfully added to project");
});

// remove user to project
export const removeUserToProject = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { unitID, userID, projectID } = req.body;
	await admin
		.firestore()
		.collection(`Units/${unitID}/Projects`)
		.doc(`${projectID}`)
		.update({
			usersID: admin.firestore.FieldValue.arrayRemove(userID),
		})
		.catch((error) => {
			console.log(error);
		});
	res.status(200).send("User successfully removed to project");
});

export const getUserByEmail = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {
	const { email } = req.body;
	var user;
	const snapshot = await admin.firestore().collection("Users").where("email", "==", email.toLowerCase()).get();
	snapshot.forEach((doc) => {
		user = doc.data().firebaseID;
	});
	console.log(user);
	if (user) res.status(200).send(user);
	else res.status(404).send("No user found !");
});
