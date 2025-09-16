document.getElementById("app").innerHTML = `<table id="xmlTable"></table>`;

let xmlhttp = new XMLHttpRequest();
xmlhttp.open("GET", "games.xml", false);
xmlhttp.send();
let XMLContent = xmlhttp.responseXML;

let tableRows = "<tr><th>Title</th><th>Price</th><th>Platform</th></tr>";

let gameElements = XMLContent.getElementsByTagName("game");

for (let i = 0; i < gameElements.length; i++) {
  tableRows +=
    "<tr><td>" +
    gameElements[i].getElementsByTagName("title")[0].childNodes[0].nodeValue +
    "</td><td>" +
    gameElements[i].getElementsByTagName("price")[0].childNodes[0].nodeValue +
    "</td><td>";

  let platforms = gameElements[i].getElementsByTagName("platform");
  for (let j = 0; j < platforms.length; j++) {
    tableRows += platforms[j].childNodes[0].nodeValue + "/";
  }

  tableRows += "</td></tr>";
}

document.getElementById("xmlTable").innerHTML = tableRows;
