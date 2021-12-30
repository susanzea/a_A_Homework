//this file will automate the process of allowing people to see certain components based on logged in status
import React from "react";
import { connect } from 'react-redux';
import { Redirect, Route, withRouter }; 
/*
    -Redirect redirects users to different views
    -Route we need b/c these components are route specific
    -withRouter we need in order to give some components access to match, history, location, props
*/

//let's get the props that we'll need to rely on
const mapStateToProps = state => {
    return {
        loggedIn: Boolean(state.session.currentUser)
    }
}

//we'll use mSTP for each component both for our auth routes and our protected routes
//the auth routes are /login and /signup

//Auth is a functional component
//question: how are we getting loggedIn from mSTP above?
//note: path is passed down as a prop passed into Auth component tag
const Auth = ({ loggedIn, path }) => {

}