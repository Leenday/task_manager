import { useSelector } from 'react-redux';
import { useTasksActions } from 'slices/TasksSlice';

const useTasks = () => {
  const board = useSelector((state) => state.TasksSlice.board);
  const { loadBoard, loadColumnMore, handleCardDragEnd, taskCreate, loadTask, destroyTask, updateTask } = useTasksActions();

  return {
    board,
    loadBoard,
    loadColumnMore,
    handleCardDragEnd,
    taskCreate,
    loadTask,
    destroyTask,
    updateTask,
  };
};

export default useTasks;
