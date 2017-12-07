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

  fetchFollowerCount() {
    fetch("/api/v1/follower_count", {
      credentials: "same-origin",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      method: "GET"
    })
      .then(response => response.json())
      .then(json => this.setState({ followers: json }));
  }

  fetchUserJSON() {
    fetch("/api/v1/user", {
      credentials: "same-origin",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      method: "GET"
    })
      .then(response => response.json())
      .then(json => this.setState({ user: json }));
  }

  componentWillMount() {
    this.fetchFollowerCount();
    this.fetchUserJSON();
  }

  mapFollowers() {
    followers.map(follower => {});
  }

  renderUserInfo() {
    const { user } = this.state;
    return (
      <div>
        <p>{user.username}</p>
        <img src={user.avatar_url} alt="" />
      </div>
    );
  }

  render() {
    return (
      <div className="background-city">
        {this.state.user && this.renderUserInfo()}
      </div>
    );
  }
}

document.addEventListener("DOMContentLoaded", () => {
  render(<Hello />, document.getElementById("put_react_here"));
});
