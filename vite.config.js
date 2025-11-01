import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  root: resolve(__dirname, 'app'),
  publicDir: resolve(__dirname, 'public'),
  server: {
    port: 3000,
    open: true
  },
  resolve: {
    extensions: ['.js', '.jsx', '.ts', '.tsx']
  },
  base: '/MAPOL/',  // Important for GitHub Pages subpath
  build: {
    outDir: resolve(__dirname, 'docs'),
    assetsDir: 'assets',
    emptyOutDir: true
  }
})
