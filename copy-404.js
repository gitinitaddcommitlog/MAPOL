import fs from 'fs';

// Copy 404.html to docs folder for GitHub Pages SPA routing
fs.copyFileSync('public/404.html', 'docs/404.html');
console.log('✅ 404.html copied to docs/');
