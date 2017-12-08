// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.
// webpack-dev-server

import React, { Component } from "react";
import { render } from "react-dom";
import PropTypes from "prop-types";
import * as fetcher from "./fetch.js";
import "../stylesheets/stuff.scss";

class Hello extends Component {
  constructor() {
    super();
    this.state = {
      followers: []
    };
  }

  setFollowers() {
    fetcher.followers().then(json => this.setState({ followers: json }));
  }

  setUser() {
    fetcher.user().then(json => this.setState({ user: json }));
  }

  setFollowing() {
    fetcher.following().then(json => this.setState({ following: json }));
  }

  setStarredRepos() {
    fetcher.starredRepos().then(json => this.setState({ starred_repos: json }));
  }

  setUserRepos() {
    fetcher.userRepos().then(json => this.setState({ user_repos: json }));
  }

  setUserOrganizations() {
    fetcher
      .userOrganizations()
      .then(json => this.setState({ user_organizations: json }));
  }

  setReceivedEvents() {
    fetcher
      .receivedEvents()
      .then(json => this.setState({ received_events: json }));
  }

  setUserEvents() {
    fetcher.userEvents().then(json => this.setState({ user_events: json }));
  }

  componentWillMount() {
    this.setUser();
    this.setFollowers();
    this.setFollowing();
    this.setStarredRepos();
    this.setUserRepos();
    this.setReceivedEvents();
    this.setUserEvents();
  }

  mapFollowers() {
    followers.map(follower => {});
  }

  renderContributionChart() {
    const {nickname} = this.state.user
    return (
      <div>
        <h2>Contributions in the past year</h2>
        <img src={"http://ghchart.rshah.org/409ba5/" + nickname} />
      </div>
    )
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
        {this.state.user && this.renderContributionChart()}
      </div>
    );
  }
}

document.addEventListener("DOMContentLoaded", () => {
  render(<Hello />, document.getElementById("put_react_here"));
});
