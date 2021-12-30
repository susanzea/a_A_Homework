import { connect } from 'react-redux';

//since this is the sigup form we need an action that allows us to create a new user
import { createNewUser } from '../../actions/session_actions';
import SignupForm from './signup_form'

//we don't need a mSTP because signing up a user does not depend on state

const mapDispatchToProps = dispatch => {
        return{
                createNewUser: formUser => dispatch(createNewUser(formUser))
        }
}

//pass in null for first parameter bc we don't have a mSTP
export default connect(null, mapDispatchToProps)(SignupForm);