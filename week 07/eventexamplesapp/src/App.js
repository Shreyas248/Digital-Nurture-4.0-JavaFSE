import React, { useState } from 'react';
import CurrencyConvertor from './CurrencyConvertor';

function App() {
  const [count, setCount] = useState(0);

  // Function to increment and show alert
  const handleIncrement = () => {
    setCount(count + 1);
    sayHello();
  };

  const sayHello = () => {
    alert("Hello! Member1");
  };

  const handleDecrement = () => {
    setCount(count - 1);
  };

  const sayWelcome = (message) => {
    alert(message);
  };

  const handleClick = (e) => {
    alert("I was clicked");
  };

  return (
    <div style={{ padding: '20px' }}>
      <h2>{count}</h2>
      <button onClick={handleIncrement}>Increment</button>
      <button onClick={handleDecrement}>Decrement</button>
      <br /><br />
      <button onClick={() => sayWelcome("Welcome to Event Handling!")}>Say welcome</button>
      <br /><br />
      <button onClick={handleClick}>Click on me</button>

      <hr />
      <CurrencyConvertor />
    </div>
  );
}

export default App;
