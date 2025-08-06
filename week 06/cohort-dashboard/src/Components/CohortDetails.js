// src/components/CohortDetails.js

import React from 'react';
import styles from './CohortDetails.module.css';

const CohortDetails = ({ cohort }) => {
  const isOngoing = cohort.status.toLowerCase() === 'ongoing';
  const titleStyle = {
    color: isOngoing ? 'green' : 'blue',
  };

  return (
    <div className={styles.box}>
      <h3 style={titleStyle}>{cohort.name}</h3>
      <dl>
        <dt>Started On</dt>
        <dd>{cohort.startDate}</dd>

        <dt>Current Status</dt>
        <dd>{cohort.status}</dd>

        <dt>Coach</dt>
        <dd>{cohort.coach}</dd>

        <dt>Trainer</dt>
        <dd>{cohort.trainer}</dd>
      </dl>
    </div>
  );
};

export default CohortDetails;
