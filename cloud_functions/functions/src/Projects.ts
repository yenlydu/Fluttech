import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const runtimeOpts = {
	timeoutSeconds: 30,
};

// Create new project in unit
export const addProject = functions.runWith(runtimeOpts).https.onCall(async (data, context) => {
	const { name, registerEnd, projectStart, projectEnd, unitID, description } = data;
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
			return(error);
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
				return(error);
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
				return(error);
			});
	});
	return(`Successfully added new Project : ${name}`);
});
export const addProject2 = functions.runWith(runtimeOpts).https.onRequest(async (data, res) => {
	const { name, registerEnd, projectStart, projectEnd, unitID, description } = data.body;
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
			res.send(error);
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
				res.send(error);
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
				res.send(error);
			});
	});
	res.send(`Successfully added new Project : ${name}`);
});

// Update project in unit
export const updateProject = functions.runWith(runtimeOpts).https.onCall(async (data, context) => {
	const { name, registerEnd, projectStart, projectEnd, description, appointementList, projectID } = data;

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
			return(error);
		});
	return(`Successfully updated project : ${name}`);
});

// Delete project in unit
export const deleteProject = functions.runWith(runtimeOpts).https.onCall(async (data, context) => {
	const { projectID } = data;
	const projectInfo = await admin.firestore().collection(`Projects`).doc(`${projectID}`).get();
	// console.log(projectInfo.data())
	await admin
		.firestore()
		.collection(`Projects`)
		.doc(projectInfo.data().id)
		.delete()
		.catch((error) => {
			console.log(error);
			return(error);
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
			return(error);
		});
	return(`Successfully deleted Project`);
});

// Get the list of all Projects in 1 specific unit
export const getProjects = functions.runWith(runtimeOpts).https.onCall(async (data, context) => {
	const { unitID } = data;
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
			if (index === array.length - 1 || index === array.length) resolve();
		});
	});
	promise.then(() => {
		console.log("ALL PROJECT HERE (FINAL RESPONSE)", allProjects)
		return(allProjects);
	});
});

export const getProjects2 = functions.runWith(runtimeOpts).https.onRequest(async (data, res) => {
	const { unitID } = data.body;
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
			if (index === array.length - 1 || index === array.length) resolve();
		});
	});
	promise.then(() => {
		console.log("ALL PROJECT HERE (FINAL RESPONSE)", allProjects)
		res.status(200).send(allProjects);
	});
});
