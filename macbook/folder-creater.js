const fs = require('fs');
const path = require('path');

fs.mkdir(path.join(__dirname, '/srv'), {}, (err) => {
  if (err) throw err;
  console.log('Folder Created');
});

fs.mkdir(path.join(__dirname, '/srv/dev'), {}, (err) => {
  if (err) throw err;
  console.log('Folder created');
});

fs.mkdir(path.join(__dirname, '/Users/lukehowsam/Desktop'), {}, (err) => {
  if (err) throw err;
  console.log('Folder created');
});


fs.mkdir(path.join(__dirname, '/Users/lukehowsam/Desktop/courses'), {}, (err) => {
  if (err) throw err;
  console.log('Folder created');
});


fs.mkdir(path.join(__dirname, '/Users/lukehowsam/notes'), {}, (err) => {
  if (err) throw err;
  console.log('Folder created');
});
