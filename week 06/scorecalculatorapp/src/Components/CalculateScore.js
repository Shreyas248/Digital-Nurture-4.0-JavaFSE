// src/Components/CalculateScore.js
import React from 'react';
import '../Stylesheets/mystyle.css';

function CalculateScore(props) {
  // Destructure the props
  const { name, school, total, goal } = props;

  // Calculate average/percentage
  const percentage = ((total / goal) * 100).toFixed(2);

  return (
    <div className="score-card">
      <h1 className="title">Student Details:</h1>
      <p><span className="label name">Name:</span> <span className="value blue">{name}</span></p>
      <p><span className="label school">School:</span> <span className="value violet">{school}</span></p>
      <p><span className="label total">Total:</span> <span className="value black">{total}Marks</span></p>
      <p><span className="label score">Score:</span> <span className="value green">{percentage}%</span></p>
    </div>
  );
}

export default CalculateScore;
