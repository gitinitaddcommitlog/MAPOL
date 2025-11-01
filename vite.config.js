import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  root: './app',  // THIS IS THE KEY - point to your app directory
  publicDir: '../public',
  server: {
    port: 3000,
    open: true
  },
  resolve: {
    extensions: ['.js', '.jsx', '.ts', '.tsx']
  },
  base: './',
  build: {
    outDir: '../docs',
    assetsDir: 'assets',
    emptyOutDir: true
  }
})
