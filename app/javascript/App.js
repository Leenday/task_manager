import React from 'react';

import store from 'store';
import { Provider } from 'react-redux';
import { ThemeProvider } from '@material-ui/core/styles';
import MUITheme from 'src/themes/MUITheme';

import TaskBoard from '/app/javascript/containers/TaskBoard';

function App() {
  return (
    <Provider store={store}>
      <ThemeProvider theme={MUITheme}>
        <TaskBoard />
      </ThemeProvider>
    </Provider>
  );
}

export default App;
