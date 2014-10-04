var coffee = require('coffee-script');

module.exports = function (options) {
  options = options || {};

  return function (file) {
    if (file.type === 'coffee') {
      file.src = coffee.compile(file.src, options);
      file.type = 'js';
    }
  };
};
