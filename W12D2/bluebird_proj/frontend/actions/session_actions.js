//actions for the calls that we defined in API Util

//import actions we created
import { postUser, postSession, deleteSession } from '../utils/session';

//creating constants that will be messages we send to reducer. we do this to make sure that they're the same no matter where we use them
//it's important to set const to string bc then you'll get a "hey you spelled something wrong error" instead of a "hey there's no match" error which is much harder to decipher
export const RECEIVE_CURRENT_USER = `RECEIVE_CURRENT_USER`;
export const LOGOUT_CURRENT_USER = `LOGOUT_CURRENT_USER`;



//ACTION CREATORS (return an action object)
//the point of an action object is to return a type and payload
const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    user
})

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
    //no payload for this one b/c this will just be associated with a "you've been logged out" message
})




//THUNK ACTION CREATORS (will be used inside containers)
//name based on action that it will perform
export const createNewUser = formUser => dispatch => {
    return postUser(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));
}

export const login = formUser => dispatch => {
    return postSession(formUser)
    .then(user => dispatch(receiveCurrentUser(user))); //question: how did he know that postSession would return a user?
}

export const logout =  () => dispatch => {
    return deleteSession()
    .then(() => dispatch(logoutCurrentUser()));
}

