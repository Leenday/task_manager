import { makeStyles } from '@material-ui/core';

const useStyles = makeStyles(() => ({
  crop: {
    maxHeight: 500,
    maxWidth: 500,
    position: 'absolute',
    top: '35%',
    left: '33%',
  },
}));

export default useStyles;
