import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      result: 0,
      num1: '',
      num2: ''
    }

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.subtract = this.subtract.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    const newNum1 = e.currentTarget.value ? parseInt(e.currentTarget.value) : '';
    this.setState({num1: newNum1})
  }

  setNum2(e) {
    const newNum2 = e.currentTarget.value ? parseInt(e.currentTarget.value) : '';
    this.setState({num2: newNum2});
  }

  add() {
    const newResult = this.state.num1 + this.state.num2;
    this.setState({result: newResult});
  }

  multiply() {
    const newResult = this.state.num1 * this.state.num2;
    this.setState({ result: newResult });
  }

  divide() {
    const newResult = this.state.num1 / this.state.num2;
    this.setState({ result: newResult });
  }

  subtract() {
    const newResult = this.state.num1 - this.state.num2;
    this.setState({ result: newResult });
  }

  clear() {
    this.setState({result: 0});
    this.setState({num1: ''});
    this.setState({num2: ''});
  }

  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input id="num1" onChange={this.setNum1} type="text" value={this.state.num1}></input>
        <input id="num2" onChange={this.setNum2} type="text" value={this.state.num2}></input>
        <button id="clear" onClick={this.clear}>C</button>
        <br />
        <button id="add" onClick={this.add}>+</button>
        <button id="multiply" onClick={this.multiply}>x</button>
        <button id="divide" onClick={this.divide}>/</button>
        <button id="subtract" onClick={this.subtract}>-</button>
      </div>
    );
  }
}

export default Calculator;
