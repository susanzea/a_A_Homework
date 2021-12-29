import React from "react"; 

class SignupForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: '',
            email: '',
            password: ''
        }
    }

    //build the actions that the form will use
    handleInput(field) {
        return (e) => {  //wuestion: why do we not have to pass e to the func?
            this.setState({ [field]: e.target.value })
        }
    }

    handleSubmit(e) {
        e.preventDefault(); //prevents page from automatically sending post request and rerending the page which would result in us losing the user signing up's info in our state
        
    }

    render() {
        return(
            <div>

            </div>
        )
    }
}

export default SignupForm;