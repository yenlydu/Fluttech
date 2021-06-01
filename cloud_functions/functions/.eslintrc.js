module.exports = {
  root: true,
  env: {
    es6: true,
    node: true,
  },
  extends: [
    'eslint:recommended',
    'plugin:import/errors',
    'plugin:import/warnings',
    'plugin:import/typescript',
    'google',
    'plugin:@typescript-eslint/recommended',
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    project: ['tsconfig.json', 'tsconfig.dev.json'],
    sourceType: 'module',
  },
  ignorePatterns: [
    '/lib/**/*', // Ignore built files.
  ],
  plugins: [
    '@typescript-eslint',
    'import',
  ],
  rules: {
    "quotes": ["off", "double"],
    "indent": ["off", "tab"],
    "no-tabs": 0,
    "object-curly-spacing": ["off", "tab"],
    "padded-blocks": ["off", "tab"],
    "max-len": ["off", "tab"],
    "linebreak-style": ["off", "tab"],
    "valid-jsdoc": ["off", "tab"],
    "require-jsdoc": ["off", "tab"],
    "no-multi-spaces": ["off", "tab"],
    "eol-last": ["off", "tab"],
    "no-multiple-empty-lines": ["off", "tab"],
    "comma-dangle": ["off", "tab"],
    "semi-spacing": ["off", "tab"],
    "key-spacing": ["off", "tab"],
    "no-var": ["off", "tab"],
  },
};
