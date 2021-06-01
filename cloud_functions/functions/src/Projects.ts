import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const runtimeOpts = {
	timeoutSeconds: 3,
};

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
			if (index === array.length - 1) resolve();
		});
	});
	promise.then(() => {
		res.status(200).send(allProjects);
	});
});
