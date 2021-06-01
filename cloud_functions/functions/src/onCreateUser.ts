// import { Request, Response } from "express";
import * as admin from "firebase-admin";
import * as functions from "firebase-functions";

export const addUserTest = functions.https.onRequest(async (req, res) => {
	const { displayName, email, phoneNumber, photoURL, disabled, emailVerified, password } = req.body;

	console.log("Adding user", email);

	if (!email || !password) {
		res.status(400).send({ message: "Missing fields" });
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
			emailVerified
		});

		//  the newely created user record
		res.status(201).send(user);
	} catch (err) {
		res.status(500).send({ message: `${err.code} - ${err.message}` });
	}

});