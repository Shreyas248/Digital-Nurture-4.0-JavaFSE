import React, { useState } from 'react';

function CurrencyConvertor() {
  const [amount, setAmount] = useState('');
  const [currency, setCurrency] = useState('');
  const [converted, setConverted] = useState(null);

  const handleSubmit = (e) => {
    e.preventDefault();
    const rate = 0.011; // Example conversion: 1 INR = 0.011 EUR
    const result = amount * rate;
    setConverted(result.toFixed(2));
  };

  return (
    <div>
      <h1 style={{ color: 'green' }}>Currency Convertor!!!</h1>
      <form onSubmit={handleSubmit}>
        <label>
          Amount:
          <input
            type="number"
            value={amount}
            onChange={(e) => setAmount(e.target.value)}
          />
        </label>
        <br /><br />
        <label>
          Currency:
          <textarea
            value={currency}
            onChange={(e) => setCurrency(e.target.value)}
          />
        </label>
        <br /><br />
        <button type="submit">Submit</button>
      </form>
      {converted && (
        <h3>{amount} INR = {converted} EUR</h3>
      )}
    </div>
  );
}

export default CurrencyConvertor;
