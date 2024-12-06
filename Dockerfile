# 使用 NGINX 官方镜像作为基础镜像
FROM nginx:alpine

# 环境变量配置
ENV MEMOS_URL=http://8.134.248.221:5230
ENV SEARCH_API_PREFIX=http://8.134.248.221:5678/webhook/8b6f2954-6681-4751-9ccf-08f13cf4a145?q=

# 复制 index.html 文件到镜像中
COPY index.html /usr/share/nginx/html/index.html

# 使用 sed 命令替换 index.html 文件中的环境变量
RUN sed -i "s|{{SEARCH_API_PREFIX}}|$SEARCH_API_PREFIX|g" /usr/share/nginx/html/index.html
RUN sed -i "s|{{MEMOS_URL}}|$MEMOS_URL|g" /usr/share/nginx/html/index.html

# 暴露 80 端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]