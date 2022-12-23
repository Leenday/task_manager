import PropTypes from 'prop-types';
import PropTypesPresenter from 'utils/PropTypesPresenter';

export default new PropTypesPresenter({
  id: PropTypes.string,
  title: PropTypes.string,
  cards: PropTypes.oneOfType([PropTypes.array, PropTypes.object]),
  meta: PropTypes.shape({
    totalCount: PropTypes.number,
    currentPage: PropTypes.number,
    totalPages: PropTypes.number,
  }),
  onLoadMore: PropTypes.func,
});
