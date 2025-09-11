let givenProfile = "";
let profileName = "";
let profileId = "";
let profileLink = "";
let profileRepos = "";
let errorMessage = "";

function renderPage() {
  document.getElementById("app").innerHTML = `
    <div>
      <h1>Github profile viewer</h1>
      <p>Please enter profile name: </p>
      <input placeholder="username"/>
      <div class="content">
        ${ errorMessage ? `<p style="color:red">${errorMessage}</p>` : "" }
        <h1 id="name">Name: ${profileName}</h1>
        <p id="id">Id: ${profileId}</p>
        <p id="repos">Public repos: ${profileRepos}</p>
        <p id="profileurl">
          Link: <a href="${profileLink}" target="_blank">${profileName}</a>
        </p>
      </div>
    </div>
  `;

  const input = document.querySelector("input");
  input.addEventListener("change", updateValue);
}

function updateValue(e) {
  givenProfile = e.target.value.trim();
  if (givenProfile) {
    fetchProfile();
  } else {
    errorMessage = "Palun sisesta kasutajanimi!";
    profileName = profileId = profileLink = profileRepos = "";
    renderPage();
  }
}

let fetchProfile = async () => {
  errorMessage = "";
  try {
    const response = await fetch(`https://api.github.com/users/${encodeURIComponent(givenProfile)}`, {
      headers: {
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28",
        "Authorization": "Bearer github api key"
      }
    });

    if (!response.ok) {
      if (response.status === 404) {
        throw new Error("Kasutajat ei leitud!");
      } else {
        throw new Error("API viga: " + response.status);
      }
    }

    const data = await response.json();
    profileName = data.login || "";
    profileId = data.id || "";
    profileLink = data.html_url || "";
    profileRepos = data.public_repos ?? "";

  } catch (err) {
    errorMessage = err.message;
    profileName = profileId = profileLink = profileRepos = "";
  }

  renderPage();
};

// Esmane renderdus
renderPage();
