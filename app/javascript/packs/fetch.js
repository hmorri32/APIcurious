export const followers = () => {
  return fetch("/api/v1/followers", {
    credentials: "same-origin",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    },
    method: "GET"
  })
  .then(response => response.json())
}

export const user = () => {
  return fetch("/api/v1/user", {
    credentials: "same-origin",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    },
    method: "GET"
  })
  .then(response => response.json())
}

export const following = () => {
  return fetch("/api/v1/following", {
    credentials: "same-origin",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    },
    method: "GET"
  })
  .then(response => response.json())
}

export const starredRepos = () => {
  return fetch("/api/v1/starred_repos", {
    credentials: "same-origin",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    },
    method: "GET"
  })
  .then(response => response.json())
}

export const userRepos = () => {
  return fetch("/api/v1/user_repos", {
    credentials: "same-origin",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    },
    method: "GET"
  })
  .then(response => response.json())
}

export const userOrganizations = () => {
  return fetch("/api/v1/user_organizations", {
    credentials: "same-origin",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    },
    method: "GET"
  })
  .then(response => response.json())
}

export const receivedEvents = () => {
  return fetch("/api/v1/received_events", {
    credentials: "same-origin",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    },
    method: "GET"
  })
  .then(response => response.json())
}

export const userEvents = () => {
  return fetch("/api/v1/user_events", {
    credentials: "same-origin",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    },
    method: "GET"
  })
  .then(response => response.json())
}
