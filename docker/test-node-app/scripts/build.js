const { execSync } = require('child_process');
const mkdirp = require('mkdirp');
const rimraf = require('rimraf');

const ENV = process.env.npm_config_ENV || 'dev';
const outputDir = `dist/${ENV}`;


rimraf.sync(outputDir);


mkdirp.sync(outputDir);

const fs = require('fs');
const indexHtmlContent = `
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${ENV.toUpperCase()} Build</title>
</head>
<body>
    <h1>Welcome to the ${ENV.toUpperCase()} build!</h1>
</body>
</html>
`;

fs.writeFileSync(`${outputDir}/index.html`, indexHtmlContent);

console.log(`Build completed! Files are in ${outputDir}`);
