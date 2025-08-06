import React, { useState } from 'react';
import BookDetails from './components/BookDetails';
import BlogDetails from './components/BlogDetails';
import CourseDetails from './components/CourseDetails';
import './App.css'; // Make sure to import the CSS

function App() {
  const [view, setView] = useState('all');
  const [showBlog, setShowBlog] = useState(true);

  const renderComponent = () => {
    switch (view) {
      case 'course':
        return <CourseDetails />;
      case 'book':
        return <BookDetails />;
      case 'blog':
        return <BlogDetails />;
      case 'all':
        return (
          <div className="app-container">
            <div className="section">
              <CourseDetails />
            </div>
            <div className="section">
              <BookDetails />
            </div>
            <div className="section">
              <BlogDetails />
            </div>
          </div>
        );
      default:
        return <h2>Select a view</h2>;
    }
  };

  return (
    <div style={{ textAlign: 'center' }}>
      <h1>Blogger App</h1>
      <button onClick={() => setView('course')}>Course</button>
      <button onClick={() => setView('book')}>Book</button>
      <button onClick={() => setView('blog')}>Blog</button>
      <button onClick={() => setView('all')}>Show All</button>
      <button onClick={() => setShowBlog(prev => !prev)}>Toggle Blog (&&)</button>
      <hr />

      {/* 1. Switch-case Rendering */}
      {renderComponent()}

      {/* 2. Ternary Operator */}
      {view === 'book' ? <p>Book section is open</p> : <p>Not in book section</p>}

      {/* 3. Logical && Operator */}
      {showBlog && view !== 'all' && <BlogDetails />}
    </div>
  );
}

export default App;
