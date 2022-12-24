import React, { useEffect, useState } from 'react';
import KanbanBoard from '@asseinfo/react-kanban';
import Fab from '@material-ui/core/Fab';
import AddIcon from '@material-ui/icons/Add';

import Task from 'packs/components/Task';
import AddPopup from 'packs/components/AddPopup';
import EditPopup from 'packs/components/EditPopup';
import ColumnHeader from 'packs/components/ColumnHeader';

import useTasks from 'hooks/store/useTasks';

import useStyles from './useStyles';

const MODES = {
  ADD: 'add',
  NONE: 'none',
  EDIT: 'edit',
};

function TaskBoard() {
  const { board, loadBoard, loadColumnMore, handleCardDragEnd, taskCreate, loadTask, destroyTask, updateTask } = useTasks();
  const [mode, setMode] = useState(MODES.NONE);
  const [openedTaskId, setOpenedTaskId] = useState(null);
  const styles = useStyles();

  useEffect(() => {
    loadBoard();
  }, []);

  const handleOpenAddPopup = () => {
    setMode(MODES.ADD);
  };

  const handleOpenEditPopup = (task) => {
    setOpenedTaskId(task.id);
    setMode(MODES.EDIT);
  };

  const handleClose = () => {
    setMode(MODES.NONE);
    setOpenedTaskId(null);
  };

  // const loadColumnMore = () => { };
  // const handleCardDragEnd = () => { };
  const handleTaskCreate = (params) => {
    handleClose();
    return taskCreate(params);
  };
  const handleTaskLoad = (id) => loadTask(id);

  const handleTaskUpdate = (task) => {
    handleClose();
    return updateTask(task);
  };

  const handleTaskDestroy = (task) => {
    handleClose();
    return destroyTask(task);
  };

  return (
    <>
      <Fab onClick={handleOpenAddPopup} className={styles.addButton} color="primary" aria-label="add">
        <AddIcon />
      </Fab>

      <KanbanBoard
        disableColumnDrag
        onCardDragEnd={handleCardDragEnd}
        renderCard={(card) => <Task onClick={handleOpenEditPopup} task={card} />}
        renderColumnHeader={(column) => <ColumnHeader column={column} onLoadMore={loadColumnMore} />}
      >
        {board}
      </KanbanBoard>

      {mode === MODES.ADD && <AddPopup onCardCreate={handleTaskCreate} onClose={handleClose} />}
      {mode === MODES.EDIT && (
        <EditPopup
          onCardLoad={handleTaskLoad}
          onCardDestroy={handleTaskDestroy}
          onCardUpdate={handleTaskUpdate}
          onClose={handleClose}
          cardId={openedTaskId}
        />
      )}
    </>
  );
}

export default TaskBoard;
