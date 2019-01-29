module.exports = {
  reporters: [
    "default",
    ["jest-junit", {
      suiteName: "jest tests",
      "outputDirectory": "tests",
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
  testURL: 'http://localhost/'
}