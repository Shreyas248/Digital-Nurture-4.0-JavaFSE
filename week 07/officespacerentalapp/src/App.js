import React from "react";
import "./App.css";

function App() {
  const officeSpaces = [
    {
      name: "DBS",
      rent: 50000,
      address: "Chennai",
      image:
        "https://as2.ftcdn.net/v2/jpg/03/84/55/29/1000_F_384552930_zPoe9zgmCF7qgt8fqSedcyJ6C6Ye3dFs.jpg",
    },
    {
      name: "WeWork",
      rent: 65000,
      address: "Bangalore",
      image:
        "https://as2.ftcdn.net/v2/jpg/02/10/62/03/1000_F_210620329_0le9P2aUC9LUqCyf6yqiV8MtVWrzGKi7.jpg",
    },
  ];

  return (
    <div className="App">
      <h1>Office Space , at Affordable Range</h1>
      {officeSpaces.map((office, index) => (
        <div key={index} className="office-card">
          <img src={office.image} alt={office.name} width="300" />
          <h2>Name: {office.name}</h2>
          <p
            className="rent"
            style={{ color: office.rent < 60000 ? "red" : "green" }}
          >
            Rent: Rs. {office.rent}
          </p>
          <p><strong>Address:</strong> {office.address}</p>
        </div>
      ))}
    </div>
  );
}

export default App;
