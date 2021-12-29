import React from 'react';
import { connect } from 'react-redux';
import NavBar from './nav_bar';

// Comment this back in after you have built the login functionality

import { logout } from '../../actions/session_actions';

//in mSTP we are passing current user from state to the nav bar component
const mapStateToProps = state => ({
  currentUser: state.session.currentUser,
});

//in MDTP we are passing down the logout functionality to our nav bar
const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(logout()),
});


// Comment this out when you have built the login functionality
// const mapStateToProps = null;
// const mapDispatchToProps = null;

export default connect(mapStateToProps, mapDispatchToProps)(NavBar);
