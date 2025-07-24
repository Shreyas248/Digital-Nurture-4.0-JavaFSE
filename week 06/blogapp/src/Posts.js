import React, { Component } from 'react';
import Post from './Post';

class Posts extends Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [],
    };
  }

  // ✅ 6. Load posts from API
  loadPosts = () => {
    fetch('https://jsonplaceholder.typicode.com/posts')
      .then(response => response.json())
      .then(data => {
        const postList = data.map(post => new Post(post.userId, post.id, post.title, post.body));
        this.setState({ posts: postList });
      })
      .catch(error => {
        throw new Error('Error while fetching posts: ' + error);
      });
  };

  // ✅ 7. Call loadPosts on mount
  componentDidMount() {
    this.loadPosts();
  }

  // ✅ 9. Handle component errors
  componentDidCatch(error, info) {
    alert('An error occurred: ' + error.message);
    console.error("Error Info:", info);
  }

  // ✅ 8. Render posts
  render() {
    return (
      <div>
        <h1>Blog Posts</h1>
        {this.state.posts.map(post => (
          <div key={post.id} style={{ marginBottom: '1rem' }}>
            <h2>{post.title}</h2>
            <p>{post.body}</p>
          </div>
        ))}
      </div>
    );
  }
}

export default Posts;
