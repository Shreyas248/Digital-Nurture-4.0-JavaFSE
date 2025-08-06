import React from 'react';

const CourseDetails = () => {
  const courses = [
    { name: 'Angular', date: '4/5/2021' },
    { name: 'React', date: '6/3/2021' }
  ];

  return (
    <div>
      <h2>Course Details</h2>
      {courses.length > 0 ? (
        <ul>
          {courses.map((course, index) => (
            <li key={index}>
              <strong>{course.name}</strong> - {course.date}
            </li>
          ))}
        </ul>
      ) : (
        <p>No courses available</p>
      )}
    </div>
  );
};

export default CourseDetails;
