module.exports = {
  emptyLineBetweenGroups: false,
  environments: ['node'],
  groupImports: false,
  sortImports: false,
  declarationKeyword({ pathToCurrentFile }) {
    return pathToCurrentFile.endsWith('.ts') ? 'import' : 'const';
  },
  importStatementFormatter({ importStatement }) {
    return importStatement.replace(/;$/, '');
  },
};
