import PropTypes from 'prop-types';
import PropTypesPresenter from 'utils/PropTypesPresenter';

export default new PropTypesPresenter(
  {
    id: PropTypes.number,
    name: PropTypes.string,
    description: PropTypes.string,
    author: PropTypes.object,
    assignee: PropTypes.object,
    transitions: PropTypes.array,
    state: PropTypes.string,
  },
  {
    title(task) {
      return `Task #${this.id(task)} [${this.name(task)}]`;
    },
  },
);
