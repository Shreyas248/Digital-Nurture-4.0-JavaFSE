// src/App.js
import React from 'react';
import './App.css';
import CalculateScore from './Components/CalculateScore';

function App() {
  return (
    <div className="App">
      <CalculateScore 
        name="Shreyas"
        school="DNV Public School"
        total={284}
        goal={300}
      />
    </div>
  );
}

export default App;
