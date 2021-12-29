import React from "react"; 

class SignupForm extends React.Component {
    constructor(props) {
        super(props);
        debugger
        this.state = {
            username: '',
            email: '',
            password: ''
        };

        this.handleInput = this.handleInput.bind(this); //why does handleInput not need to be bound?
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    //build the actions that the form will use
    handleInput(field) {
        return (e) => { 
            this.setState({ [field]: e.target.value })
        }
    }

    handleSubmit(e) {
        e.preventDefault(); //prevents page from automatically sending post request and rerending the page which would result in us losing the user signing up's info in our state
        this.props.createNewUser(this.state)
        .then(() => this.props.history.push('/chirps')) //if we successfully create a new user, force redirect to index page. we will have access to history b/c SignUpForm will be wrapped in a Route component
    }

    render() {
        return(
            <div className="session-form">
                <h2>Sign Up!</h2>
                <form>
                    <label>Username
                        <input type="text" value={this.state.username} onChange={this.handleInput('username')}/>
                    </label>
                    <label>Email
                        <input type="text" value={this.state.email} onChange={this.handleInput('email')}/>
                    </label>
                    <label>Password
                        <input type="password" value={this.state.password} onChange={this.handleInput('password')}/>
                    </label>
                    <button onClick={this.handleSubmit}>Sign Up</button>
                </form>

            </div>
        )
    }
}

export default SignupForm;