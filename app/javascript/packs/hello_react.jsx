// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.
// webpack-dev-server

import React, { Component }      from 'react'
import { render } from 'react-dom'
import PropTypes  from 'prop-types'
import "../stylesheets/stuff.scss"

class Hello extends Component {
  constructor() {
    super();
    this.state = {
      name: 'cool guy jones',
      date: ['array', 'of', 'stuff'],
    }
  }
  componentWillMount() {
    this.setState({ coolStuff: [1,2,3,4] })
  }

  render() {
    return (
      <div className='background-city'>
        <p> { this.state.name } </p>
        <p> { this.state.date.map(thing => `${thing} `) } </p>
        <p> { this.state.coolStuff.map(thing => `${thing} `) } </p>
      </div>
    )
  }
}

// const Hello = props => {
//   console.log()
//   return (
//   <div>Hello { props.name }!</div>
// )}


document.addEventListener('DOMContentLoaded', () => {
  render(<Hello />, document.getElementById('put_react_here'))
})
