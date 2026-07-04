const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  const page = await browser.newPage();
  await page.setViewport({ width: 1710, height: 1239, deviceScaleFactor: 2 });
  
  await page.goto('https://web.edumips.org', { waitUntil: 'networkidle0' });
  
  const theme = process.argv[3] || 'dark';
  
  // Set theme multiple ways to ensure it catches correctly before rendering
  await page.evaluate((themeMode) => {
    localStorage.setItem('themeMode', themeMode);
    document.documentElement.setAttribute('data-theme', themeMode);
  }, theme);
  
  await page.reload({ waitUntil: 'networkidle0' });
  
  await page.evaluate((themeMode) => {
    localStorage.setItem('themeMode', themeMode);
    document.documentElement.setAttribute('data-theme', themeMode);
  }, theme);

  await page.bringToFront();
  
  // Click the 'Load' button to parse the default code
  await page.click('#load-button');
  await new Promise(r => setTimeout(r, 1000));
  
  // Click the 'Step' button 4 times to be mid-execution
  for (let i = 0; i < 4; i++) {
    try {
      await page.click('#step-button');
      await new Promise(r => setTimeout(r, 500));
    } catch (e) {
      console.log('Error clicking step button:', e);
    }
  }

  await new Promise(r => setTimeout(r, 1000)); // wait for animations to settle
  
  await page.screenshot({ path: process.argv[2] || 'screenshot-web.png' });
  await browser.close();
})();
