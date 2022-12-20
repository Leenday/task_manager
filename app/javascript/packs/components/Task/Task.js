import React from 'react';

import Card from '@material-ui/core/Card';
import CardHeader from '@material-ui/core/CardHeader';
import CardContent from '@material-ui/core/CardContent';
import Typography from '@material-ui/core/Typography';
import IconButton from '@material-ui/core/IconButton';
import EditIcon from '@material-ui/icons/Edit';

import useStyles from './useStyles';
import TaskPresenter from 'presenters/TaskPresenter';

function Task({ task, onClick }) {
  const styles = useStyles;
  const handleClick = () => onClick(task);
  const action = (
    <IconButton onClick={handleClick}>
      <EditIcon />
    </IconButton>
  );

  return (
    <Card className={styles.root}>
      <CardHeader action={action} title={TaskPresenter.name(task)} />
      <CardContent>
        <Typography variant="body2" color="textSecondary" component="p">
          {TaskPresenter.description(task)}
        </Typography>
      </CardContent>
    </Card>
  );
}

// Task.propTypes = TaskPresenter.shape();
Task.propTypes = {
  task: TaskPresenter.shape(),
};

export default Task;
