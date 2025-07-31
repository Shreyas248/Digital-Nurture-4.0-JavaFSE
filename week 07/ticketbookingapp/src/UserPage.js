import React from 'react';

const UserPage = ({ onLogout }) => {
  return (
    <div>
      <h1>Welcome back</h1>
      <p>You can now book tickets.</p>
      <button>Book Now</button>
      <br /><br />
      <button onClick={onLogout}>Logout</button>
    </div>
  );
};

export default UserPage;
