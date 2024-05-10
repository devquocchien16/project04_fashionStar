import React, { useState } from 'react';
import { FaAngleDown, FaAngleUp } from 'react-icons/fa';

const ReadMoreText = ({ text, maxLength = 100 }) => {
  const [expanded, setExpanded] = useState(false);

  const toggleExpanded = () => {
    setExpanded(!expanded);
  };

  return (
    <div>
      {text.length > maxLength ? (
        <>
          {expanded ? (
            <div>{text}</div>
          ) : (
            <div>
              {`${text.slice(0, maxLength)}... `}
              <span onClick={toggleExpanded}>
                {expanded ? <FaAngleUp /> : <FaAngleDown />}
              </span>
            </div>
          )}
        </>
      ) : (
        text
      )}
    </div>
  );
};

export default ReadMoreText;
