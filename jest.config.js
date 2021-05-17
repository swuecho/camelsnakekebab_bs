module.exports = {
  transform: {
    "^.+\\.(js|jsx)$": "babel-jest",
  },
  transformIgnorePatterns: [
    '/node_modules/(?!bs-platform|@glennsl|@rescript|bs-)'
  ],
  reporters: [
    "default",
    ["jest-junit", {
      suiteName: "jest tests",
      "outputDirectory": "__tests__",
      "outputName": "test-results.xml",
    }]
  ],
  moduleFileExtensions: [
    'js',
    'json',
  ],
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/src/$1'
  },
  testMatch: [
    '**/__tests__/*.js'
  ],
  testURL: 'http://localhost/',
  moduleFileExtensions: [
    'ts',
    'tsx',
    'js',
    'jsx',
    'json'
  ],
}