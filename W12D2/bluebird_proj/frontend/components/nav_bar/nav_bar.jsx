import React from 'react';
import { Link } from 'react-router-dom';

//argument being passed in below are from the nav bar container, we're using destructuring
export default ({ currentUser, logout }) => {

  //below we're implementing ternery logic to decide which buttons to display in the nav bar
  const display = currentUser ? (
    <div>
      <p>Hello, {currentUser.username}</p>
      <button onClick={logout}>Logout</button>
    </div>
  ) : ( 
    // the two links below are the two buttons in our nav bar but we only want to show them if someone's logged out
    <div>
      <Link className="btn" to="/signup">Sign Up</Link>
      <Link className="btn" to="/login">Log In</Link>
    </div>
  );

  return (
    <header className="nav-bar">
      <h1 className="logo">BLUEBIRD</h1>
      <div>
        {display}
      </div>
    </header>
  );
};
