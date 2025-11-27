# 使用 PHP 8.0 配合 Apache，因为 README 提到推荐环境是 PHP8
FROM php:8.0-apache

# 安装 pdo_mysql 扩展，这是连接 MySQL 必须的
RUN docker-php-ext-install pdo pdo_mysql

# 启用 Apache rewrite 模块（可选，防止部分 URL 路由问题）
RUN a2enmod rewrite

# 将当前目录的所有文件复制到容器的 Web 根目录
COPY . /var/www/html/

# 设置工作目录权限
RUN chown -R www-data:www-data /var/www/html
