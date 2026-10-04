@echo off
chcp 65001 >nul
echo ========================================
echo   Setup Project Pseudocode App
echo ========================================
echo.

REM Buat folder project
if not exist "pseudocode-app" mkdir pseudocode-app
cd pseudocode-app

REM Buat folder src
if not exist "src" mkdir src

echo [1/11] Membuat index.html...
(
echo ^<!doctype html^>
echo ^<html lang="id"^>
echo ^<head^>
echo   ^<meta charset="UTF-8" /^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0" /^>
echo   ^<title^>Contoh Pseudocode^</title^>
echo ^</head^>
echo ^<body^>
echo   ^<div id="root"^>^</div^>
echo   ^<script type="module" src="/src/main.tsx"^>^</script^>
echo ^</body^>
echo ^</html^>
) > index.html

echo [2/11] Membuat package.json...
(
echo {
echo   "name": "pseudocode-app",
echo   "private": true,
echo   "version": "1.0.0",
echo   "type": "module",
echo   "scripts": {
echo     "dev": "vite",
echo     "build": "tsc -b ^&^& vite build",
echo     "preview": "vite preview"
echo   },
echo   "dependencies": {
echo     "react": "^18.3.1",
echo     "react-dom": "^18.3.1"
echo   },
echo   "devDependencies": {
echo     "@types/react": "^18.3.12",
echo     "@types/react-dom": "^18.3.1",
echo     "@vitejs/plugin-react": "^4.3.4",
echo     "autoprefixer": "^10.4.20",
echo     "postcss": "^8.4.49",
echo     "tailwindcss": "^3.4.15",
echo     "typescript": "^5.6.3",
echo     "vite": "^6.0.0"
echo   }
echo }
) > package.json

echo [3/11] Membuat vite.config.ts...
(
echo import { defineConfig } from 'vite'
echo import react from '@vitejs/plugin-react'
echo.
echo export default defineConfig({
echo   plugins: [react()],
echo })
) > vite.config.ts

echo [4/11] Membuat tsconfig.json...
(
echo {
echo   "files": [],
echo   "references": [
echo     { "path": "./tsconfig.app.json" },
echo     { "path": "./tsconfig.node.json" }
echo   ]
echo }
) > tsconfig.json

echo [5/11] Membuat tsconfig.app.json...
(
echo {
echo   "compilerOptions": {
echo     "target": "ES2020",
echo     "useDefineForClassFields": true,
echo     "lib": ["ES2020", "DOM", "DOM.Iterable"],
echo     "module": "ESNext",
echo     "skipLibCheck": true,
echo     "moduleResolution": "bundler",
echo     "allowImportingTsExtensions": true,
echo     "isolatedModules": true,
echo     "moduleDetection": "force",
echo     "noEmit": true,
echo     "jsx": "react-jsx",
echo     "strict": true,
echo     "noUnusedLocals": false,
echo     "noUnusedParameters": false,
echo     "noFallthroughCasesInSwitch": true
echo   },
echo   "include": ["src"]
echo }
) > tsconfig.app.json

echo [6/11] Membuat tsconfig.node.json...
(
echo {
echo   "compilerOptions": {
echo     "target": "ES2022",
echo     "lib": ["ES2023"],
echo     "module": "ESNext",
echo     "skipLibCheck": true,
echo     "moduleResolution": "bundler",
echo     "allowImportingTsExtensions": true,
echo     "isolatedModules": true,
echo     "moduleDetection": "force",
echo     "noEmit": true,
echo     "strict": true
echo   },
echo   "include": ["vite.config.ts"]
echo }
) > tsconfig.node.json

echo [7/11] Membuat tailwind.config.js...
(
echo export default {
echo   content: [
echo     "./index.html",
echo     "./src/**/*.{js,ts,jsx,tsx}",
echo   ],
echo   theme: { extend: {} },
echo   plugins: [],
echo }
) > tailwind.config.js

echo [8/11] Membuat postcss.config.js...
(
echo export default {
echo   plugins: {
echo     tailwindcss: {},
echo     autoprefixer: {},
echo   },
echo }
) > postcss.config.js

echo [9/11] Membuat src/main.tsx...
(
echo import React from 'react'
echo import ReactDOM from 'react-dom/client'
echo import App from './App.tsx'
echo import './index.css'
echo.
echo ReactDOM.createRoot(document.getElementById('root')!).render(
echo   ^<React.StrictMode^>
echo     ^<App /^>
echo   ^</React.StrictMode^>,
echo )
) > src\main.tsx

echo [10/11] Membuat src/index.css...
(
echo @tailwind base;
echo @tailwind components;
echo @tailwind utilities;
echo.
echo body { margin: 0; font-family: system-ui, sans-serif; }
) > src\index.css

echo [11/11] Membuat src/App.tsx...
REM File App.tsx terlalu panjang, akan dibuat terpisah
echo.
echo ========================================
echo   File App.tsx akan dibuat terpisah
echo ========================================
echo.

echo.
echo ========================================
echo   Setup selesai! 
echo   SELANJUTNYA:
echo   1. Copy file App.tsx ke folder src/
echo   2. Jalankan: npm install
echo   3. Jalankan: npm run dev
echo ========================================
pause