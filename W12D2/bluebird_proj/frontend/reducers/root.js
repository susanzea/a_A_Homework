import { combineReducers } from 'redux';
import entitiesReducer from './entities';
import sessionReducer from './session_reducer';

export default combineReducers({
  entities: entitiesReducer, //question: can we have multiple entitites?
  session: sessionReducer //this is where we store all of our info about our user!
});

//now go create the session forms!