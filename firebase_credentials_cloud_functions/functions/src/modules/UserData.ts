// import * as functions from 'firebase-functions';
// import * as admin from 'firebase-admin';

// //get user data
// export const getUserDataByID(){
// 	admin
// 	.auth()
// 	.getUser(uid)
// 	.then((userRecord) => {
// 		// See the UserRecord reference doc for the contents of userRecord.
// 		console.log(`Successfully fetched user data: ${userRecord.toJSON()}`);
// 	})
// 	.catch((error) => {
// 		console.log("Error fetching user data:", error);
// 	});
// }
// export const getUserDataByEmail(){
// 	admin
// 	.auth()
// 	.getUserByEmail(email)
// 	.then((userRecord) => {
// 		// See the UserRecord reference doc for the contents of userRecord.
// 		console.log(`Successfully fetched user data: ${userRecord.toJSON()}`);
// 	})
// 	.catch((error) => {
// 		console.log('Error fetching user data:', error);
// 	});
// }