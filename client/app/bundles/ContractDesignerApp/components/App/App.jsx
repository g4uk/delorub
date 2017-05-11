import React from 'react';
import QuestionList from '../QuestionList/QuestionList';
import TextEditor from '../TextEditor/TextEditor';

export default class App extends React.Component {
  render() {
    return (
      <div className="clearfix">
        <div className="questionListContainer">
          <QuestionList />
        </div>
        <div className="textEditorContainer">
          <TextEditor />
        </div>
      </div>
    );
  }
}
