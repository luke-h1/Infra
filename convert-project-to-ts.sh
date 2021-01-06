# rename all JSX files in src/ to TSX
find src -name '*.jsx' -exec bash -c 'git mv "$0" "${0%.jsx}.tsx"' "{}" \;
# rename all JS files in src/ to TS
find src -name '*.js' -exec bash -c 'git mv "$0" "${0%.js}.ts"' "{}" \;
# rename all JSX files in src/ to TSX
find tests -name '*.jsx' -exec bash -c 'git mv "$0" "${0%.jsx}.tsx"' "{}" \;
# rename all JSX files in src/ to TSX
find tests -name '*.jsx.snap' -exec bash -c 'git mv "$0" "${0%.jsx.snap}.tsx.snap"' "{}" \;
# rename all JS files in tests/ to TS
find tests -name '*.js' -exec bash -c 'git mv "$0" "${0%.js}.ts"' "{}" \;