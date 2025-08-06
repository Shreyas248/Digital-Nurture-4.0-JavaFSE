import React from 'react';

const GuestPage = ({ onLogin }) => {
  return (
    <div>
      <h1>Please sign up.</h1>
      <p>Flights available:</p>
      <ul>
        <li>Coimbatore → Chennai – ₹2500</li>
        <li>Delhi → Mumbai – ₹3500</li>
        <li>Bangalore → Kochi – ₹2800</li>
      </ul>
      <button onClick={onLogin}>Login</button>
    </div>
  );
};

export default GuestPage;
