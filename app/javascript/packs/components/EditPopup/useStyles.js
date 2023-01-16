import { makeStyles } from '@material-ui/core';

const useStyles = makeStyles(() => ({
  modal: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    outline: 0,
  },

  root: {
    width: 465,
  },

  loader: {
    display: 'flex',
    justifyContent: 'center',
  },

  actions: {
    display: 'flex',
    justifyContent: 'flex-end',
  },

  imageUploadContainer: {
    display: 'flex',
  },

  previewContainer: {
    display: 'flex',
  },
}));

export default useStyles;
