import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  server: {
    https: false, // 是否开启 https
    open: false, // 是否自动在浏览器打开
    cors: true, // 允许跨域
    port: 83, // 端口号
    host: "0.0.0.0",
  },
});
