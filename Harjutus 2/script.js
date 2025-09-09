const myJson = {

  Car0: {
    Color: "Rose red",
    "Tinted windows": false,
    Wheels: 4,
    "Roof cargo": null,
    Entertainment: ["FM Radio", "MP3, MP4 and MKV player"],
    Speakers: "Harman/Kardon speakers",
    Accessories: ["satnav", "cruise control"]
  },

  Car1: {
    Color: "Navy blue",
    "Tinted windows": true,
    Wheels: 4,
    "Roof cargo": "Thule",
    Entertainment: ["FM Radio", "Apple CarPlay/Android Auto"],
    Speakers: "Bowers & Wilkins Premium Sound speakers",
    Accessories: ["self drive system", "luggage cover"]
  }
};



document.getElementById("app").innerHTML = `
  <h1>Car properties</h1>
  <h2>Car 0</h2>
  Color: ${myJson.Car0.Color} <br/>
  Tinted windows: ${myJson.Car0["Tinted windows"]} <br/>
  Wheels: ${myJson.Car0.Wheels} <br/>
  Roof cargo: ${myJson.Car0["Roof cargo"]} <br/>
  Entertainment: ${myJson.Car0.Entertainment.join(", ")} <br/>
  Speakers: ${myJson.Car0.Speakers} <br/>
  Accessories: ${myJson.Car0.Accessories.join(", ")} <br/><br/>

  <h2>Car 1</h2>
  Color: ${myJson.Car1.Color} <br/>
  Tinted windows: ${myJson.Car1["Tinted windows"]} <br/>
  Wheels: ${myJson.Car1.Wheels} <br/>
  Roof cargo: ${myJson.Car1["Roof cargo"]} <br/>
  Entertainment: ${myJson.Car1.Entertainment.join(", ")} <br/>
  Speakers: ${myJson.Car1.Speakers} <br/>
  Accessories: ${myJson.Car1.Accessories.join(", ")}

`;