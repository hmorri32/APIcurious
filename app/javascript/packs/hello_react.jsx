// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.
// webpack-dev-server

import React, { Component } from "react";
import { render } from "react-dom";
import PropTypes from "prop-types";
import "../stylesheets/stuff.scss";

class Hello extends Component {
  constructor() {
    super();
    this.state = {
      name: "cool guy jones",
      followers: []
    };
  }

  componentWillMount() {
    this.setState({ coolStuff: [1, 2, 3, 4] });
  }

  componentDidMount() {
    fetch('/api/v1/follower_count', {
      credentials: 'same-origin',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      method: 'GET'})
    .then(response => response.json())
    .then((json) => this.setState({ followers: json }))
    .then(() => console.log(this.state))
  }

  mapFollowers() {
    const { followers } = this.state
    followers.map(follower => {

    })
  }

  render() {
    return (
      <div className="background-city">
        <p> {this.state.name} </p>
      </div>
    );
  }
}

document.addEventListener("DOMContentLoaded", () => {
  render(<Hello />, document.getElementById("put_react_here"));
});
