import {
    RECEIVE_CURRENT_USER,
    LOGOUT_CURRENT_USER
} from '../actions/session_actions';

//api util requests were executed by the thunk creators which then took the promise returned by the request and made it the payload value of an action object which also has a type
//the thunk action creator then sends it to the reducer (aka here!) which evaluate the type k-v pair in the action object and determines how to update the state accordingly. we don't actually modify the state though, we just copy it and then alter that and return it (usually)

//this is the default state that will be returned if there is no one logged in aka no current user
const _nullSession = {
    currentUser: null
}


//reducers always taken in two arg's
const sessionReducer = (prevState = _nullSession, action) => {
    Object.freeze(prevState);

    switch(action.type) {
        //there will be as many case statements as there are action creators
        case RECEIVE_CURRENT_USER:
            return Object.assign({}, {currentUser: action.user})
        case LOGOUT_CURRENT_USER:
            return _nullSession
        default:
            return prevState;
    }
}


export default sessionReducer;
//after creating a reducer, go add it to your root reducer!! this is where all of the reducers get combined so that the store takes in just one reducer