# 语义化搜索页面与 Docker 和 NGINX 部署

该项目是一个我用来与 **memos** 和 **n8n** 集成的语义化搜索页面。用户可以通过搜索 API 输入查询并获得搜索结果，点击查看完整的笔记内容，跳转到 memos 实例。此项目使用 Docker 部署，支持动态配置。

## 功能特性
- **搜索功能**：用户可以输入查询并从 **n8n** API 获取搜索结果。
- **动态链接**：搜索结果提供跳转到 **memos** 的链接。
- **Docker化**：通过 Docker 和 NGINX 提供页面服务，支持环境变量配置 `memosurl` 和 `searchAPIPrefix`。

## 安装与配置

### 1. 克隆项目仓库

```bash
git clone https://github.com/LiangWei88/memos-search.git
cd memos-search
```

### 2. 修改环境变量

在运行 Docker 容器时，设置以下环境变量：

- **MEMOS_URL**：你的 memos 实例 URL。
- **SEARCH_API_PREFIX**：n8n 搜索 API 的前缀。

### 3. 构建 Docker 镜像

```bash
docker build -t memos-search .
```

### 4. 运行 Docker 容器
注意搜索关键字会拼接在的`SEARCH_API_PREFIX` ?q= 的后面，所以请确保你的 API 支持这种格式。

```bash
docker run -d -p 1111:80 \
  -e MEMOS_URL=http://your-memos-instance.com \
  -e SEARCH_API_PREFIX=http://your-n8n-api.com/webhook/search?q= \
  search-page
```

### 5. 访问页面

打开浏览器，访问 `http://localhost:1111` 即可使用搜索页面。

## 目录结构

```
search-page/
│
├── Dockerfile           # Docker 配置文件
├── index.html           # 搜索页面 HTML 文件
└── README.md            # 该 README 文件
```

## 贡献

欢迎提交问题或 PR。

## 许可

该项目使用 MIT 许可协议。
