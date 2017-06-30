import React from 'react';
import RenderDatepicker from 'libs/delorub/redux-form-datepicker'
import { required } from 'libs/delorub/redux-form-validations'
import { Field } from 'redux-form';

export default class DateInterval extends React.Component {
  render() {
    return (
      <div className="dr-task-name dr-task-div">
        <span className="input-label">Период выполнения</span>
        <br />
        <div className="row">
          <div className="col-md-6">
            <Field
              component={RenderDatepicker}
              className="form-control"
              name="task[date_interval_from_date]"
              validate={[required]}
              />
          </div>
          <div className="col-md-6">
            <Field
              component={RenderDatepicker}
              name="task[date_interval_to_date]"
              className="form-control"
              validate={[required]}
              />
          </div>
        </div>
      </div>
    );
  }
}
