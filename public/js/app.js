const siteform = document.querySelector("#content form");

function sendHttpRequest(method, url, data) {
  return fetch(url, {
    method: method,
    body: JSON.stringify(data),
  }).then((response) => {
    alert("Login successful", response);
    return response.json();
  });
}

async function login(username, password) {
  const post = {
    username: username,
    password: password,
  };

  sendHttpRequest("POST", "http://127.0.0.1:9292/login/", post);
}

siteform.addEventListener("submit", (event) => {
  event.preventDefault();
  const username = event.currentTarget.querySelector("#username").value;
  const password = event.currentTarget.querySelector("#password").value;
  login(username, password);
});
