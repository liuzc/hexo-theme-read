
# hexo-theme-read.
A hexo theme based on hexo-theme-next.

![hexo_theme_read](https://github.com/liuzc/hexo-theme-read/raw/master/screenshots/theme_read.png)

## 0x01 背景
博客迁移到Hexo之后，根据之前使用的Wordpress主题在[hexo-theme-next](https://github.com/iissnan/hexo-theme-next)这款主题的基础上做了点修改（主要是首页和文章页面样式）。最近有不少朋友发邮件给我说希望我能分享一下这款主题。其实我本人也是一个开源爱好者，只是hexo-theme-next的作者在分享他的主题的时候没有声明开源协议，而且因为只是在他源码的基础上做的修改，并没有删除没有使用到的代码，导致修改后的代码有点乱。

一直想整理一下，甚至重新开发一款主题再开源，但多次尝试后还是放弃了。一是本人精力确实有限，二是本人也非专业的前端工程师，如果要考虑到响应式设计确实需要花一些精力。如果不能做到精致，还不如开源现在的源码给喜欢的人自己去修改。


## 0x02 使用主题
直接下载本主题到hexo的themes目录然后修改_config.yml的theme字段即可。

```bash
cd yourhexopath/themes
git clone git@github.com:liuzc/hexo-theme-read.git
##修改hexo目录下的_config.yml
 theme: hexo-theme-read 
```

主题配置可以参考：<https://github.com/iissnan/hexo-theme-next/wiki>,其中部分内容对修改后的主题仍然适用例如创建页面和菜单设置等，但也有些不再适用例如侧边栏的设置等。

我使用的一些插件:
* hexo-autonofollow
* hexo-clean-css
* hexo-generator-baidu-sitemap
* hexo-html-minifier
* hexo-uglify

## 0x03 修改帮助
因为我在原主题基础上做了一些个性化的修改，你需要将这些信息替换为你自己的信息。

1. Logo
修改`hexo-theme-read/_config.yml`中的`custom_logo_image`字段.

```bash
custom_logo_image: '/images/me/me256.png'
```

2.About 页面
修改`hexo-theme-read/_partials/about.swig`中的内容为你自己的信息。
![theme_about](https://github.com/liuzc/hexo-theme-read/raw/master/screenshots/theme_about.png)

3.点击文章页面的赏按钮后弹出的支付宝和微信收款二维码
修改`hexo-theme-read/_partials/reward.swig`中的图片链接。
(当然，如果你不修改，我也不会介意的啊。)
如果你不想添加这个按钮，修改`hexo-theme-read/_macro/post.swig`找到如下代码，直接删除即可。

```swig
     {% if is_post() %}
     {% include '../_partials/reward.swig' %}
     {% endif %}
```
![theme_reward](https://github.com/liuzc/hexo-theme-read/raw/master/screenshots/theme_reward.png)

4. 文章结尾的版本声明
修改`hexo-theme-read/_macro/post.swig`代到如下代码，然后改为你自己的声明：

```swig
  {% if is_post() %}
      <div class="copyright">
       <strong>本文链接: </strong>{{ url_for(post.permalink) }} </br>
       <strong>版权声明: </strong>本博客所有文章除特别声明外，均采用<a href="http://creativecommons.org/licenses/by-nc-sa/3.0/cn/" rel="external nofollow" target="_blank"> CC BY-NC-SA 3.0 CN </a>许可协议进行许可。转载请注明出处！</br>
      </div>
      {% endif %}
```

5.`hexo-theme-next/scripts/filters/concat.js`
因为我是使用的Tengine，可以将多个css和js请求合并为一个请求，这样优化网页的请求速度，详细介绍请看这里：[Hexo优化之合并css和js请求](https://liuzhichao.com/2016/hexo-concat-css-js.html)
如果你没有使用Tengine，那么你不能开启这个功能。

6.`hexo-theme-next/scripts/filters/lazyloadimg.js`
我将博客的所有图片都托管在了七牛云，也对于图片做了懒加载处理，所以也开发了这样一个脚本做图片的替换操作。
详细介绍请看这里：[Hexo优化之图片懒加载和CDN托管静态资源](https://liuzhichao.com/2016/hexo-cdn-lazyload.html)
你需要修改这个中的`baseUrl`为你的cdn的域名。


7.hexo根目录_config.yml的一些配置

```bash
## 关闭代码高亮
highlight:
  enable: false
  line_number: false
  auto_detect: false
  tab_replace:

## 不同的页面显示不同的文章数
## page页面每页显示20  
per_page: 20
pagination_dir: page

## 首页显示5
index_generator:
  per_page: 5

## archive页显示20
archive_generator:
  per_page: 20
  yearly: true
  monthly: true

## tag页显示5
tag_generator:
  per_page: 10
```

刚在测试主题的时候出现了个莫名其妙的错误，最后发现是因为关闭了代码高亮，已经反馈给开发者：<https://github.com/hexojs/hexo/issues/1777>
我是重新init了一个博客目录，然后下载主题测试出现的问题，在自己原先的博客目录又没有问题，也有可能是hexo依赖的node_modules更新导致的。如果你也遇到了此问题，可以先开启代码高亮（默认是开启的）。


## 0x04 感谢
再次强调本主题是在[hexo-theme-next](https://github.com/iissnan/hexo-theme-next)这款主题的基础上修改的。向[原作者](http://iissnan.com/)表示感谢！
