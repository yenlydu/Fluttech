import { addUser, getUser, updateUser, setCustomUserClaims, deleteUser, listUsers, listAllUsers } from './TestAdmin';
import { isAuthenticated, isAuthorized } from "./TestAuth";
import { https } from 'firebase-functions';
import * as express from 'express';
import * as cors from 'cors';

// Initializes the Express app
const appUsers = express();

// Installs the json body parser middleware
appUsers.use(express.json());

// Installs the CORS policy middleware
appUsers.use(cors({ origin: true }));

// List all users: GET /users
appUsers.get('/',  isAuthenticated, isAuthorized(['admin']), listAllUsers );

// List users by identifiers POST /users (indentifiers[])
appUsers.post('/',  isAuthenticated, isAuthorized(['admin']), listUsers );

// Creates a new user POST /users/new (data)
appUsers.post('/new', isAuthenticated, isAuthorized(['admin']), addUser );

// Read a user record GET /users/uid
appUsers.get('/:uid', isAuthenticated, isAuthorized(['admin'], { allowSameUser: true }), getUser );

// Updates a user PATCH /users/uid (data)
appUsers.patch('/:uid', isAuthenticated, isAuthorized(['admin'], { allowSameUser: true }), updateUser );

// Updates a user custom claims PATCH /users/uid/claims (data)
appUsers.patch('/:uid/claims', isAuthenticated, isAuthorized(['admin'], { allowRootEmail: true }), setCustomUserClaims );

// Deletes a user DELETE /users/uid
appUsers.delete('/:uid', isAuthenticated, isAuthorized(['admin'], { allowSameUser: true }), deleteUser );

// Export the users API
export const users = https.onRequest(appUsers);