import { PropTypes } from 'prop-types';
import PropTypesPresenter from 'utils/PropTypesPresenter';

export default new PropTypesPresenter({
  onClose: PropTypes.func.isRequired,
  onCardCreate: PropTypes.func.isRequired,
});
