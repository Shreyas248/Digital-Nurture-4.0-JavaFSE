import React from 'react';

const IndianPlayers = () => {
  const indianPlayers = ["Sachin", "Dhoni", "Virat", "Rohit", "Yuvraj", "Raina"];

  // Destructure odd and even players
  const [first, second, third, fourth, fifth, sixth] = indianPlayers;

  const T20players = [
    "Mr. First Player",
    "Mr. Second Player",
    "Mr. Third Player"
  ];

  const RanjiTrophyPlayers = [
    "Mr. Fourth Player",
    "Mr. Fifth Player",
    "Mr. Sixth Player"
  ];

  const mergedPlayers = [...T20players, ...RanjiTrophyPlayers]; // Merging using spread operator

  return (
    <div>
      <h2>Odd Players</h2>
      <ul>
        <li>First : {first}1</li>
        <li>Third : {third}3</li>
        <li>Fifth : {fifth}5</li>
      </ul>

      <h2>Even Players</h2>
      <ul>
        <li>Second : {second}2</li>
        <li>Fourth : {fourth}4</li>
        <li>Sixth : {sixth}6</li>
      </ul>

      <h2>List of Indian Players Merged:</h2>
      <ul>
        {mergedPlayers.map((player, index) => (
          <li key={index}>{player}</li>
        ))}
      </ul>
    </div>
  );
};

export default IndianPlayers;
