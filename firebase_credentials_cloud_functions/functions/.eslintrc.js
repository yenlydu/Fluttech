module.exports = {
  root: true,
  env: {
    es6: true,
    node: true,
  },
  extends: [
    "eslint:recommended",
    "plugin:import/errors",
    "plugin:import/warnings",
    "plugin:import/typescript",
    "google",
    "plugin:@typescript-eslint/recommended",
  ],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    project: ["tsconfig.json", "tsconfig.dev.json"],
    sourceType: "module",
  },
  ignorePatterns: [
    "/lib/**/*", // Ignore built files.
  ],
  plugins: [
    "@typescript-eslint",
    "import",
  ],
  "rules": {
    // -- Strict errors --
    // These lint rules are likely always a good idea.

    // Force function overloads to be declared together. This ensures readers understand APIs.
    "adjacent-overload-signatures": 1,

    // Do not allow the subtle/obscure comma operator.
    "ban-comma-operator": 1,

    // Do not allow internal modules or namespaces . These are deprecated in favor of ES6 modules.
    "no-namespace": 1,

    // Do not allow parameters to be reassigned. To avoid bugs, developers should instead assign new values to new vars.
    "no-parameter-reassignment": 1,

    // Force the use of ES6-style imports instead of /// <reference path=> imports.
    "no-reference": 1,

    // Do not allow type assertions that do nothing. This is a big warning that the developer may not understand the
    // code currently being edited (they may be incorrectly handling a different type case that does not exist).
    "no-unnecessary-type-assertion": 1,

    // Disallow nonsensical label usage.
    "label-position": 1,

    // Disallows the (often typo) syntax if (var1 = var2). Replace with if (var2) { var1 = var2 }.
    "no-conditional-assignment": 1,

    // Disallows constructors for primitive types (e.g. new Number('123'), though Number('123') is still allowed).
    "no-construct": 1,

    // Do not allow super() to be called twice in a constructor.
    "no-duplicate-super": 1,

    // Do not allow the same case to appear more than once in a switch block.
    "no-duplicate-switch-case": 1,

    // Do not allow a variable to be declared more than once in the same block. Consider function parameters in this
    // rule.
    "no-duplicate-variable": [1, "check-parameters"],

    // Disallows a variable definition in an inner scope from shadowing a variable in an outer scope. Developers should
    // instead use a separate variable name.
    "no-shadowed-variable": 1,

    // Functions must either be handled directly (e.g. with a catch() handler) or returned to another function.
    // This is a major source of errors in Cloud Functions and the team strongly recommends leaving this rule on.
    "no-floating-promises": 1,

    // Do not allow any imports for modules that are not in package.json. These will almost certainly fail when
    // deployed.
    "no-implicit-dependencies": 1,

    // The 'this' keyword can only be used inside of classes.
    "no-invalid-this": 1,

    // Do not allow strings to be thrown because they will not include stack traces. Throw Errors instead.
    "no-string-throw": 1,

    // Disallow control flow statements, such as return, continue, break, and throw in finally blocks.
    "no-unsafe-finally": 1,

    // Expressions must always return a value. Avoids common errors like const myValue = functionReturningVoid();
    "no-void-expression": [1, "ignore-arrow-function-shorthand"],

    // Disallow duplicate imports in the same file.
    "no-duplicate-imports": 1,


    // -- Strong Warnings --
    // These rules should almost never be needed, but may be included due to legacy code.
    // They are left as a warning to avoid frustration with blocked deploys when the developer
    // understand the warning and wants to deploy anyway.

    // Warn when an empty interface is defined. These are generally not useful.
    "no-empty-interface": 1,

    // Warn when an import will have side effects.
    "no-import-side-effect": 1,

    // Warn when variables are defined with var. Var has subtle meaning that can lead to bugs. Strongly prefer const for
    // most values and let for values that will change.
    "no-var-keyword": 1,

    // Prefer === and !== over == and !=. The latter operators support overloads that are often accidental.
    "triple-equals": 1,

    // Warn when using deprecated APIs.
    "deprecation": 1,

    // -- Light Warnings --
    // These rules are intended to help developers use better style. Simpler code has fewer bugs. These would be "info"
    // if TSLint supported such a level.

    // prefer for( ... of ... ) to an index loop when the index is only used to fetch an object from an array.
    // (Even better: check out utils like .map if transforming an array!)
    "prefer-for-of": 1,

    // Warns if function overloads could be unified into a single function with optional or rest parameters.
    "unified-signatures": 1,

    // Prefer const for values that will not change. This better documents code.
    "prefer-const": 1,

    // Multi-line object literals and function calls should have a trailing comma. This helps avoid merge conflicts.
    "trailing-comma": 1
  },
};
